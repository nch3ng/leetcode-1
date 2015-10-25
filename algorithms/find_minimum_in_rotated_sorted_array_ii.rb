# https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/
#
# Follow up for "Find Minimum in Rotated Sorted Array":
#
#     What if duplicates are allowed?
#     Would this affect the run-time complexity? How and why?
#
# Suppose a sorted array is rotated at some pivot unknown to you beforehand.
#
#     (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
#
# Find the minimum element. The array may contain duplicates.


# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  return nums[0] if nums[0] < nums[-1]

  lbound, ubound = 0, nums.size - 1
  while ubound - lbound > 1
    if nums[lbound] == nums[ubound]
      lbound += 1 while lbound < ubound && nums[lbound] == nums[ubound]
      return nums[lbound] if nums[lbound] < nums[ubound]
    end

    m = (ubound + lbound) / 2

    if nums[m] < nums[lbound]
      ubound = m
    else
      lbound = m
    end
  end

  nums[ubound]
end
