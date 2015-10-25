# https://leetcode.com/problems/maximal-square/
#
# Given a 2D binary matrix filled with 0's and 1's, find the largest square
# containing all 1's and return its area.
#
# For example:
#
#     Given the following matrix:
#
#         1 0 1 0 0
#         1 0 1 1 1
#         1 1 1 1 1
#         1 0 0 1 0
#
#     Return 4.
#
# Credits:
#
#     Special thanks to @Freezen for adding this problem and creating all
#     test cases.


# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
  return 0 if matrix.empty?

  m, n = matrix.size, matrix[0].size
    dp = Array.new(m) { Array.new(n, 0) }

  maxwidth = 0

  0.upto(m - 1) do |i|
    0.upto(n - 1) do |j|
      if i == 0 || j == 0 || matrix[i][j] == '0'
        dp[i][j] = matrix[i][j].to_i
      else
        dp[i][j] = [dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1]].min + 1
      end
      maxwidth = dp[i][j] if maxwidth < dp[i][j]
    end
  end

  maxwidth * maxwidth
end
