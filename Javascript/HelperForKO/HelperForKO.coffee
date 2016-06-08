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
HelperForKO.EachArray2KOArray = (originArray,resultArray,callback)->
  resultArray.removeAll()
  for item in originArray
    resultArray.push HelperForKO.Obj2Obj item
  if callback? then callback()
  return resultArray

#遍历数组,找到符合条件的值,然后返回,不在进行后续的遍历
HelperForKO.EachArrayFindTarget = (array,condition,callback) ->
  result = {}
  for item in array
    if condition(item)      
      return result = item      
  return result