# https://leetcode.com/problems/excel-sheet-column-number/
#
# Given a column title as appear in an Excel sheet, return its corresponding
# column number.
#
# For example:
#
#     A -> 1
#     B -> 2
#     C -> 3
#     ...
#     Z -> 26
#     AA -> 27
#     AB -> 28
#
# Credits:
#
#     Special thanks to @ts for adding this problem and creating all test
#     cases.


# @param {String} s
# @return {Integer}
def title_to_number(s)
  m = {}
  Range.new('A', 'Z').each_with_index { |ch, idx| m[ch] = idx + 1 }

  sum = 0
  s.each_char { |ch| sum = sum * 26 + m[ch] }
  sum
end
