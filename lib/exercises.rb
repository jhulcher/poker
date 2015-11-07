class Array

  def uniq
    unique_elements = []

    self.each do |element|
      unique_elements << element unless unique_elements.include?(element)
    end

    unique_elements
  end

  def two_sum
    pairs = []

    0.upto(length - 2) do |idx1|
      (idx1 + 1).upto(length - 1) do |idx2|
        pairs << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end
    pairs
  end
end

#   def my_transpose
#     cols = []
#
#     self.first.length.times { cols << []}
#     self.length.times { |col_idx| cols[col_idx] << []}
#
#     each_with_index do |row, row_idx|
#       row.each_with_index do |value, col_idx|
#         cols[col_idx][row_idx] = value
#       end
#     end
#
#     cols
#   end
#
# end
#
# rows = [
#   [0, 1, 2, 0],
#   [3, 4, 5, 3],
#   [6, 7, 8, 9]
# ]
# p rows.my_transpose
