# https://leetcode.com/problems/word-search/
#
# Given a 2D board and a word, find if the word exists in the grid.
#
# The word can be constructed from letters of sequentially adjacent cell,
# where "adjacent" cells are those horizontally or vertically neighboring.
# The same letter cell may not be used more than once.
#
# For example, Given board =
#
#     [
#       ["ABCE"],
#       ["SFCS"],
#       ["ADEE"]
#     ]
#
#     word = "ABCCED", -> returns true,
#     word = "SEE",    -> returns true,
#     word = "ABCB",   -> returns false.


# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  rows, columns = board.size, board[0].size
  marks = Array.new(rows) { Array.new(columns) }

  0.upto(rows - 1) do |row|
    0.upto(columns - 1) do |column|
      return true if _exist_(board, row, column, word, 0, marks)
    end
  end
  return false
end

private def _exist_(board, row, column, word, i, marks)
  return false if marks[row][column] == true
  return false if board[row][column] != word[i]
  return true  if i == word.size - 1

  marks[row][column] = true

  [-1, 1].each do |offset|
    new_row = row + offset
    if new_row.between?(0, board.size - 1)
      return true if _exist_(board, new_row, column, word, i + 1, marks)
    end

    new_column = column + offset
    if new_column.between?(0, board[0].size - 1)
      return true if _exist_(board, row, new_column, word, i + 1, marks)
    end
  end

  marks[row][column] = false

  return false
end
