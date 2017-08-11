'use strict'
# app=angular.module 'app', [
angular.module 'app', [
  'ui.router'
  'ui.bootstrap'
  'ui.bootstrap.modal'
  'ui.grid'
  'ui.grid.selection'
  'ui.grid.edit'
  'ui.grid.exporter'
  'ui.grid.pagination'
  'ui.grid.resizeColumns'
  'ui.grid.autoResize'
  'app.controller'
]
.config ['$stateProvider', '$urlRouterProvider', '$compileProvider', ($stateProvider, $urlRouterProvider, $compileProvider) ->
    $compileProvider.aHrefSanitizationWhitelist /^\s*(chrome-extension):/
    $compileProvider.imgSrcSanitizationWhitelist /^\s*(https?|local|data|chrome-extension):/
    $urlRouterProvider.when '' ,'/PageTab'
    $stateProvider.state 'welcome',
      url: '/welcome'
      templateUrl: 'view/welcome.html'
    $stateProvider.state 'PageTab',
      url: '/PageTab'
      templateUrl: 'view/PageTab.html'
      controller: 'pageTabController'
    .state 'PageTab.page',
      url: '/page'
      templateUrl: 'view/page.html'
      controller: 'pageController'
    .state 'dialog',
      url: '/dialog'
      templateUrl: 'view/dialog.html'
      controller: 'dialogController'
    .state 'PageTab.uiGrid',
      url: '/uiGrid'
      templateUrl: 'view/uiGrid.html'
      # controller: 'uiGridController'
      controller: 'uiGridCtrl'
    return
  ]
.filter 'mapGender' , ->
  genderHash =
    1: '男',
    2: '女'
  return (input)->
    if !input
      return ''
    else
      return genderHash[input]
do ->
  angular.module 'app.controller', []
  return
