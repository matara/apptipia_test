angular.module "templates", []
angular.module 'WebUi.config', ['ngRoute', 'templates']
angular.module 'WebUi.controllers', []
angular.module 'WebUi.3dparties', ['mm.foundation']

window.WebUi = angular.module 'WebUi', [
  'WebUi.config'
  'WebUi.controllers'
  'WebUi.3dparties'
]