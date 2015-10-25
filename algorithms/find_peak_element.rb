# https://leetcode.com/problems/find-peak-element/
#
# A peak element is an element that is greater than its neighbors. Given an
# input array where num[i] != num[i+1], find a peak element and return its
# index. The array may contain multiple peaks, in that case return the index
# to any one of the peaks is fine. You may imagine that
# num[-1] = num[n] = -Inf.
#
# For example, in array [1, 2, 3, 1], 3 is a peak element and your function
# should return the index number 2.
#
# Note:
#
#     Your solution should be in logarithmic complexity.
#
# Credits:
#
#     Special thanks to @ts for adding this problem and creating all test
#     cases.


# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  lbound, ubound = 0, nums.size - 1

  while ubound - lbound > 1
    m = (ubound + lbound) / 2

    if nums[m] < nums[m + 1]
      lbound = m
    else
      ubound = m
    end
  end

  return ubound if nums[lbound] < nums[ubound]
  return lbound
end
