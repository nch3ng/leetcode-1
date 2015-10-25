# https://leetcode.com/problems/search-a-2d-matrix/
#
# Write an efficient algorithm that searches for a value in an m x n matrix.
# This matrix has the following properties:
#
#     + Integers in each row are sorted from left to right.
#     + The first integer of each row is greater than the last integer of the
#       previous row.
#
# For example:
#
#     Consider the following matrix:
#
#         [
#           [1,   3,  5,  7],
#           [10, 11, 16, 20],
#           [23, 30, 34, 50]
#         ]
#
#     Given target = 3, return true.


# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false if matrix.empty?

  m, n = matrix.size, matrix[0].size
  mnum = Range.new(0, m * n - 1).bsearch do |ij|
    i, j = ij.divmod(n); matrix[i][j] >= target
  end || 0

  i, j = mnum.divmod(n)
  matrix[i][j] == target
end
