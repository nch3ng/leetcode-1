# https://leetcode.com/problems/combinations/
#
# Given two integers n and k, return all possible combinations of k numbers
# out of 1 ... n.
#
# For example, If n = 4 and k = 2, a solution is:
#
#     [
#       [2, 4],
#       [3, 4],
#       [2, 3],
#       [1, 2],
#       [1, 3],
#       [1, 4],
#     ]


# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine(n, k)
  Array(1..n).combination(k).to_a
end
