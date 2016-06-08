#HelperForKO 一些方法的调用Demo

#HelperForKO.Obj2Obj
#HelperForKO.GetJSON
#HelperForKO.EachArray2KOArray
self.GetSysVersionLog = () ->
  #先调用GetJSON方法到后台请求数据,
  #然后调用EachArray2KOArray 方法,把后台返回的json数据遍历一下赋值给前台数组
  HelperForKO.GetJSON self.urls.FindSysVersionLog,null,(result) ->
    #result.ResultData.Result 后台返回的数组
    #self.sysVersionLogArray 前台接收转换后的数组
    HelperForKO.EachArray2KOArray result.ResultData.Result, self.sysVersionLogArray
    return
  return

#HelperForKO.EachArrayFindTarget
self.VersionLogClick = (data)->
  #遍历self.sysVersionLogArray()
  target = HelperForKO.EachArrayFindTarget self.sysVersionLogArray(),(item) ->
    # item.PublishVersion() == data.PublishVersion() 这是遍历时,满足的条件,只有满足该条件的数据才会被返回
    item.PublishVersion() == data.PublishVersion()
  console.log target