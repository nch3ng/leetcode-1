# https://leetcode.com/problems/pascals-triangle/
#
# Given numRows, generate the first numRows of Pascal's triangle.
#
# For example, given numRows = 5, Return
#
#     [
#       [1],
#       [1, 1],
#       [1, 2, 1],
#       [1, 3, 3, 1],
#       [1, 4, 6, 4, 1]
#     ]


# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
  return [] if num_rows == 0
  return [[1]] if num_rows == 1

  num_rows, rows, row = num_rows - 2, [[1], [1, 1]], [1, 1]
  num_rows.times do
    row = row.each_cons(2).map { |c1, c2| c1 + c2 }
    row.insert(0, 1) << 1
    rows << row
  end
  rows
end
