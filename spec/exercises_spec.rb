require 'rspec'
require 'exercises'

describe 'uniq' do
  subject(:test_array) { [1, 1, 2, 3, 3] }

  it "returns an array without duplicates" do

    edited_array = test_array.uniq
    unique_array = [1, 2, 3]

    expect(edited_array).to eq(unique_array)
  end

  it "returns original array if length is 1" do

    array_of_one = [1]
    edited_array = array_of_one.uniq

    expect(array_of_one).to eq(array_of_one)
  end

  it "returns original array if it is empty" do

    empty_array = []
    edited_array = empty_array.uniq

    expect(edited_array).to eq(empty_array)
  end

  it "only removes duplicates in the first layer of 2d array" do

    expected_array = [test_array, 1]
    twod_array = [test_array, test_array, 1]
    edited_array = twod_array.uniq

    expect(edited_array).to eq(expected_array)
  end

  it "removes duplicate strings" do
    array_of_strings = ["1", "1", "2", "3", "3"]
    expected_array = ["1", "2", "3"]
    edited_array = array_of_strings.uniq

    expect(edited_array).to eq(expected_array)
  end
end

describe "two_sum" do
  subject(:test_array) { [0, -1, 1, 0, 2]}

  it "returns a new array of indices for numbers that sum to zero" do

    expected_array = [[0, 3], [1, 2]]
    edited_array = test_array.two_sum

    expect(edited_array).to eq(expected_array)
  end

  it "retuns three pairs for any three zeroes" do

    new_test_array = [0, 0, 0]
    expected_array = [[0, 1], [0, 2], [1, 2]]
    edited_array = new_test_array.two_sum

    expect(edited_array).to eq(expected_array)
  end

  it "returns multiple pairs containing the same index" do

    new_test_array = [-1, -1, 1, 1]
    expected_array = [[0,2], [0,3], [1,2], [1,3]]
    edited_array = new_test_array.two_sum

    expect(edited_array).to eq(expected_array)
  end

  it "does not modify the original array" do

    original_array = test_array.dup
    edited_array = test_array.two_sum

    expect(test_array).to eq(original_array)
  end

  it "returns an empty array if no pairs sum and doesn't single 0 as pair" do

    new_test_array = [0, 1, 2, 3]
    edited_array = new_test_array.two_sum

    expect(edited_array.empty?).to eq(true)
  end

end











#
