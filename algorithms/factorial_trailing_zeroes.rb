# https://leetcode.com/problems/factorial-trailing-zeroes/
#
# Given an integer n, return the number of trailing zeroes in n!.
#
# Note:
#
#     Your solution should be in logarithmic time complexity.
#
# Credits:
#
#     Special thanks to @ts for adding this problem and creating
#     all test cases.


# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
  cnt = 0
  while n > 1
    cnt = cnt + n / 5
    n = n / 5
  end
  cnt
end
