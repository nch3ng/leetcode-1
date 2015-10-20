# https://leetcode.com/problems/unique-binary-search-trees/
#
# Given n, how many structurally unique BST's (binary search trees) that
# store values 1...n?
#
# For example, Given n = 3, there are a total of 5 unique BST's.
#
#     1         3     3      2      1
#      \       /     /      / \      \
#       3     2     1      1   3      2
#      /     /       \                 \
#     2     1         2                 3


# @param {Integer} n
# @return {Integer}
def num_trees(n)
  dp = Array.new(n + 1, 1)

  2.upto(n) do |bound|
    dp[bound] =
      Array(1..bound).map do |spt|
        dp[spt - 1] * dp[bound - spt]
      end.reduce(&:+)
  end

  dp[n]
end
