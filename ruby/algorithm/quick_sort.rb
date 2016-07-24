require 'pry'
#快速排序

def division(arr, left, right)
  # point = arr[Random.new.rand(arr.length - 1)]
  #确定基点
  point = arr[left]
  while left < right
    #如果右边的数大于基点,则不操作,反之交换位置
    while left < right && arr[right] >= point
      right -= 1
    end
    swap arr, left, right
    #如果左边的数小于基点,则不操作,反之交换位置
    while left < right && arr[left] <= point
      left += 1
    end
    swap arr, right, left
  end
  #重新确定
  # arr[left] = point

  #返回轴点下标
  left
end

#交换位置
def swap(arr,l,h)
  arr[l],arr[h] = arr[h],arr[l]
  p arr
end

def quick_sort!(arr, left, right)
  if left < right
    p = division arr, left, right

    #递归
    quick_sort! arr, left, p - 1
    quick_sort! arr, p + 1, right
  end
end

binding.pry
quick_sort! [66,13,51,76,81,26,57,69,23], 0, 8
