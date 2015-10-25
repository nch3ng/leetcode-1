# https://leetcode.com/problems/maximum-subarray/
#
# Find the contiguous subarray within an array (containing at least one number)
# which has the largest sum.  For example, given the array
# [−2, 1, −3, 4, −1, 2, 1, −5, 4], the contiguous subarray [4, −1, 2, 1] has
# the largest sum = 6.


# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  sum, subsum = nums[0], nums[0]

  1.upto(nums.size - 1) do |idx|
    subsum  = 0 if subsum < 0
    subsum += nums[idx]

    sum = subsum if sum < subsum
  end
  sum
end
