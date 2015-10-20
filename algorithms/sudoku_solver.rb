# https://leetcode.com/problems/sudoku-solver/
#
# Write a program to solve a Sudoku puzzle by filling the empty cells. Empty
# cells are indicated by the character '.'.
#
# You may assume that there will be only one unique solution.
#
#     A sudoku puzzle:
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
#     And its solution:
#
#         +---+---+---+---+---+---+---+---+---+
#         | 5 | 3 | 4 | 6 | 7 | 8 | 9 | 1 | 2 |
#         +---+---+---+---+---+---+---+---+---+
#         | 6 | 7 | 2 | 1 | 9 | 5 | 3 | 4 | 8 |
#         +---+---+---+---+---+---+---+---+---+
#         | 1 | 9 | 8 | 3 | 4 | 2 | 5 | 6 | 7 |
#         +---+---+---+---+---+---+---+---+---+
#         | 8 | 5 | 9 | 7 | 6 | 1 | 4 | 2 | 3 |
#         +---+---+---+---+---+---+---+---+---+
#         | 4 | 2 | 6 | 8 | 5 | 3 | 7 | 9 | 1 |
#         +---+---+---+---+---+---+---+---+---+
#         | 7 | 1 | 3 | 9 | 2 | 4 | 8 | 5 | 6 |
#         +---+---+---+---+---+---+---+---+---+
#         | 9 | 6 | 1 | 5 | 3 | 7 | 2 | 8 | 4 |
#         +---+---+---+---+---+---+---+---+---+
#         | 2 | 8 | 7 | 4 | 1 | 9 | 6 | 3 | 5 |
#         +---+---+---+---+---+---+---+---+---+
#         | 3 | 4 | 5 | 2 | 8 | 6 | 1 | 7 | 9 |
#         +---+---+---+---+---+---+---+---+---+


# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  rowbuckets = Array.new(9) { Hash.new }
  colbuckets = Array.new(9) { Hash.new }
  boxbuckets = Array.new(9) { Hash.new }

  0.upto(81 - 1) do |num|
    i, j = num.divmod(9)
    next if board[i][j] == '.'

    k = (i / 3) * 3 + (j / 3)
    char = board[i][j]
    rowbuckets[i][char] = true
    colbuckets[j][char] = true
    boxbuckets[k][char] = true
  end

  _solve_sudoku_(board, 0, rowbuckets, colbuckets, boxbuckets); nil
end

private def _solve_sudoku_(board, num, rowbuckets, colbuckets, boxbuckets)
  while true
    i, j = num.divmod(9)
    if board[i][j] == '.'
      k = (i / 3) * 3 + (j / 3)
      r, c, b = rowbuckets[i], colbuckets[j], boxbuckets[k]
      break
    end

    num += 1
    return true if num == 81
  end

  '1'.upto('9').each do |n|
    next if r[n] || c[n] || b[n]

    board[i][j] = n
    r[n] = c[n] = b[n] = true

    ok = _solve_sudoku_(board, num, rowbuckets, colbuckets, boxbuckets)
    return true if ok

    r[n] = c[n] = b[n] = false
    board[i][j] = '.'
  end

  return false
end
