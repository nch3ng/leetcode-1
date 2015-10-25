# https://leetcode.com/problems/subsets-ii/
#
# Given a collection of integers that might contain duplicates, nums, return
# all possible subsets.
#
# Notes:
#
#     + Elements in a subset must be in non-descending order.
#     + The solution set must not contain duplicate subsets.
#
# For example:
#
#     If nums = [1, 2, 2], a solution is:
#
#         [
#           [2],
#           [1],
#           [1, 2, 2],
#           [2, 2],
#           [1, 2],
#           []
#         ]


# @param {Integer[]} nums
# @return {Integer[][]}
def subsets_with_dup(nums)
  nums.sort.each_with_object([[]]) do |num, memo|
    memo.concat(memo.map(&->(s){ s.dup << num }))
  end.uniq
end
