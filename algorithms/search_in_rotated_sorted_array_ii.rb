# https://leetcode.com/problems/search-in-rotated-sorted-array-ii/
#
# Follow up for "Search in Rotated Sorted Array":
#
#     What if duplicates are allowed?
#     Would this affect the run-time complexity? How and why?
#
# Write a function to determine if a given target is in the array.


# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  offset = _find_min_(nums)

  i = (0...nums.size).bsearch do |base|
    nums[(base + offset) % nums.size] >= target
  end || 0

  i = (i + offset) % nums.size
  nums[i] == target
end

private def _find_min_(nums)
  return 0 if nums[0] < nums[-1]

  lbound, ubound = 0, nums.size - 1
  while ubound - lbound > 1
    if nums[lbound] == nums[ubound]
      lbound += 1 while lbound < ubound && nums[lbound] == nums[ubound]
      return lbound if nums[lbound] < nums[ubound]
    end

    m = (ubound + lbound) / 2

    if nums[m] < nums[lbound]
      ubound = m
    else
      lbound = m
    end
  end

  ubound
end
