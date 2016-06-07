#测试文件
KoModel = ()->
  self = @
  self.urls = {}

  self.Init = () ->
    #模式1,默认选种 年月日
    new YearMonthDaySelect
      initSelect: 2
      yearDefault: 'year'
      monthDefault: 'month'
      dayDefault: 'day'

      yearInterval: 10
      yearTitle: '年'
      yearID: 'test_sl_year'
      yearName: 'test_sl_year_name'
      yearClass: 'test_sl_year_class otherclassname'

      monthTitle: '月'
      monthID: 'test_sl_month'
      monthName: 'test_sl_month_name'
      monthClass: 'test_sl_month_class otherclassname'

      dayTitle: '日'
      dayID: 'test_sl_day'
      dayName: 'test_sl_day_name'
      dayClass: 'test_sl_day_class otherclassname'
    return

    # #模式2, 默认选中 当前 年月日
    # new YearMonthDaySelect
    #   initSelect: 2

    #   yearInterval: 10
    #   yearTitle: '年'
    #   yearID: 'test_sl_year'
    #   yearName: 'test_sl_year_name'
    #   yearClass: 'test_sl_year_class otherclassname'

    #   monthTitle: '月'
    #   monthID: 'test_sl_month'
    #   monthName: 'test_sl_month_name'
    #   monthClass: 'test_sl_month_class otherclassname'

    #   dayTitle: '日'
    #   dayID: 'test_sl_day'
    #   dayName: 'test_sl_day_name'
    #   dayClass: 'test_sl_day_class otherclassname'
    # return


    # #模式3, 默认选中 当前 年,1月,1日
    # new YearMonthDaySelect
    #   initSelect: 3

    #   yearInterval: 10
    #   yearTitle: '年'
    #   yearID: 'test_sl_year'
    #   yearName: 'test_sl_year_name'
    #   yearClass: 'test_sl_year_class otherclassname'

    #   monthTitle: '月'
    #   monthID: 'test_sl_month'
    #   monthName: 'test_sl_month_name'
    #   monthClass: 'test_sl_month_class otherclassname'

    #   dayTitle: '日'
    #   dayID: 'test_sl_day'
    #   dayName: 'test_sl_day_name'
    #   dayClass: 'test_sl_day_class otherclassname'
    # return

    # 无论处于何种模式下,只要传入了默认值则选中指定的年月日,
    # new YearMonthDaySelect
    #   initYear: 2013
    #   initMonth: 3
    #   initDay: 2

    #   yearInterval: 10
    #   yearTitle: '年'
    #   yearID: 'test_sl_year'
    #   yearName: 'test_sl_year_name'
    #   yearClass: 'test_sl_year_class otherclassname'

    #   monthTitle: '月'
    #   monthID: 'test_sl_month'
    #   monthName: 'test_sl_month_name'
    #   monthClass: 'test_sl_month_class otherclassname'

    #   dayTitle: '日'
    #   dayID: 'test_sl_day'
    #   dayName: 'test_sl_day_name'
    #   dayClass: 'test_sl_day_class otherclassname'
    # return


  self.ShowSL = () ->
    year = $("#test_sl_year option:selected").val()
    month = $("#test_sl_month option:selected").val()
    day = $("#test_sl_day option:selected").val()
    $("#span").text year + '-' + month + '-' + day

  ko.computed ()->
    self.Init()

    return

  return

ko.applyBindings new KoModel()






