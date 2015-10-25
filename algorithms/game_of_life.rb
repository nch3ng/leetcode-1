# https://leetcode.com/problems/game-of-life/
#
# According to the Wikipedia's article: "The Game of Life, also known simply
# as Life, is a cellular automaton devised by the British mathematician John
# Horton Conway in 1970."
#
# Given a board with m by n cells, each cell has an initial state live (1)
# or dead (0). Each cell interacts with its eight neighbors (horizontal,
# vertical, diagonal) using the following four rules (taken from the above
# Wikipedia article):
#
#     + Any live cell with fewer than two live neighbors dies, as if caused
#       by under-population.
#     + Any live cell with two or three live neighbors lives on to the next
#       generation.
#     + Any live cell with more than three live neighbors dies, as if by
#       over-population..
#     + Any dead cell with exactly three live neighbors becomes a live cell,
#       as if by reproduction.
#
# Write a function to compute the next state (after one update) of the board
# given its current state.
#
# Follow up:
#
#     + Could you solve it in-place? Remember that the board needs to be
#       updated at the same time: You cannot update some cells first and
#       then use their updated values to update other cells.
#     + In this question, we represent the board using a 2D array. In
#       principle, the board is infinite, which would cause problems when
#       the active area encroaches the border of the array. How would you
#       address these problems?
#
# Credits:
#
#     Special thanks to @jianchao.li.fighter for adding this problem and
#     creating all test cases.


# @param {Integer[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def game_of_life(board)
  return if board.empty?

  m, n = board.size, board[0].size
  dx = [-1, -1, -1,  0, 0,  1, 1, 1]
  dy = [-1,  0,  1, -1, 1, -1, 0, 1]

  0.upto(m - 1) do |x|
    0.upto(n - 1) do |y|
      count = 0

      0.upto(7) do |idx|
        u, v = x + dx[idx], y + dy[idx]
        count += board[u][v] & 0b01 if u.between?(0, m - 1) && v.between?(0, n - 1)
      end

      if board[x][y] & 0b01 == 0b01
        board[x][y] |= 0b10 if count == 3 || count == 2
      else
        board[x][y] |= 0b10 if count == 3
      end
    end
  end

  0.upto(m - 1) do |x|
    0.upto(n - 1) do |y|
      board[x][y] >>= 1
    end
  end; nil
end
