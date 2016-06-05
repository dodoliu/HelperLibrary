class YearMonthDaySelect

  #依赖
  #jquery.js
  #helper.js
  #knockout.js

  #参数说明
  #initSelect: {bool} 下拉选项的默认值,默认为当前年的1月1日,false为默认值
  #initYear: {int} 默认选择的年份,优先级比 initSelect 高
  #initMonth: {int} 默认选择的月份,优先级比 initSelect 高
  #initDay: {int} 默认选择的天,优先级比 initSelect 高

  #yearTitle: {string} 年份的title,默认值为 '年'
  #yearID: {string} 年份下拉的id属性,默认值为 'sl_year'
  #yearName: {string} 年份下拉的name属性,默认值为 'sl_year_name'
  #yearClass: {string} 年份下拉的class属性,默认值为 'sl_year_class'
  #yearInterval: {int} 绑定的年份前后间隔年数,默认值为5,意为当前年的前5年和后5年

  #monthTitle: {string} 年份的title,默认值为 '月'
  #monthID: {string} 年份下拉的id属性,默认值为 'sl_month'
  #monthName: {string} 年份下拉的name属性,默认值为 'sl_month_name'
  #monthClass: {string} 年份下拉的class属性,默认值为 'sl_month_class'

  #dayTitle: {string} 年份的title,默认值为 '日'
  #dayID: {string} 年份下拉的id属性,默认值为 'sl_day'
  #dayName: {string} 年份下拉的name属性,默认值为 'sl_day_name'
  #dayClass: {string} 年份下拉的class属性,默认值为 'sl_day_class'

  #全局参数
  gParams = {}

  constructor: (args) ->
    gParams = args

  koTemplateA =
    '
    <div data-bind="template:{name:\'sl_year_month_day\',data:yearObj}"></div>
    <div data-bind="template:{name:\'sl_year_month_day\',data:monthObj}"></div>
    <div data-bind="template:{name:\'sl_year_month_day\',data:dayObj}"></div>

    <script type="text/template" id="sl_year_month_day">
      <select data-bind="attr:{id:$data.id,name:$data.name,class:$data.class},event:{change:$data.changeEvent},foreach:$data.dataArray,selectedOptions:[$data.selectedValue]">
        <option data-bind="value:$data.key,text:$data.value"></option>
      </select>
      <span data-bind="text:$data.title"></span>
    </script>
    '
  koTemplateB =
    '
    <div data-bind="template:{name:\'sl_year_month_day\',data:yearObj}"></div>
    <div data-bind="template:{name:\'sl_year_month_day\',data:monthObj}"></div>

    <script type="text/template" id="sl_year_month_day">
      <select data-bind="attr:{id:$data.id,name:$data.name,class:$data.class},event:{change:$data.changeEvent},foreach:$data.dataArray,selectedOptions:[$data.selectedValue]">
        <option data-bind="value:$data.key,text:$data.value"></option>
      </select>
      <span data-bind="text:$data.title"></span>
    </script>
    '

  KoViewModel = (params) ->
    selfVM = @
    selfVM.yearObj = ko.observableArray()
    selfVM.monthObj = ko.observableArray()
    selfVM.dayObj = ko.observableArray()

    #defaultValue: 用于设置被选中的默认值
    selfVM.GenerateYearArray = (defaultValue) ->
      tmpDate = new Date()
      tmpDataArray = []
      tmpInterval = if gParams.yearInterval? then gParams.yearInterval else 5
      for i in [tmpDate.getFullYear()-tmpInterval ... tmpDate.getFullYear()+tmpInterval]
        tmpDataArray.push
          key: i
          value: i
      tmpYearTitle = if gParams.yearTitle? then gParams.yearTitle else '年'
      tmpYearID = if gParams.yearID? then gParams.yearID else 'sl_year'
      tmpYearName = if gParams.yearName? then gParams.yearName else 'sl_year_name'
      tmpYearClass = if gParams.yearClass? then gParams.yearClass else 'sl_year_class'
      tmpYear =
        title: tmpYearTitle #年
        id: tmpYearID #下拉框的id
        name: tmpYearName #元素的name属性
        class: tmpYearClass #元素的class属性
        changeEvent: selfVM.ChangeYear #选择事件触发的函数
        selectedValue: defaultValue #默认被选中的值
        dataArray: tmpDataArray #需要绑定的数组
      selfVM.yearObj tmpYear

    #defaultValue: 用于设置被选中的默认值
    selfVM.GenerateMonthArray = (defaultValue) ->
      tmpDataArray = []
      for i in [1 .. 12]
        tmpDataArray.push
          key: i
          value: i
      tmpMonthTitle = if gParams.monthTitle? then gParams.monthTitle else '月'
      tmpMonthID = if gParams.monthID? then gParams.monthID else 'sl_month'
      tmpMonthName = if gParams.monthName? then gParams.monthName else 'sl_month_name'
      tmpMonthClass = if gParams.monthClass? then gParams.monthClass else 'sl_month_class'
      tmpMonth =
        title: tmpMonthTitle
        id: tmpMonthID #下拉框的id
        name: tmpMonthName #name
        class: tmpMonthClass #class
        changeEvent: selfVM.ChangeMonth #选择事件触发的函数
        selectedValue: defaultValue #默认被选中的值
        dataArray: tmpDataArray #需要绑定的数组
      selfVM.monthObj tmpMonth

    #year:指定年
    #month:指定月
    #defaultValue:用于设置被选中的默认值
    selfVM.GenerateDayArray = (year,month,defaultValue) ->
      tmpDataArray = []
      for i in [1 .. "#{Helper.FindDaysInMonth(year,month)}"]
        tmpDataArray.push
          key: i
          value: i

      tmpDayTitle = if gParams.dayTitle? then gParams.dayTitle else '日'
      tmpDayID = if gParams.dayID? then gParams.dayID else 'sl_day'
      tmpDayName = if gParams.dayName? then gParams.dayName else 'sl_day_name'
      tmpDayClass = if gParams.dayClass? then gParams.dayClass else 'sl_day_class'
      tmpDay =
        title: tmpDayTitle
        id: tmpDayID #下拉框的id
        name: tmpDayName #name
        class: tmpDayClass #class
        changeEvent: selfVM.ChangeDay #选择事件触发的函数
        selectedValue: defaultValue #默认被选中的值
        dataArray: tmpDataArray #需要绑定的数组
      selfVM.dayObj tmpDay

    selfVM.ChangeYear = (arg) ->
      selfVM.GenerateMonthArray 1
      selfVM.GenerateDayArray $("##{arg.id} option:selected").val(),1,1

    selfVM.ChangeMonth = (arg) ->
      selfVM.GenerateDayArray $("##{arg.id} option:selected").val(),1,1

    selfVM.ChangeDay = (arg) ->

    selfVM.Init = () ->
      if gParams.initYear || gParams.initMonth || gParams.initDay
        selfVM.GenerateYearArray gParams.initYear
        selfVM.GenerateMonthArray gParams.initMonth
        selfVM.GenerateDayArray gParams.initYear, gParams.initMonth, gParams.initDay
      else
        tmpDate = new Date()
        tmpYear = tmpDate.getFullYear()
        selfVM.GenerateYearArray tmpYear
        if gParams.initSelect
          tmpMonth = tmpDate.getMonth() + 1
          tmpDay = tmpDate.getDate()
          selfVM.GenerateMonthArray tmpMonth
          selfVM.GenerateDayArray tmpYear,  tmpMonth, tmpDay
        else
          selfVM.GenerateMonthArray 1
          selfVM.GenerateDayArray tmpYear, 1, 1

    selfVM.Init()

  ko.components.register 'year_month_day_select_a',
    template: koTemplateA
    viewModel: (params) ->
      KoViewModel params

  ko.components.register 'year_month_day_select_b',
    template: koTemplateB
    viewModel: (params) ->
      KoViewModel params