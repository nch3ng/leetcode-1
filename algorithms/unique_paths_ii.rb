# https://leetcode.com/problems/unique-paths-ii/
#
# Follow up for "Unique Paths": Now consider if some obstacles are added to
# the grids. How many unique paths would there be? An obstacle and empty
# space is marked as 1 and 0 respectively in the grid.
#
# For example, There is one obstacle in the middle of a 3x3 grid as
# illustrated below.
#
#     [
#       [0, 0, 0],
#       [0, 1, 0],
#       [0, 0, 0]
#     ]
#
# The total number of unique paths is 2.
#
# Note: m and n will be at most 100.


# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
  blocked = ->(i, j) { obstacle_grid[i][j] == 1 }

  m, n = obstacle_grid.size, obstacle_grid[0].size
  grid = Array.new(m) { Array.new(n) }

  grid[0][0] = blocked[0, 0] ? 0 : 1
  1.upto(m - 1) { |i| grid[i][0] = blocked[i - 1, 0] ? 0 : grid[i - 1][0] }
  1.upto(n - 1) { |j| grid[0][j] = blocked[0, j - 1] ? 0 : grid[0][j - 1] }

  1.upto(m - 1) do |i|
    1.upto(n - 1) do |j|
      grid[i][j]  = 0
      grid[i][j] += blocked[i - 1, j] ? 0 : grid[i - 1][j]
      grid[i][j] += blocked[i, j - 1] ? 0 : grid[i][j - 1]
    end
  end

  blocked[m - 1, n - 1] ? 0 : grid[m - 1][n - 1]
end
