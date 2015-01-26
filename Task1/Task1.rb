def map arr
  new_arr = []
  i = 0

  while i < arr.length do
    new_arr.push yield arr[i], i, arr
    i += 1
  end

  new_arr
end

def filter arr
  result = []
  i = 0

  return result if !block_given?

  while i < arr.length do
    result.push arr[i] if yield arr[i], i, arr
    i += 1
  end

  result
end

def detect arr
  return nil if !block_given?

  i = 0

  while i < arr.length do
    return arr[i] if yield arr[i]
    i += 1
  end

  nil
end

def count arr, &block
  return nil if !block_given?

  filtered_elements = filter arr, &block
  filtered_elements.length
end	

def any? arr
  return false if !block_given?

  i = 0

  while i < arr.length do
    return true if yield arr[i], i, arr
    i += 1
  end

  false
end

def every? arr
  return false if !block_given?

  i = arr.length - 1

  until i < 0 do
    return false if !yield arr[i], i, arr
    i -= 1
  end

  true
end

def reduce sum, arr
  return sum if !block_given?

  i = 0

  while i < arr.length do
    sum = yield sum, arr[i], i, arr
    i += 1
  end

  sum
end

def interview_task *args
  min_index = args.find_index { |el| el == args.min }

  reduce 0, args do |sum, el, i|
    if i != min_index
      sum += el**2
    else
      sum
    end
  end 
end

def get_fibbonacci_by_index index
  fibbonacci_series = [0, 1]

  while fibbonacci_series.length <= index do
    fibbonacci_series << fibbonacci_series[-2] + fibbonacci_series[-1]
  end

  fibbonacci_series[index]
end

p '#map'
test = map [1,2,3,4] do |el|
  el * 2
end
p test

p '#filter'
test = filter [1,2,3,4] do |el|
  el % 2 == 0
end
p test

p '#detect'
test = detect [1,2,3] do |el|
  el > 1
end
p test

p '#count'
test = count [1,2,3,4] do |el|
  el % 3 == 0
end
p test

p '#any?'
test = any? [1,2,3,4] do |el|
  el == 3
end
p test

p '#every?'
test = every? [1,2,3,4] do |el|
  el > 0
end
p test

p '#reduce'
test = reduce 0, [1,2,3,4] do |sum, el|
  sum + el
end
p test

p '#interview_task'
p interview_task 2, 1, 3

p '#get_fibbonacci_by_index'
p get_fibbonacci_by_index 10
