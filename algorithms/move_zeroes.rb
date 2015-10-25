# https://leetcode.com/problems/move-zeroes/
#
# Given an array nums, write a function to move all 0's to the end of it while
# maintaining the relative order of the non-zero elements.
#
# For example, given nums = [0, 1, 0, 3, 12], after calling your function,
# nums should be [1, 3, 12, 0, 0].
#
# Notes:
#
#     + You must do this in-place without making a copy of the array.
#     + Minimize the total number of operations.
#
# Credits:
#
#     Special thanks to @jianchao.li.fighter for adding this problem and
#     creating all test cases.


# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  idx = nums.index(0)
  return if idx.nil?

  cursor = idx
  idx.upto(nums.size - 1) do |i|
    if nums[i].nonzero?
      nums[cursor] = nums[i]
      cursor += 1
    end
  end

  idx = cursor
  idx.upto(nums.size - 1) do |i|
    nums[i] = 0
  end; nil
end
