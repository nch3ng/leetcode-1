# https://leetcode.com/problems/single-number-iii/
#
# Given an array of numbers nums, in which exactly two elements appear only
# once and all the other elements appear exactly twice. Find the two elements
# that appear only once.
#
# For example:
#
#     Given nums = [1, 2, 1, 3, 2, 5], return [3, 5].
#
# Notes:
#
#     + The order of the result is not important. So in the above example,
#       [5, 3] is also correct.
#     + Your algorithm should run in linear runtime complexity. Could you
#       implement it using only constant space complexity?
#
# Credits:
#
#     Special thanks to @jianchao.li.fighter for adding this problem and
#     creating all test cases.


# @param {Integer[]} nums
# @return {Integer[]}
def single_number(nums)
  n1_xor_n2 = nums.reduce(&:^)
  last_1bit = n1_xor_n2 - (n1_xor_n2 & (n1_xor_n2 - 1))

  n1, n2 = 0, 0
  nums.each do |num|
    if num & last_1bit == 0
      n1 ^= num
    else
      n2 ^= num
    end
  end

  [] << n1 << n2
end
