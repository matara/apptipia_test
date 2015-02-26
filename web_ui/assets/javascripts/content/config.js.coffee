angular.module 'WebUi.config'
.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
  .when '/dashboard',
    templateUrl: '/templates/dashboard.html'
    controller: 'DashboardCtrl'

  $routeProvider.otherwise redirectTo: '/dashboard'

  return
]