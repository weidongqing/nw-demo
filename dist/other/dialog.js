// Generated by CoffeeScript 1.12.7
(function() {
  var dialogCtrl;

  dialogCtrl = function($scope, $uibModalInstance, $log) {
    $scope.password = '';
    $scope.cancel = function() {
      $log.log('cancel');
      return $uibModalInstance.dismiss();
    };
    return $scope.confirm = function() {
      $log.log($scope.name);
      return $log.log($scope.password);
    };
  };

  angular.module('app').controller('dialogController', ['$scope', '$uibModalInstance', '$log', dialogCtrl]);

}).call(this);
