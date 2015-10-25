# https://leetcode.com/problems/number-of-1-bits/
#
# Write a function that takes an unsigned integer and returns the number of '1'
# bits it has (also known as the Hamming weight).
#
# For example, the 32-bit integer '11' has binary representation
# 00000000000000000000000000001011, so the function should return 3.
#
# Credits:
#
#     Special thanks to @ts for adding this problem and creating all test
#     cases.


# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
  count = 0
  while n.nonzero?
    count += 1
    n &= n - 1
  end
  count
end
