# https://leetcode.com/problems/unique-binary-search-trees-ii/
#
# Given n, generate all structurally unique BST's (binary search trees) that
# store values 1...n.
#
# For example, Given n = 3, your program should return all 5 unique BST's
# shown below.
#
#
#     1         3     3      2      1
#      \       /     /      / \      \
#       3     2     1      1   3      2
#      /     /       \                 \
#     2     1         2                 3


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {Integer} n
# @return {TreeNode[]}
def generate_trees(n)
  _generate_trees_(Array(0...n), 0, n - 1)
end

private def _generate_trees_(nums, lbound, ubound)
  return [nil] if ubound < lbound

  result = []
  lbound.upto(ubound) do |spt|
    ls = _generate_trees_(nums, lbound, spt - 1)
    rs = _generate_trees_(nums, spt + 1, ubound)

    ls.each do |l|
      rs.each do |r|
        root = TreeNode.new(nums[spt] + 1)
        root.left, root.right = l, r
        result << root
      end
    end
  end
  result
end
