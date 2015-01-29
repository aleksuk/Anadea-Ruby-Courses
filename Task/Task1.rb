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

  return result unless block_given?

  while i < arr.length do
    result.push arr[i] if yield arr[i], i, arr
    i += 1
  end

  result
end

def detect arr
  return nil unless block_given?

  i = 0

  while i < arr.length do
    return arr[i] if yield arr[i]
    i += 1
  end

  nil
end

def count arr, &block
  filtered_elements = filter arr, &block
  filtered_elements.length
end	

def any? arr
  return false unless block_given?

  i = 0

  while i < arr.length do
    return true if yield arr[i], i, arr
    i += 1
  end

  false
end

def all? arr
  return false unless block_given?

  i = arr.length - 1

  until i < 0 do
    return false unless yield arr[i], i, arr
    i -= 1
  end

  true
end

def reduce sum, arr
  return sum unless block_given?

  i = 0

  while i < arr.length do
    sum = yield sum, arr[i], i, arr
    i += 1
  end

  sum
end

def get_the_sum_of_the_squares_of_large_numbers *args
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
