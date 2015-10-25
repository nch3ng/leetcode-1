# https://leetcode.com/problems/subsets/
#
# Given a set of distinct integers, nums, return all possible subsets.
#
# Notes:
#
#     + Elements in a subset must be in non-descending order.
#     + The solution set must not contain duplicate subsets.
#
# For example:
#
#     If nums = [1, 2, 3], a solution is:
#
#         [
#           [3],
#           [1],
#           [2],
#           [1, 2, 3],
#           [1, 3],
#           [2, 3],
#           [1, 2],
#           []
#         ]


# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  nums.sort.each_with_object([[]]) do |num, memo|
    memo.concat(memo.map(&->(s){ s.dup << num }))
  end
end
