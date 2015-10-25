# https://leetcode.com/problems/house-robber/
#
# You are a professional robber planning to rob houses along a street. Each
# house has a certain amount of money stashed, the only constraint stopping
# you from robbing each of them is that adjacent houses have security system
# connected and it will automatically contact the police if two adjacent
# houses were broken into on the same night.
#
# Given a list of non-negative integers representing the amount of money of
# each house, determine the maximum amount of money you can rob tonight
# without alerting the police.
#
# Credits:
#
#     Special thanks to @ifanchu for adding this problem and creating all
#     test cases. Also thanks to @ts for adding additional test cases.


# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  rob_include_nth, rob_exclude_nth = 0, 0

  nums.each do |num|
    rob_include_nth, rob_exclude_nth =
      rob_exclude_nth + num, [rob_exclude_nth, rob_include_nth].max
  end

  return rob_include_nth if rob_include_nth > rob_exclude_nth
  return rob_exclude_nth
end
