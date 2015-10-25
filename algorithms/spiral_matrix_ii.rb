# https://leetcode.com/problems/spiral-matrix-ii/
#
# Given an integer n, generate a square matrix filled with elements from 1 to
# n^2 in spiral order.
#
# For example, Given n = 3, You should return the following matrix:
#
#     [
#       [1, 2, 3],
#       [8, 9, 4],
#       [7, 6, 5]
#     ]


# @param {Integer} n
# @return {Integer[][]}
def generate_matrix(n)
  return [] if n.zero?

  matrix, count = Array.new(n, &Proc.new{ Array.new(n) }), 0
  x, y, u, v = -1, -1, n, n
  while true
    x, y, u, v = x + 1, y + 1, u - 1, v - 1
    rs, cs =  u - x + 1, v - y + 1

    y.upto(v) { |j| matrix[x][j] = (count += 1); }
    return matrix if rs <= 1

    (x + 1).upto(u) { |i| matrix[i][v] = (count += 1) }
    (v - 1).downto(y) { |j| matrix[u][j] = (count += 1) }
    (u - 1).downto(x + 1) { |i| matrix[i][y] = (count += 1) } if cs > 1
    return matrix if count == n * n
  end
end
