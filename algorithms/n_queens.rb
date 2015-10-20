# https://leetcode.com/problems/n-queens/
#
# The n-queens puzzle is the problem of placing n queens on an n×n chessboard
# such that no two queens attack each other. Given an integer n, return all
# distinct solutions to the n-queens puzzle. Each solution contains a
# distinct board configuration of the n-queens' placement, where 'Q' and '.'
# both indicate a queen and an empty space respectively.
#
# For example, There exist two distinct solutions to the 4-queens puzzle:
#
#     [
#       [
#         ".Q..",  // Solution 1
#         "...Q",
#         "Q...",
#         "..Q."
#       ], [
#         "..Q.",  // Solution 2
#         "Q...",
#         "...Q",
#         ".Q.."
#       ]
#     ]


# @param {Integer} n
# @return {String[][]}
def solve_n_queens(n)
  [].tap do |result|
    _solve_n_queens_(
      Array.new(n, &Proc.new{ Array.new(n, '.') }), n, 0,
      Array.new(n), Array.new(2 * n), Array.new(2 * n),
      result
    )
  end
end

private def _solve_n_queens_(board, n, row, m1, m2, m3, result)
  if row == n
    result << board.map(&:join); return
  end

  0.upto(n - 1) do |col|
    next if m1[col] || m2[row - col + n] || m3[row + col]

    board[row][col] = 'Q'
    m1[col] = m2[row - col + n] = m3[row + col] = true

    _solve_n_queens_(board, n, row + 1, m1, m2, m3, result)

    board[row][col] = '.'
    m1[col] = m2[row - col + n] = m3[row + col] = false
  end
end
