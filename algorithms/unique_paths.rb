# https://leetcode.com/problems/unique-paths/
#
# A robot is located at the top-left corner of a m x n grid (marked 'Start'
# in the diagram below). The robot can only move either down or right at any
# point in time. The robot is trying to reach the bottom-right corner of the
# grid (marked 'Finish' in the diagram below). How many possible unique paths
# are there?
#
#     +--------+--------+--------+--------+--------+--------+--------+
#     | Start  |        |        |        |        |        |        |
#     +--------+--------+--------+--------+--------+--------+--------+
#     |        |        |        |        |        |        |        |
#     +--------+--------+--------+--------+--------+--------+--------+
#     |        |        |        |        |        |        | Finish |
#     +--------+--------+--------+--------+--------+--------+--------+
#
#     Above is a 3 x 7 grid. How many possible unique paths are there?
#
# Note: m and n will be at most 100.


# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  grid = Array.new(m) { Array.new(n, 1) }

  1.upto(m - 1) do |i|
    1.upto(n - 1) do |j|
      grid[i][j] = grid[i - 1][j] + grid[i][j - 1]
    end
  end

  grid[-1][-1]
end
