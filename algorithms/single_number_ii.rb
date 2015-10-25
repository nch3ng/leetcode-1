# https://leetcode.com/problems/single-number-ii/
#
# Given an array of integers, every element appears three times except for one.
# Find that single one.
#
# Note: Your algorithm should have a linear runtime complexity. Could you
# implement it without using extra memory?


# Limits on Integer Constants
INT_BIT = 32
INT_MAX =  2 ** (INT_BIT - 1) - 1
INT_MIN = -2 ** (INT_BIT - 1)


# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  count, snumber = Array.new(INT_BIT, 0), 0

  INT_BIT.times do |idx|
    nums.each do |num|
      count[idx] += (num >> idx) & 1
    end
    snumber |= (count[idx] % 3) << idx
  end

  snumber > INT_MAX ? snumber - (INT_MAX - INT_MIN + 1) : snumber
end
