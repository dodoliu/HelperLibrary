#冒泡排序
require 'benchmark'

def bubble_sort!(args)
  for i in 0..(args.length-1)
    for j in 0..(args.length-i-2)
      if (args[j+1] <=> args[j]) == -1
        args[j], args[j+1] = args[j+1], args[j]
        # p args
      end
    end
  end
end

Benchmark.bm(7) do |x|
  x.report('冒泡排序:') { bubble_sort! [8,3,1,2,6,5,9,10,4] }
end