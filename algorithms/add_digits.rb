# https://leetcode.com/problems/add-digits/
#
# Given a non-negative integer num, repeatedly add all its digits until the
# result has only one digit.
#
# For example:
#
#     Given num = 38, the process is like: 3 + 8 = 11, 1 + 1 = 2.
#     Since 2 has only one digit, return it.
#
# Follow up:
#
#     Could you do it without any loop/recursion in O(1) runtime?
#
# Credits:
#
#     Special thanks to @jianchao.li.fighter for adding this problem and
#     creating all test cases.


# @param {Integer} num
# @return {Integer}
def add_digits(num)
  num == 0 ? 0 : (num - 1) % 9 + 1
end
