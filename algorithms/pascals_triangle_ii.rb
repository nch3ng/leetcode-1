# https://leetcode.com/problems/pascals-triangle-ii/
#
# Given an index k, return the kth row of the Pascal's triangle.
#
# For example, given k = 3, Return [1, 3, 3, 1].
#
# Note:
#
#     Could you optimize your algorithm to use only O(k) extra space?


# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
  return [1] if row_index == 0

  row_index, row = row_index - 1, [1, 1]
  row_index.times do
    row = row.each_cons(2).map { |c1, c2| c1 + c2 }
    row.insert(0, 1) << 1
  end
  row
end
