# https://leetcode.com/problems/surrounded-regions/
#
# Given a 2D board containing 'X' and 'O', capture all regions surrounded by
# 'X'. A region is captured by flipping all 'O's into 'X's in that surrounded
# region.
#
# For example:
#
#     X X X X
#     X O O X
#     X X O X
#     X O X X
#
# After running your function, the board should be:
#
#     X X X X
#     X X X X
#     X X X X
#     X O X X


# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
  return if board.empty?

  m, n = board.size, board[0].size
  q = []
  0.upto(n - 1) { |j| q << j               if board[0][j]     == 'O' }
  0.upto(n - 1) { |j| q << j + n * (m - 1) if board[m - 1][j] == 'O' }
  0.upto(m - 1) { |i| q << i * n           if board[i][0]     == 'O' }
  0.upto(m - 1) { |i| q << i * n + n - 1   if board[i][n - 1] == 'O' }

  cmap = {}
  until q.empty?
    coordinate = q.shift
    next if cmap[coordinate]

    x, y = coordinate.divmod(n)
    q << coordinate - n if     x > 0 && board[x - 1][y] == 'O'
    q << coordinate + n if x + 1 < m && board[x + 1][y] == 'O'
    q << coordinate - 1 if     y > 0 && board[x][y - 1] == 'O'
    q << coordinate + 1 if y + 1 < n && board[x][y + 1] == 'O'

    cmap[coordinate] = true
  end

  0.upto(m * n - 1) do |ij|
    next if cmap[ij]
    i, j = ij.divmod(n)
    board[i][j] = 'X'
  end; nil
end
