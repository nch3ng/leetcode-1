# https://leetcode.com/problems/minimum-path-sum/
#
# Given a m x n grid filled with non-negative numbers, find a path from top
# left to bottom right which minimizes the sum of all numbers along its path.
#
# Note: You can only move either down or right at any point in time.


# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
  grid = Marshal.load(Marshal.dump(grid))
  m, n = grid.size, grid[0].size

  1.upto(m - 1) { |i| grid[i][0] += grid[i - 1][0] }
  1.upto(n - 1) { |j| grid[0][j] += grid[0][j - 1] }

  1.upto(m - 1) do |i|
    1.upto(n - 1) do |j|
      grid[i][j] += [grid[i - 1][j], grid[i][j - 1]].min
    end
  end

  grid[-1][-1]
end
