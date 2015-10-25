# https://leetcode.com/problems/first-missing-positive/
#
# Given an unsorted integer array, find the first missing positive integer.
#
# For example:
#
#     Given [1, 2, 0] return 3, and [3, 4, -1, 1] return 2.
#
# Your algorithm should run in O(n) time and uses constant space.


# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
  nums << 0

  idx, size = 0, nums.size
  while idx < size
    (idx += 1; next) if nums[idx] < 0 || nums[idx] >= size
    (idx += 1; next) if nums[idx] == idx
    (idx += 1; next) if nums[nums[idx]] == nums[idx]

    tmp = nums[nums[idx]]
    nums[nums[idx]] = nums[idx]
    nums[idx] = tmp
  end

  nums.each_with_index { |n, i| return i if n != i }
  nums.size
end
