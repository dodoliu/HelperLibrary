Helper = (window["Helper"] || {})

# 两个日期相减,返回数据不进行四舍五入,
# 默认返回 天数
# date1 减去 date2
# date1: 日期1,格式 2016-5-31
# date2: 日期2,格式 2016-5-31
# type: day/month/year
# coefficient: 系数,月数 默认按30天计算,年数 默认按365天计算
Helper.DateBothSubtraction = (date1,date2,type,coefficient) ->  
  tmpDate1 = new Date date1
  tmpDate2 = new Date date2
  tmpDate = tmpDate1 - tmpDate2

  switch type
    when 'day' then coefficient = 1
    when 'month'
      coefficient = if coefficient? then coefficient else 30
    when 'year'
      coefficient = if coefficient? then coefficient else 365    
  tmpDate / (1000*3600*24*coefficient)

#给定日期加上指定的 时间,返回一个新日期
#支持 秒/分钟/小时/天/月/年
#date: 需要操作的日期,格式为 2016-5-31
#type: 添加的类型
#coefficient: 系数,几天,几小时等
Helper.DateAddition = (date,type,coefficient) ->
  Helper.DateAddSubComm date,type,coefficient,'add'

#给定日期减去指定的 时间,返回一个新日期
#支持 秒/分钟/小时/天/月/年
#date: 需要操作的日期,格式为 2016-5-31
#type: 添加的类型
#coefficient: 系数,几天,几小时等
Helper.DateSubtraction = (date,type,coefficient) ->
  Helper.DateAddSubComm date,type,coefficient,'sub'

Helper.DateAddSubComm = (date,type,coefficient,symbol) ->
  tmpDate = new Date date
  if symbol is "add"
    switch type
      when 'second' then tmpDate.setSeconds tmpDate.getSeconds() + coefficient
      when 'minute' then tmpDate.setMinutes tmpDate.getMinutes() + coefficient
      when 'hour' then tmpDate.setHours tmpDate.getHours() + coefficient
      when 'day' then tmpDate.setDate tmpDate.getDate() + coefficient 
      when 'month' then tmpDate.setMonth tmpDate.getMonth() + coefficient    
      when 'year' then  tmpDate.setFullYear tmpDate.getFullYear() + coefficient      
  else
    switch type
      when 'second' then tmpDate.setSeconds tmpDate.getSeconds() - coefficient
      when 'minute' then tmpDate.setMinutes tmpDate.getMinutes() - coefficient
      when 'hour' then tmpDate.setHours tmpDate.getHours() - coefficient
      when 'day' then tmpDate.setDate tmpDate.getDate() - coefficient 
      when 'month' then tmpDate.setMonth tmpDate.getMonth() - coefficient    
      when 'year' then  tmpDate.setFullYear tmpDate.getFullYear() - coefficient
  tmpDate

#返回指定年的指定月有多少天
#year: 年
#month: 月
Helper.FindDaysInMonth = (year,month) ->
  month = parseInt month,10
  temp = new Date year,month,0
  temp.getDate()

#手机号判断
Helper.IsPhone = (data) ->
  data.search(/^1[34587]\d{9}$/) isnt -1

#中文姓名判断,最多50个字符,需要需要判断姓名长度,请直接使用字符串的length判断
Helper.IsChineseName = (data) ->
  /^[\u4e00-\u9fa5]{2,50}$/.test data

#是否为空字符窜判断
Helper.IsEmpty = (data) ->  
  data isnt '' and  data?

#邮箱的判断
Helper.IsEmail = (data) ->
  /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test data

#获取url参数,如果传入url,着获取的传入url中的参数
Helper.GetQueryString = (key,url) ->
    result = (url || location.search).match new RegExp("[\?\&]" + key+ "=([^\&]+)","i")
    if result is null or result.length < 1
      return ""    
    return result[1]