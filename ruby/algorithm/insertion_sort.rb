require 'pry'
#插入排序
def insert_sort(arr)
	i,j = 1,0
	count = arr.length
	while i < count
		point = arr[i]
		j = i - 1
		while j >= 0 && arr[j] > point
			arr[j + 1] = arr[j]
			p arr
			j -= 1
		end
		arr[j + 1] = point
		p arr
		i += 1
	end

end

# binding.pry
insert_sort [66,13,51,76,81,26,57,69,23]