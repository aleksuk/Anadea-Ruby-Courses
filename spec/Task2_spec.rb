require "spec_helper"
require_relative '../Task/Task2' 

describe "Method" do

  let(:input_data) { [1, 2, 3, 4] }

  context "#map" do
    it "should return new arr with modified elements" do
      result = map input_data do |el|
        el * 2
      end

      expect(result).to eq([2, 4, 6, 8])
    end

    it "should return empty arr with nil elements if block wasn't pass" do
      result = map input_data do |el|
      end

      expect(result).to eq([nil, nil, nil, nil])
    end
  end

  context "#select" do
    it "should return filtered array" do
      result = select input_data do |el|
        el % 2 == 0
      end

      expect(result).to eq([2, 4])
    end

    it "should return empty arr, if anyone elements doesn't satisfy condition" do
      result = select input_data do |el|
        el > 100
      end

      expect(result).to be_empty
    end
  end

  context "#any?" do
    it "should return 'true' value, if anyone element satisfy condition" do
      result = any? input_data do |el|
        el > 1
      end

      expect(result).to be(true)
    end

    it "should return 'false' value, if none element doesn't satisfy condition" do
      result = any? input_data do |el|
        el > 20
      end

      expect(result).to be(false)
    end
  end

  context "#all?" do
    it "should return 'true' value, if all elements satisfy condition" do
      result = all? input_data do |el|
        el.is_a?(Fixnum)
      end

      expect(result).to be(true)
    end

    it "should return 'fasle' value, if anyone element doesn't satisfy condition" do
      result = all? input_data do |el|
        el > 1
      end

      expect(result).to be(false)
    end
  end

  context "#count" do
    it "should return count of elements which satisfy condition" do
      result = count input_data do |el|
        el > 2
      end

      expect(result).to eq(2)
    end

    it "should return '0' if none element doesn't satisfy condition" do
      result = count input_data do |el|
        el.is_a?(String)
      end

      expect(result).to eq(0)
    end
  end

  context "#detect" do
    it "should return first elemen which satisfy condition" do
      result = detect input_data do |el|
        el % 2 == 0
      end

      expect(result).to be(2)
    end

    it "should return false value, if none element doesn't satisfy condition" do
      result = detect input_data do |el|
        el.is_a?(String)
      end

      expect(result).to be_falsey
    end
  end

  context "#reverse" do
    it "should return` elements of array in reverse order" do
      result = reverse input_data

      expect(result).to eq([4, 3, 2, 1])
    end
  end

  context "#flatten" do
    it "should return array without nested arrays" do
      result = flatten [1, [2, [4, [5]]], [3]]

      expect(result).not_to include(Array)
    end

    it "should add elements from nested array into result array" do
      result = flatten [1, [2, [4, [5]]], [3]]

      expect(result).to eq([1, 2, 4, 5, 3])
    end

    it "should return empty erray if passed array was empty" do
      result = flatten []

      expect(result).to be_empty
    end
  end

  context "#merge" do
    it "should return merged hash" do
      hash1 = { 'a' => true }
      hash2 = { 'b' => false }

      result = merge hash1, hash2

      expect(result).to eq({ 'a' => true, 'b' => false })
    end

    it "should return new hash" do
      hash1 = { 'a' => true }
      hash2 = { 'b' => false }

      result = merge hash1, hash2

      expect(result).not_to be(hash1)
      expect(result).not_to be(hash2)
    end
  end

  context "#get_local_max" do
    it "should return array with all local maxima" do
      result = get_local_max [1, 2, 1, 2, 3, 1]

      expect(result).to eq([2, 3])
    end
  end

  context "#group_by" do
    it "should return hash with grouped arrays in according with condition" do
      test_data = [
        { 'name' => 'Vasya', 'age' => 20 },
        { 'name' => 'Vasya', 'age'=> 30 },
        { 'name' => 'Petya', 'age' => 20 }
      ]

      expected_result = {
        'Vasya' => [ { 'name' => 'Vasya', 'age' => 20 }, { 'name' => 'Vasya', 'age' => 30 } ],
        'Petya' => [ { 'name' => 'Petya', 'age' => 20 } ]
      }

      result = group_by test_data do |el|
        el['name']
      end

      expect(result).to eq(expected_result)
    end
  end

  context "#sort_by_length" do
    it "should return sorted array by length" do
      result = sort_by_length ['1234', '11', '333']

      expect(result).to eq(['11', '333', '1234'])
    end
  end
end
