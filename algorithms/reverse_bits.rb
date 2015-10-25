# https://leetcode.com/problems/reverse-bits/
#
# Reverse bits of a given 32 bits unsigned integer.
#
# For example, given input 43261596 (represented in binary as
# 00000010100101000001111010011100), return 964176192 (represented in binary
# as 00111001011110000010100101000000).
#
# Credits:
#
#     Special thanks to @ts for adding this problem and creating all test
#     cases.


# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
  m = n & 1

  31.times do |i|
    n >>= 1
    m <<= 1
    m  += n & 1
  end

  m
end
