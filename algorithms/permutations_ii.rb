# https://leetcode.com/problems/permutations-ii/
#
# Given a collection of numbers that might contain duplicates, return all
# possible unique permutations.
#
# For example:
#
#     [1, 1, 2] have the following unique permutations:
#     [1, 1, 2], [1, 2, 1], and [2, 1, 1].


# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
  [].tap do |result|
    _permute_unique_(nums, 0, [], result)
  end
end

private def _permute_unique_(nums, idx, tracing, result)
  if idx == nums.size
    result << tracing; return
  end

  m = {}
  idx.upto(nums.size - 1) do |i|
    next if m[nums[i]]
    m[nums[i]] = true

    nums[i], nums[idx] = nums[idx], nums[i]
    _permute_unique_(nums, idx + 1, tracing.dup << nums[idx], result)
    nums[i], nums[idx] = nums[idx], nums[i]
  end
end
