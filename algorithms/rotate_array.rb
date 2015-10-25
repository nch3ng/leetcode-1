# https://leetcode.com/problems/rotate-array/
#
# Rotate an array of n elements to the right by k steps.
#
# For example, with n = 7 and k = 3, the array [1, 2, 3, 4, 5, 6, 7] is
# rotated to [5, 6, 7, 1, 2, 3, 4].
#
# Credits:
#
#     Special thanks to @Freezen for adding this problem and creating all
#     test cases.


# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
  k.times { nums.unshift(nums.pop) }; nil
end
