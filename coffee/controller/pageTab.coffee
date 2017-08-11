
  pageTabCtrl = ($scope,$uibModal) ->
    # 加载gui
    # gui = require('nw.gui')
    # win = gui.Window.get()
    # $scope.creatModal = ->
    #   $uibModal.open
    #      templateUrl: './view/dialog.html'
    #      controller: 'dialogController'
    #      backdrop: 'static'
    # return

    gui = require('nw.gui')
    win = gui.Window.get()
    $scope.creatModal = ->
      $uibModal.open
        templateUrl: './view/dialog.html'
        controller: 'dialogController'
        backdrop: 'static'
    $scope.full = ->
      win.enterFullscreen();
    $scope.exitFull = ->
      win.leaveFullscreen()
    $scope.closeWindow = ->
      win.close()
    return
  angular.module 'app'
    .controller 'pageTabController' , [
      '$scope'
      '$uibModal'
      pageTabCtrl
    ]
