# https://leetcode.com/problems/number-of-islands/
#
# Given a 2d grid map of '1's (land) and '0's (water), count the number of
# islands. An island is surrounded by water and is formed by connecting
# adjacent lands horizontally or vertically. You may assume all four edges of
# the grid are all surrounded by water.
#
# Example 1:
#
#     11110
#     11010
#     11000
#     00000
#
#     Answer: 1
#
# Example 2:
#
#     11000
#     11000
#     00100
#     00011
#
#     Answer: 3
#
# Credits:
#
#     Special thanks to @mithmatt for adding this problem and creating all
#     test cases.


# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  return 0 if grid.empty?

  m, n = grid.size, grid[0].size
  numb = 0
  cmap = {}
  0.upto(m * n - 1) do |ij|
    next if cmap[ij]

    i, j = ij.divmod(n)
    next if grid[i][j] != '1'

    q = [ij]
    until q.empty?
      coordinate = q.shift
      next if cmap[coordinate]

      x, y = coordinate.divmod(n)
      q << coordinate - n if     x > 0 && grid[x - 1][y] == '1'
      q << coordinate + n if x + 1 < m && grid[x + 1][y] == '1'
      q << coordinate - 1 if     y > 0 && grid[x][y - 1] == '1'
      q << coordinate + 1 if y + 1 < n && grid[x][y + 1] == '1'

      cmap[coordinate] = true
    end

    numb += 1
  end

  numb
end
