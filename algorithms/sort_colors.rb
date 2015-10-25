# https://leetcode.com/problems/sort-colors/
#
# Given an array with n objects colored red, white or blue, sort them so that
# objects of the same color are adjacent, with the colors in the order red,
# white and blue.
#
# Here, we will use the integers 0, 1, and 2 to represent the color red, white,
# and blue respectively.
#
# Note: You are not suppose to use the library's sort function for this
# problem.


# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
  i1, i2, i3 = -1, -1, -1
  nums.each do |num|
    nums[i3 += 1] = 2
    nums[i2 += 1] = 1 unless num > 1
    nums[i1 += 1] = 0 unless num > 0
  end; nil
end
