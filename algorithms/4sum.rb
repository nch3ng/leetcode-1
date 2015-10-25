# https://leetcode.com/problems/4sum/
#
# Given an array S of n integers, are there elements a, b, c, and d in S such
# that a + b + c + d = target? Find all unique quadruplets in the array which
# gives the sum of target.
#
# Notes:
#
#     + Elements in a quadruplet (a, b, c, d) must be in non-descending order.
#       (ie, a <= b <= c <= d)
#     + The solution set must not contain duplicate quadruplets.
#
# For example, given array S = {1 0 -1 0 -2 2}, and target = 0. A solution set
# is:
#
#     (-1,  0, 0, 1)
#     (-2, -1, 1, 2)
#     (-2,  0, 0, 2)


# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum(nums, target)
  nums = nums.sort

  result = []
  0.upto(nums.size - 1 - 3) do |ai|
    next if ai > 0 && nums[ai] == nums[ai - 1]

    (nums.size - 1).downto(ai + 3) do |di|
      next if nums[di] == nums[di + 1]

      subsum = target - nums[ai] - nums[di]
      bi, ci = ai + 1, di - 1
      next unless subsum.between?(nums[bi] * 2, nums[ci] * 2)

      while bi < ci
        case nums[bi] + nums[ci] <=> subsum
        when -1
          bi += 1
        when  1
          ci -= 1
        when  0
          result << [nums[ai], nums[bi], nums[ci], nums[di]]
          bi += 1
          bi += 1 while bi < ci && nums[bi] == nums[bi - 1]
          ci -= 1
          ci -= 1 while bi < ci && nums[ci] == nums[ci + 1]
        end
      end
    end
  end
  result
end
