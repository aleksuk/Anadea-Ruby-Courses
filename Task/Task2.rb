def map arr, &block
  arr.reduce [] do |sum, el|
    sum << block.call(el)
  end
end

def select arr, &block
  arr.reduce [] do |sum, el|
    sum << el if block.call el
    sum
  end
end

def any? arr, &block
  arr.reduce false do |sum, el|
    return true if block.call el
    sum
  end
end

def all? arr, &block
  arr.reduce true do |sum, el|
    return false unless block.call el
    sum
  end
end

def count arr, &block
  arr.reduce 0 do |sum, el|
    sum += 1 if block.call el
    sum
  end
end

def detect arr, &block
  arr.reduce nil do |sum, el|
    return el if block.call el
    sum
  end
end

def reverse arr
  result = []
  i = arr.length - 1

  until i < 0 do
    result << arr[i]
    i -= 1
  end

  result
end

def flatten arr
  arr.reduce([]) do |memo, el|
    if el.is_a?(Array)
      memo.concat flatten el
    else
      memo << el
    end
  end
end
 
def merge *objects
  result = {}
 
  objects.each do |obj|
    obj.each do |key, value|
      result[key] = value
    end
  end
 
  result
end
 
def get_local_max arr
  last_element_index = arr.length - 1
  result = []
    
  arr.each_with_index do |el, i|
    if i != 0 && i < last_element_index && el > arr[i - 1] && el > arr[i + 1]
      result.push el
    end
  end
 
  result
end
 
def sort_by_length arr
  arr.sort_by { |el| el.length }
end
 
def sort_by_even_numbers arr
  arr.sort_by do |el| 
    [e % 2, -e]
  end
end
 
def sort_by_not_even_numbers arr
  sort_by_even_numbers(arr).reverse
end

def group_by data, &block
  result = {}

  data.each do |el|
    parameter = block.call el
    result[parameter] ||= []
    result[parameter] << el
  end

  result
end
