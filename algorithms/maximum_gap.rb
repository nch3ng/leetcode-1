# https://leetcode.com/problems/maximum-gap/
#
# Given an unsorted array, find the maximum difference between the successive
# elements in its sorted form. Try to solve it in linear time/space. Return 0
# if the array contains less than 2 elements.
#
# You may assume all elements in the array are non-negative integers and fit
# in the 32-bit signed integer range.
#
# Credits:
#
#     Special thanks to @porker2008 for adding this problem and creating all
#     test cases.


# Limits on Integer Constants
INT_BIT = 32
INT_MAX =  2 ** (INT_BIT - 1) - 1
INT_MIN = -2 ** (INT_BIT - 1)


# @param {Integer[]} nums
# @return {Integer}
def maximum_gap(nums)
  return 0 if nums.size < 2

  min, max = nums.minmax
  return 0 if min == max

  interval = (max - min).fdiv(nums.size - 1)
  minarray = Array.new(nums.size, INT_MAX)
  maxarray = Array.new(nums.size, INT_MIN)

  nums.each do |num|
    aidx = (num - min).fdiv(interval).floor
    minarray[aidx] = num if minarray[aidx] > num
    maxarray[aidx] = num if maxarray[aidx] < num
  end

  gap = maxarray[0] - minarray[0]
  num = maxarray[0]
  1.upto(nums.size - 1) do |aidx|
    next if minarray[aidx] == INT_MAX
    gap = minarray[aidx] - num if gap < minarray[aidx] - num
    num = maxarray[aidx]
  end
  gap
end
