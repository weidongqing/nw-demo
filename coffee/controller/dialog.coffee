dialogCtrl = ($scope,$uibModalInstance,$log) ->
  $scope.password=''
  $scope.cancel = ->
    $log.log 'cancel'
    $uibModalInstance.dismiss()

  $scope.confirm = ->
    $log.log($scope.name)
    $log.log($scope.password)

angular.module 'app'
  .controller 'dialogController', [
    '$scope'
    '$uibModalInstance'
    '$log'
    dialogCtrl
    ]
