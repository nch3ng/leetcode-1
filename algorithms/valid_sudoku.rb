# https://leetcode.com/problems/valid-sudoku/
#
# Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules:
#
#     + Each row must have the numbers 1-9 occuring just once.
#     + Each column must have the numbers 1-9 occuring just once.
#     + And the numbers 1-9 must occur just once in each of the 9 sub-boxes
#       of the grid.
#
# The Sudoku board could be partially filled, where empty cells are filled
# with the character '.'.
#
#     A partially filled sudoku which is valid:
#
#         +---+---+---+---+---+---+---+---+---+
#         | 5 | 3 |   |   | 7 |   |   |   |   |
#         +---+---+---+---+---+---+---+---+---+
#         | 6 |   |   | 1 | 9 | 5 |   |   |   |
#         +---+---+---+---+---+---+---+---+---+
#         |   | 9 | 8 |   |   |   |   | 6 |   |
#         +---+---+---+---+---+---+---+---+---+
#         | 8 |   |   |   | 6 |   |   |   | 3 |
#         +---+---+---+---+---+---+---+---+---+
#         | 4 |   |   | 8 |   | 3 |   |   | 1 |
#         +---+---+---+---+---+---+---+---+---+
#         | 7 |   |   |   | 2 |   |   |   | 6 |
#         +---+---+---+---+---+---+---+---+---+
#         |   | 6 |   |   |   |   | 2 | 8 |   |
#         +---+---+---+---+---+---+---+---+---+
#         |   |   |   | 4 | 1 | 9 |   |   | 5 |
#         +---+---+---+---+---+---+---+---+---+
#         |   |   |   |   | 8 |   |   | 7 | 9 |
#         +---+---+---+---+---+---+---+---+---+
#
# Note: A valid Sudoku board (partially filled) is not necessarily solvable.
# Only the filled cells need to be validated.


# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  rowbuckets = Array.new(9) { Hash.new }
  colbuckets = Array.new(9) { Hash.new }
  boxbuckets = Array.new(9) { Hash.new }

  0.upto(8) do |i|
    0.upto(8) do |j|
      char = board[i][j]
      next if char == '.'

      return false if rowbuckets[i][char]
      rowbuckets[i][char] = true

      return false if colbuckets[j][char]
      colbuckets[j][char] = true

      k = (i / 3) * 3 + (j / 3)
      return false if boxbuckets[k][char]
      boxbuckets[k][char] = true
    end
  end
  return true
end
