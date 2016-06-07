class YearMonthDaySelect

  #依赖
  #jquery.js
  #helper.js
  #knockout.js

  #参数说明
  #initSelect: {int} 下拉选项的默认值,默认模式为1,有几种模式,1:默认选中年月日;2:默认选中当前年月日;3:默认选中当前年1月1日,
  #initYear: {int} 默认选择的年份,优先级比 initSelect 高
  #initMonth: {int} 默认选择的月份,优先级比 initSelect 高
  #initDay: {int} 默认选择的天,优先级比 initSelect 高

  #yearTitle: {string} 年份的title,默认值为 '年'
  #yearDefault: {string} 当下拉没有选种时,选择该默认值
  #yearID: {string} 年份下拉的id属性,默认值为 'sl_year'
  #yearName: {string} 年份下拉的name属性,默认值为 'sl_year_name'
  #yearClass: {string} 年份下拉的class属性,默认值为 'sl_year_class'
  #yearInterval: {int} 绑定的年份前后间隔年数,默认值为5,意为当前年的前5年和后5年

  #monthTitle: {string} 年份的title,默认值为 '月'
  #monthDefault: {string} 当下拉没有选种时,选择该默认值
  #monthID: {string} 年份下拉的id属性,默认值为 'sl_month'
  #monthName: {string} 年份下拉的name属性,默认值为 'sl_month_name'
  #monthClass: {string} 年份下拉的class属性,默认值为 'sl_month_class'

  #dayTitle: {string} 年份的title,默认值为 '日'
  #dayDefault: {string} 当下拉没有选种时,选择该默认值
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
      tmpInterval = selfVM.IfThenElse gParams.yearInterval, 5
      tmpYearDefault = selfVM.IfThenElse gParams.yearDefault, '年'
      tmpDataArray.push key:-1, value: tmpYearDefault
      for i in [tmpDate.getFullYear()-tmpInterval ... tmpDate.getFullYear()+tmpInterval]
        tmpDataArray.push
          key: i
          value: i
      tmpYearTitle = selfVM.IfThenElse gParams.yearTitle, '年'
      tmpYearID = selfVM.IfThenElse gParams.yearID, 'sl_year'
      tmpYearName = selfVM.IfThenElse gParams.yearName, 'sl_year_name'
      tmpYearClass = selfVM.IfThenElse gParams.yearClass, 'sl_year_class'
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
      tmpMonthDefault = selfVM.IfThenElse gParams.monthDefault, '年'
      tmpDataArray.push key:-1, value: tmpMonthDefault
      for i in [1 .. 12]
        tmpDataArray.push
          key: i
          value: i
      tmpMonthTitle = selfVM.IfThenElse gParams.monthTitle, '月'
      tmpMonthID = selfVM.IfThenElse gParams.monthID, 'sl_month'
      tmpMonthName = selfVM.IfThenElse gParams.monthName, 'sl_month_name'
      tmpMonthClass = selfVM.IfThenElse gParams.monthClass, 'sl_month_class'
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
      tmpDayDefault = selfVM.IfThenElse gParams.dayDefault, '日'
      tmpDataArray.push key:-1, value: tmpDayDefault
      for i in [1 .. "#{Helper.FindDaysInMonth(year,month)}"]
        tmpDataArray.push
          key: i
          value: i

      tmpDayTitle = selfVM.IfThenElse gParams.dayTitle, '日'
      tmpDayID = selfVM.IfThenElse gParams.dayID, 'sl_day'
      tmpDayName = selfVM.IfThenElse gParams.dayName, 'sl_day_name'
      tmpDayClass = selfVM.IfThenElse gParams.dayClass, 'sl_day_class'
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
      currValue = $("##{arg.id} option:selected").val()
      if currValue is (selfVM.IfThenElse gParams.yearDefault, '-1')
        selfVM.GenerateMonthArray -1
        selfVM.GenerateDayArray 1970, 1, gParams.dayDefault
      else
        selfVM.GenerateMonthArray (selfVM.IfThenElse gParams.yearDefault, '-1')
        selfVM.GenerateDayArray currValue, -1, -1

    selfVM.ChangeMonth = (arg) ->
      currValue = $("##{arg.id} option:selected").val()
      selectedYear = $("##{gParams.yearID} option:selected").val()
      selectedMonth = $("##{gParams.monthID} option:selected").val()
      if currValue is (selfVM.IfThenElse gParams.monthDefault, '-1')
        selfVM.GenerateDayArray selectedYear, selectedMonth, gParams.dayDefault
      else        
        selfVM.GenerateDayArray selectedYear, selectedMonth, 1

    selfVM.ChangeDay = (arg) ->

    selfVM.Init = () ->
      if gParams.initYear || gParams.initMonth || gParams.initDay
        selfVM.GenerateYearArray gParams.initYear
        selfVM.GenerateMonthArray gParams.initMonth
        selfVM.GenerateDayArray gParams.initYear, gParams.initMonth, gParams.initDay
      else
        tmpDate = new Date()
        tmpYear = tmpDate.getFullYear()
        switch gParams.initSelect
          when 3
            selfVM.GenerateYearArray tmpYear
            selfVM.GenerateMonthArray 1
            selfVM.GenerateDayArray tmpYear, 1, 1
          when 2
            tmpMonth = tmpDate.getMonth() + 1
            tmpDay = tmpDate.getDate()            
            selfVM.GenerateYearArray tmpYear
            selfVM.GenerateMonthArray tmpMonth
            selfVM.GenerateDayArray tmpYear,  tmpMonth, tmpDay
          else
            tmpYear = selfVM.IfThenElse gParams.yearDefault, '-1'
            tmpMonth = selfVM.IfThenElse gParams.monthDefault, '-1'
            tmpDay = selfVM.IfThenElse gParams.dayDefault, '-1'
            selfVM.GenerateYearArray tmpYear
            selfVM.GenerateMonthArray tmpMonth
            selfVM.GenerateDayArray tmpYear, tmpMonth, tmpDay

    selfVM.IfThenElse = (value,elseValue)->
      return if value? then value else elseValue
      
    selfVM.Init()

  ko.components.register 'year_month_day_select_a',
    template: koTemplateA
    viewModel: (params) ->
      KoViewModel params

  ko.components.register 'year_month_day_select_b',
    template: koTemplateB
    viewModel: (params) ->
      KoViewModel params