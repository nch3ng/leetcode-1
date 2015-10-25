# https://leetcode.com/problems/house-robber-ii/
#
# This is an extension of "House Robber".
#
# After robbing those houses on that street, the thief has found himself a new
# place for his thievery so that he will not get too much attention. This time,
# all houses at this place are arranged in a circle. That means the first
# house is the neighbor of the last one. Meanwhile, the security system for
# these houses remain the same as for those in the previous street.
#
# Given a list of non-negative integers representing the amount of money of
# each house, determine the maximum amount of money you can rob tonight
# without alerting the police.
#
# Credits:
#
#     Special thanks to @Freezen for adding this problem and creating all
#     test cases.


# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  return nums[0] if nums.size == 1
  return [_rob_(nums, 0, nums.size - 2), _rob_(nums, 1, nums.size - 1)].max
end

private def _rob_(nums, lbound, ubound)
  rob_include_nth, rob_exclude_nth = 0, 0

  lbound.upto(ubound).each do |idx|
    rob_include_nth, rob_exclude_nth =
      rob_exclude_nth + nums[idx], [rob_exclude_nth, rob_include_nth].max
  end

  return rob_include_nth if rob_include_nth > rob_exclude_nth
  return rob_exclude_nth
end
