HelperForKO = (window["HelperForKO"] || {})

#将对象的属性通过ko进行监控
#data: {obj} 需要监控的对象
#callback: {function} 回调函数,可以在回调函数中给对象追加新的属性
HelperForKO.Obj2Obj = (data,callback) ->    
  tmp = {}
  for key of data
    tmp[key] = ko.observable if ko.isObservable data[key] then data[key]() else data[key]
  if callback? then callback(tmp)
  return tmp

#TODO
#遍历对象,把对象的属性用ko进行监控,如果对象的属性是是个对象数组,则遍历子集数组,直到没有子集数组结束
#TODO


#通过JQuery的GetJSON到后台请求数据
#url: {string} 请求数据的url
#params: {obj} 请求数据时需要带的参数
#callback: {function} 请求完成后,后台返回的数据的json对象
HelperForKO.GetJSON = (url,params,callback)->
  $.getJSON url,params,(result)->
    if callback? then callback(result)
    return
  return

#通过For循环遍历数组,并把遍历的数组转成ko对象数据后返回
#originArray: {array} 需要遍历的数组
#resultArray: {array} 遍历完成后返回的数组
#callback: {function} 回调函数
#obj2obj: {function} 是否使用自定义的ko对象转换,如果没有传该值,则使用 HelperForKO.Obj2Obj
HelperForKO.EachArray2KOArray = (originArray,resultArray,callback,obj2obj)->
  resultArray.removeAll()
  for item in originArray
    resultArray.push if obj2obj? then obj2obj item else HelperForKO.Obj2Obj item
  if callback? then callback()
  return resultArray

#遍历数组,找到符合条件的值,然后返回,不在进行后续的遍历
#array: {array} 需要遍历的数组
#condition: {function} 判断条件
#callback: {function} 回调函数
HelperForKO.EachArrayFindTarget = (array,condition,callback) ->
  result = {}
  for item in array
    if condition(item)      
      return result = item   
  if callback? then callback()   
  return result

#遍历数组,找到符合条件的所有值,然后返回
#array: {array} 需要遍历的数组
#condition: {function} 判断条件
#callback: {function} 回调函数
HelperForKO.EachArrayFindTargetArray = (array,condition,callback) ->  
  result = []
  for item in array
    if condition(item)
      result.push item     
  if callback? then callback()   
  return result

#通过JQuery的Post方法发送post请求
#url: {string} 请求数据的url
#params: {obj} 请求数据时需要带的参数
#callback: {function} 请求完成后,后台返回的数据的json对象
HelperForKO.POST = (url,params,callback) ->
  $.post url,params,(result) ->
    if callback? then callback(result)
    return
  return
  
