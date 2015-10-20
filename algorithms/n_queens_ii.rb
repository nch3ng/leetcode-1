# https://leetcode.com/problems/n-queens-ii/
#
# Follow up for "N-Queens" problem. Now, instead outputting board
# configurations, return the total number of distinct solutions.


# @param {Integer} n
# @return {Integer}
def total_n_queens(n)
  _total_n_queens_(n, 0, Array.new(n), Array.new(2 * n), Array.new(2 * n))
end

private def _total_n_queens_(n, row, m1, m2, m3)
  return 1 if row == n

  count = 0
  0.upto(n - 1) do |col|
    next if m1[col] || m2[row - col + n] || m3[row + col]

    m1[col] = m2[row - col + n] = m3[row + col] = true
     count +=_total_n_queens_(n, row + 1, m1, m2, m3)
    m1[col] = m2[row - col + n] = m3[row + col] = false
  end
  count
end
