# https://leetcode.com/problems/find-the-duplicate-number/
#
# Given an array nums containing n + 1 integers where each integer is between
# 1 and n (inclusive), prove that at least one duplicate number must exist.
# Assume that there is only one duplicate number, find the duplicate one.
#
# Notes:
#
#     + You must not modify the array (assume the array is read only).
#     + You must use only constant, O(1) extra space.
#     + Your runtime complexity should be less than O(n2).
#     + There is only one duplicate number in the array, but it could be
#       repeated more than once.
#
# Credits:
#
#     Special thanks to @jianchao.li.fighter for adding this problem and
#     creating all test cases.


# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
  start = nums.size

  fast, slow = start, start
  loop do
    fast = nums[nums[fast - 1] - 1]
    slow = nums[slow - 1]
    break if fast == slow
  end

  slow = start
  loop do
    fast = nums[fast - 1]
    slow = nums[slow - 1]
    break if fast == slow
  end

  fast
end
