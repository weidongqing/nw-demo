# app.controller 'uiGridController' , ($scope,$log,i18nService) ->
uiGridController= ($scope,$log,i18nService,uiGridConstants) ->
  i18nService.setCurrentLang("zh-cn");
  $scope.highlightFilteredHeader = (row,rowRenderIndex,col,colRenderIndex) ->
    if col.filters[0].term
      return 'header-filtered'
    else
      return ''
  $scope.gridOptions=
    data: 'myData'
    columnDefs:[
      {
        field: 'name'
        displayName: '名字'
        width: '10%'
        enableColumnMenu: false
        enableHiding: false
        suppressRemoveSort: true
        enableCellEdit: false
        headerCellClass: $scope.highlightFilteredHeader
      },
      {
        field:'gender',
        filter:
          term: ''
          type: uiGridConstants.filter.SELECT
          selectOptions:[
            {
              value: '1'
              label: '男'
            },
            {
              value:'2'
              label:'女'
            }
          ]
        cellFilter: 'mapGender'
        headerCellClass: $scope.highlightFilteredHeader
      },
      {
        field:'age'
      },
      {
        field:'birthday'
      },
      {
        field:'salary'
      }
    ],
    enableFiltering: true
    enableSorting: true
    useExternalSorting: false
    enableGridMenu: true
    showGridFooter: true
    enableHorizontalScrollbar: 1
    enableVerticalScrollbar: 0
    enablePagination: true #是否分页，默认为true
    enablePaginationControls: true #使用默认的底部分页
    paginationPageSizes: [10, 15, 20] #每页显示个数可选项
    paginationCurrentPage: 1 #当前页码
    paginationPageSize: 10 #每页显示个数
    # paginationTemplate:"<div></div>" #自定义底部分页代码
    totalItems: 0 #总数量
    useExternalPagination: true #是否使用分页按钮
    enableFooterTotalSelected: true # 是否显示选中的总数，默认为true, 如果显示，showGridFooter 必须为true
    enableFullRowSelection: true #是否点击行任意位置后选中,默认为false,当为true时，checkbox可以显示但是不可选中
    enableRowHeaderSelection: true #是否显示选中checkbox框 ,默认为true
    enableRowSelection: true # 行选择是否可用，默认为true;
    enableSelectAll: true #选择所有checkbox是否可用，默认为true;
    enableSelectionBatchEvent: true #默认true
    modifierKeysToMultiSelect: false
    multiSelect: true
    noUnselect: false
    selectionRowHeaderWidth: 30;
    # 初始默认选中的行
    isRowSelectable : (row) ->
      if row.entity.age > 45
        row.grid.api.selection.selectRow(row.entity)
        return
    # 对选中行操作

    onRegisterApi : (gridApi) ->
      $scope.gridApi = gridApi
      gridApi.pagination.on.paginationChanged($scope,(newPage,pageSize)->
        if getPage
          getPage(newPage,pageSize)
          return
        )
      $scope.gridApi.selection.on.rowSelectionChanged($scope,(row,event)->
        if row
          $scope.testRow=row.entity
          return
        )
      return
  getPage=(curPage, pageSize)->
    firstRow=(curPage-1)*pageSize
    $scope.gridOptions.totalItems = mydefalutData.length
    $scope.gridOptions.data = mydefalutData.slice(firstRow, firstRow + pageSize)
    for row , index in mydefalutData
      if row.gender == '男'
        row.gender = '1'
      else
        row.gender = '2'
    return
  mydefalutData = [
    {
      name: "Moroni"
      gender : "男",
      age: 50
      birthday: "Oct 28, 1970"
      salary: "60,000"
    },
    {
      name: "Ani"
      gender : "女",
      age: 60
      birthday: "Oct 2, 1979"
      salary: "10,000"
    },
    {
      name: "Nephi",
      gender : "男",
      age: 29,
      birthday: "May 31, 2010",
      salary: "40,000"
    },
    {
      name: "Enos",
      gender : "女",
      age: 34,
      birthday: "Aug 3, 2008",
      salary: "30,000"
    },
    {
      name: "Moroni",
      gender : "女",
      age: 50,
      birthday: "Oct 28, 1970",
      salary: "60,000"
    },
    {
      name: "Tiancum",
      gender : "男",
      age: 43,
      birthday: "Feb 12, 1985",
      salary: "70,000"
    },
    {
      name: "Jacob",
      gender : "女",
      age: 27,
      birthday: "Aug 23, 1983",
      salary: "40,000"
    },
    {
      name: "Nephi",
      gender : "男",
      age: 29,
      birthday: "May 31, 2010",
      salary: "50,000"
    },
    {
      name: "Enos",
      gender : "男",
      age: 34,
      birthday: "Aug 3, 2008",
      salary: "30,000"
    },
    {
      name: "Moroni",
      gender : "女",
      age: 50,
      birthday: "Oct 28, 1970",
      salary: "60,000"
    },
    {
      name: "Tiancum",
      gender : "女",
      age: 43,
      birthday: "Feb 12, 1985",
      salary: "70,000"
    },
    {
      name: "Jacob",
      gender : "女",
      age: 27,
      birthday: "Aug 23, 1983",
      salary: "40,000"
    },
    {
      name: "Nephi",
      gender : "男",
      age: 29,
      birthday: "May 31, 2010",
      salary: "50,000"
    },
    {
      name: "Enos",
      gender : "女",
      age: 34,
      birthday: "Aug 3, 2008",
      salary: "30,000"
    }
    ]
  getPage(1, $scope.gridOptions.paginationPageSize)
  return
angular.module 'app.controller'
  .controller 'uiGridCtrl', [
    '$scope'
    '$log'
    'i18nService'
    'uiGridConstants'
    uiGridController
    ]
