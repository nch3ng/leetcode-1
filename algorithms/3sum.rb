# https://leetcode.com/problems/3sum/
#
# Given an array S of n integers, are there elements a, b, c in S such that
# a + b + c = 0? Find all unique triplets in the array which gives the sum
# of zero.
#
# Notes:
#
#     + Elements in a triplet (a, b, c) must be in non-descending order.
#       (ie, a <= b <= c)
#     + The solution set must not contain duplicate triplets.
#
# For example, given array S = {-1 0 1 2 -1 -4}, A solution set is:
#
#     (-1,  0, 1)
#     (-1, -1, 2)


# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  nums = nums.sort
  bound = (0...nums.size).bsearch { |i| nums[i] >= 0 }
  return [] if bound.nil?

  result = []
  0.upto(bound) do |ai|
    next if ai > 0 && nums[ai] == nums[ai - 1]

    subsum = - nums[ai]
    bi, ci = ai + 1, nums.size - 1
    next unless subsum >= (nums[bi] || 0) * 2

    while bi < ci
      case nums[bi] + nums[ci] <=> subsum
      when -1
        bi += 1
      when  1
        ci -= 1
      when  0
        result << [nums[ai], nums[bi], nums[ci]]
        bi += 1
        bi += 1 while bi < ci && nums[bi] == nums[bi - 1]
        ci -= 1
        ci -= 1 while bi < ci && nums[ci] == nums[ci + 1]
      end
    end
  end
  result
end
