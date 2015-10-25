# https://leetcode.com/problems/triangle/
#
# Given a triangle, find the minimum path sum from top to bottom. Each step
# you may move to adjacent numbers on the row below.
#
# For example, given the following triangle
#
#     [
#          [2],
#         [3,4],
#        [6,5,7],
#       [4,1,8,3]
#     ]
#
# Note: Bonus point if you are able to do this using only O(n) extra space,
# where n is the total number of rows in the triangle.


# @param {Integer[][]} triangle
# @return {Integer}
def minimum_total(triangle)
   n = triangle.size
  dp = Array.new(n + 1, 0)

  (n - 1).downto(0) do |i|
    0.upto(i) do |j|
      dp[j] = [dp[j], dp[j + 1]].min + triangle[i][j]
    end
  end

  dp[0]
end
