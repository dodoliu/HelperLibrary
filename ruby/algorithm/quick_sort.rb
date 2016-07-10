#快速排序


def quick_sort!(args)
  #定位轴点
  point_index = find_point args
  point = args[point_index]
  for i in 0..(args.length-1)
    if args[i] > point
      swap args,point_index,i
    end
  end
  quick_sort 

end

def sort
  
end

#定位轴点
def find_point(args)
  #随机取一个数为轴点,相对于指定序列第一个或最后一个数时,如果遇到有序序列时,效率要高一些.
  rand = Random.new
  rand.rand 0..(args.length-1)
end

#交换位置
def swap(args,low,high)
  args[low],args[high] = args[high],args[low]
end

p find_point [3,2,1]