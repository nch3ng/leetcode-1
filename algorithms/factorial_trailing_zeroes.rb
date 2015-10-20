# https://leetcode.com/problems/factorial-trailing-zeroes/
#
# Given an integer n, return the number of trailing zeroes in n!.


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
