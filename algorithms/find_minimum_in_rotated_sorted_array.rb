# https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
#
# Suppose a sorted array is rotated at some pivot unknown to you beforehand.
#
#     (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
#
# Find the minimum element. You may assume no duplicate exists in the array.


# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  return nums[0] if nums[0] < nums[-1]

  lbound, ubound = 0, nums.size - 1
  while ubound - lbound > 1
    m = (ubound + lbound) / 2

    if nums[m] < nums[lbound]
      ubound = m
    else
      lbound = m
    end
  end

  nums[ubound]
end
