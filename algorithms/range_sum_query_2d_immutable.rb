# https://leetcode.com/problems/range-sum-query-2d-immutable/
#
# Given a 2D matrix matrix, find the sum of the elements inside the rectangle
# defined by its upper left corner (row1, col1) and lower right corner (row2,
# col2).
#
# Example:
#
#     Given matrix = [
#       [3, 0, 1, 4, 2],
#       [5, 6, 3, 2, 1],
#       [1, 2, 0, 1, 5],
#       [4, 1, 0, 1, 7],
#       [1, 0, 3, 0, 5]
#     ]
#
#     sumRegion(2, 1, 4, 3) -> 8
#     sumRegion(1, 1, 2, 2) -> 11
#     sumRegion(1, 2, 2, 4) -> 12
#
# Note:
#
#     1. You may assume that the matrix does not change.
#     2. There are many calls to sumRegion function.
#     3. You may assume that row1 <= row2 and col1 <= col2.


class NumMatrix
  # Initialize your data structure here.
  # @param {Integer[][]} matrix
  def initialize(matrix)
    return if matrix.empty?

     m, n = matrix.size, matrix[0].size
    @sums = Array.new(m + 1) { Array.new(n + 1, 0) }

    1.upto(m) { |i| @sums[i][1] = @sums[i - 1][1] + matrix[i - 1][0] }
    1.upto(n) { |j| @sums[1][j] = @sums[1][j - 1] + matrix[0][j - 1] }

    2.upto(m) do |i|
      2.upto(n) do |j|
        @sums[i][j] =
          @sums[i - 1][j] + @sums[i][j - 1] - @sums[i - 1][j - 1] +
         matrix[i - 1][j - 1]
      end
    end
  end

  # @param {Integer} row1
  # @param {Integer} col1
  # @param {Integer} row2
  # @param {Integer} col2
  # @return {Integer}
  def sum_region(row1, col1, row2, col2)
    return 0 if @sums.nil?
    return @sums[row2 + 1][col2 + 1] +
         - @sums[row2 + 1][col1] - @sums[row1][col2 + 1] +
           @sums[row1][col1]
  end
end


# Your NumMatrix object will be instantiated and called as such:
# num_matrix = NumMatrix.new(matrix)
# num_matrix.sum_region(0, 1, 2, 3)
# num_matrix.sum_region(1, 2, 3, 4)
