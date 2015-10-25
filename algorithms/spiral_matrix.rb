# https://leetcode.com/problems/spiral-matrix/
#
# Given a matrix of m x n elements (m rows, n columns), return all elements of
# the matrix in spiral order.
#
# For example, Given the following matrix:
#
#     [
#       [1, 2, 3],
#       [4, 5, 6],
#       [7, 8, 9]
#     ]
#
# You should return [1, 2, 3, 6, 9, 8, 7, 4, 5].


# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  return [] if matrix.empty?

  m, n, s = matrix.size, matrix[0].size, []
  x, y, u, v = -1, -1, m, n
  while true
    x, y, u, v = x + 1, y + 1, u - 1, v - 1
    rs, cs =  u - x + 1, v - y + 1

    y.upto(v) { |j| s << matrix[x][j] }
    return s if rs <= 1

    (x + 1).upto(u) { |i| s << matrix[i][v] }
    (v - 1).downto(y) { |j| s << matrix[u][j] }
    (u - 1).downto(x + 1) { |i| s << matrix[i][y] } if cs > 1
    return s if s.size == m * n
  end
end
