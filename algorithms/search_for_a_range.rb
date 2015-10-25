# https://leetcode.com/problems/search-for-a-range/
#
# Given a sorted array of integers, find the starting and ending position of a
# given target value. If the target is not found in the array, return [-1, -1].
#
# For example:
#
#     Given [5, 7, 7, 8, 8, 10] and target value 8, return [3, 4].
#
# Your algorithm's runtime complexity must be in the order of O(logn).


# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  lbound = (0...nums.size).bsearch { |i| nums[i] >= target }
  return [-1, -1] if lbound.nil?
  return [-1, -1] if nums[lbound] != target

  ubound = (lbound...nums.size).bsearch { |i| nums[i] > target }
  return [lbound, nums.size - 1] if ubound.nil?
  return [lbound, ubound - 1]
end
