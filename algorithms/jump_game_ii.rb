# https://leetcode.com/problems/jump-game-ii/
#
# Given an array of non-negative integers, you are initially positioned at the
# first index of the array. Each element in the array represents your maximum
# jump length at that position. Your goal is to reach the last index in the
# minimum number of jumps.
#
# For example:
#
#     Given array A = [2, 3, 1, 1, 4]
#     The minimum number of jumps to reach the last index is 2. (Jump 1 step
#     from index 0 to 1, then 3 steps to the last index.)


# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  max, submax, steps = 0, 0, 1

  lbound, ubound, maxbound = 0, nums.size - 1, max
  return 0 if max >= ubound

  while true
    lbound.upto(maxbound) do |idx|
      submax = idx + nums[idx]
      max = submax if max <  submax
      return steps if max >= ubound
    end

    steps += 1
    lbound, maxbound = maxbound + 1, max
  end
end
