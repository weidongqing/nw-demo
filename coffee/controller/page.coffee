do ->
  pageCtrl = ($scope,$uibModalInstance) ->
    $scope.name = '页面一'
    return

  angular.module 'app'
    .controller 'pageController', [
      '$scope'
      pageCtrl
      ]
  return
