angular.module 'WebUi.controllers'
.controller 'DashboardCtrl', ['$scope', ($scope) ->
  settings = window.WebUiSettings
  $scope.transport_systems = settings.transport_systems
  $scope.currentTransportSystem = null

  $scope.total = 0

  $scope.parcel = {
    width: 0,
    length: 0,
    height: 0,
    weight: 0
  }

  $scope.changeSystem = (system) ->
    $scope.currentTransportSystem = system
    $scope.recalculate()

  $scope.recalculate = () ->
    return unless $scope.currentTransportSystem
    if isWeightAvailable()
      $scope.error_message = ''
      $scope.total = settings.move_fast_fee + $scope.currentTransportSystem.fee +
        $scope.currentTransportSystem.price_per_kg * $scope.parcel.weight
    else
      $scope.total = ''
      $scope.error_message = 'This parcel is over processing limits and could not be delivered.'

  isWeightAvailable = () ->
    $scope.parcel.weight <= $scope.currentTransportSystem.processable_weight
]