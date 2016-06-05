#测试文件
KoModel = ()->
  self = @
  self.urls = {}

  self.Init = () ->
    # new YearMonthDaySelect
    #   initSelect: true
    #   # initYear: 2013
    #   # initMonth: 3
    #   # initDay: 2

    #   yearInterval: 10
    #   yearTitle: '年'
    #   yearID: 'test_sl_year'
    #   yearName: 'test_sl_year_name'
    #   yearClass: 'test_sl_year_class otherclassname'

    #   monthTitle: '月'
    #   monthID: 'test_sl_month'
    #   monthName: 'test_sl_month_name'
    #   monthClass: 'test_sl_month_class otherclassname'

    #   dayTitle: '天'
    #   dayID: 'test_sl_day'
    #   dayName: 'test_sl_day_name'
    #   dayClass: 'test_sl_day_class otherclassname'
    # return


    # new YearMonthDaySelect
    #   # initSelect: true
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

    #   dayTitle: '天'
    #   dayID: 'test_sl_day'
    #   dayName: 'test_sl_day_name'
    #   dayClass: 'test_sl_day_class otherclassname'
    # return


    new YearMonthDaySelect
      # initSelect: true
      # initYear: 2013
      # initMonth: 3
      # initDay: 2

      yearInterval: 10
      yearTitle: '年'
      yearID: 'test_sl_year'
      yearName: 'test_sl_year_name'
      yearClass: 'test_sl_year_class otherclassname'

      monthTitle: '月'
      monthID: 'test_sl_month'
      monthName: 'test_sl_month_name'
      monthClass: 'test_sl_month_class otherclassname'

      dayTitle: '天'
      dayID: 'test_sl_day'
      dayName: 'test_sl_day_name'
      dayClass: 'test_sl_day_class otherclassname'
    return

    
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






