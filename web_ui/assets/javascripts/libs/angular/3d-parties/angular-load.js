/* angular-load.js / v0.2.0 / (c) 2014 Uri Shaked / MIT Licence */

(function () {
    'use strict';

    angular.module('angularLoad', [])
        .service('angularLoad', ['$document', '$q', '$timeout', function ($document, $q, $timeout) {

            /**
             * Dynamically loads the given script
             * @param src The url of the script to load dynamically
             * @returns {*} Promise that will be resolved once the script has been loaded.
             */
            this.loadScript = function (src) {
                var deferred = $q.defer();
                var script = $document[0].createElement('script');
                script.onload = script.onreadystatechange = function (e) {
                    $timeout(function () {
                        deferred.resolve(e);
                    });
                };
                script.onerror = function (e) {
                    $timeout(function () {
                        deferred.reject(e);
                    });
                };
                script.src = src;
                $document[0].body.appendChild(script);
                return deferred.promise;
            };

            /**
             * Dynamically loads the given CSS file
             * @param href The url of the CSS to load dynamically
             * @returns {*} Promise that will be resolved once the CSS file has been loaded.
             */
            this.loadCSS = function loadCSS( href ){
                var deferred = $q.defer();
                var ss = $document[0].createElement( "link" );
                var ref = $document[0].head;
                var sheets = window.document.styleSheets;
                ss.rel = "stylesheet";
                ss.href = href;
                // temporarily, set media to something non-matching to ensure it'll fetch without blocking render
//                ss.media = "only x";
                // inject link
                ref.parentNode.insertBefore( ss, ref );
                // This function sets the link's media back to `all` so that the stylesheet applies once it loads
                // It is designed to poll until document.styleSheets includes the new sheet.
                var cancelTimer, checkTimer;
                function checkLoaded() {
                    var defined;
                    for( var i = 0; i < sheets.length; i++ ){
                        if( sheets[ i ].href && sheets[ i ].href.indexOf( href ) > -1 ){
                            defined = true;
                        }
                    }
                    if( defined ){
//                        ss.media = "all";
                        $timeout.cancel(cancelTimer);
                        deferred.resolve(href)
                    } else {
                        checkTimer = $timeout(checkLoaded, 250);
                    }
                }

                function cancelLoad() {
//                    ss.media = "all";
                    $timeout.cancel(checkTimer);
                    deferred.reject('timeout')
                }

                cancelTimer = $timeout(cancelLoad, 30000);
                checkTimer = $timeout(checkLoaded, 250);
                return deferred.promise;
            }
        }]);
})();