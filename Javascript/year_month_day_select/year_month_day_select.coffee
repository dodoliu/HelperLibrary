KoModel = ()->
  self = @
  self.urls = {}

  self.yearObj = ko.observableArray()
  self.monthObj = ko.observableArray()
  self.dayObj = ko.observableArray()

  #defaultValue: 用于设置被选中的默认值
  self.GenerateYearArray = (defaultValue) ->
    tmpDate = new Date()
    tmpDataArray = []
    for i in [tmpDate.getFullYear()-5 ... tmpDate.getFullYear()+5]
      tmpDataArray.push
        key: i
        value: i
    tmpYear =
      id:'sl_year' #下拉框的id
      name: 'sl_year_name' #name
      class: 'sl_year_class' #class
      selectedValue: defaultValue #默认被选中的值
      dataArray: tmpDataArray #需要绑定的数组
    self.yearObj = tmpYear

  #defaultValue: 用于设置被选中的默认值
  self.GenerateMonthArray = (defaultValue) ->
    tmpDataArray = []
    for i in [1 .. 12]
      tmpDataArray.push
        key: i
        value: i

    tmpMonth =
      id:'sl_month' #下拉框的id
      name: 'sl_month_name' #name
      class: 'sl_month_class' #class
      selectedValue: defaultValue #默认被选中的值
      dataArray: tmpDataArray #需要绑定的数组
    self.monthObj = tmpMonth
  
  #year:指定年
  #month:指定月
  #defaultValue:用于设置被选中的默认值
  self.GenerateDayArray = (year,month,defaultValue) ->
    tmpDataArray = []
    for i in [1 .. "#{Helper.FindDaysInMonth(year,month)}"]      
      tmpDataArray.push
        key: i
        value: i

    tmpDay =
      id:'sl_day' #下拉框的id
      name: 'sl_day_name' #name
      class: 'sl_day_class' #class
      selectedValue: defaultValue #默认被选中的值
      dataArray: tmpDataArray #需要绑定的数组
    self.dayObj = tmpDay
  
  


  self.Init = ()->
    self.GenerateYearArray(2015)
    self.GenerateMonthArray(5)
    self.GenerateDayArray(2015,2,27)
    return

  ko.computed ()-> 
    self.Init() 
    
    return

  return

ko.applyBindings new KoModel()