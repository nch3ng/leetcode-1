# https://leetcode.com/problems/search-in-rotated-sorted-array/
#
# Suppose a sorted array is rotated at some pivot unknown to you beforehand.
#
#     (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
#
# You are given a target value to search. If found in the array return its
# index, otherwise return -1.
#
# You may assume no duplicate exists in the array.


# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  offset = _find_min_(nums)

  i = (0...nums.size).bsearch do |base|
    nums[(base + offset) % nums.size] >= target
  end || 0

  i = (i + offset) % nums.size
  nums[i] == target ? i : -1
end

private def _find_min_(nums)
  return 0 if nums[0] < nums[-1]

  lbound, ubound = 0, nums.size - 1
  while ubound - lbound > 1
    m = (ubound + lbound) / 2

    if nums[m] < nums[lbound]
      ubound = m
    else
      lbound = m
    end
  end

  ubound
end
