# https://leetcode.com/problems/3sum-closest/
#
# Given an array S of n integers, find three integers in S such that the sum
# is closest to a given number, target. Return the sum of the three integers.
# You may assume that each input would have exactly one solution.
#
# For example, given array S = {-1 2 1 -4}, and target = 1. The sum that is
# closest to the target is 2. (-1 + 2 + 1 = 2).


# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  nums = nums.sort

  distance = nums[0..2].reduce(&:+) - target
  0.upto(nums.size - 3) do |ai|
    bi, ci = ai + 1, nums.size - 1

    while bi < ci
      sum = nums[ai] + nums[bi] + nums[ci]

      dis = sum - target
      return sum if dis == 0

      distance = dis if distance.abs > dis.abs
      bi += 1 if dis < 0
      ci -= 1 if dis > 0
    end
  end

  target + distance
end
