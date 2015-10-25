# https://leetcode.com/problems/path-sum/
#
# Given a binary tree and a sum, determine if the tree has a root-to-leaf path
# such that adding up all the values along the path equals the given sum.
#
# For example:
#
#     Given the below binary tree and sum = 22,
#
#               5
#              / \
#             4   8
#            /   / \
#           11  13  4
#          / \       \
#         7   2       1
#
#     Return true, as there exist a root-to-leaf path 5 -> 4 -> 11 -> 2 which
#     sum is 22.


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {TreeNode} root
# @param {Integer} sum
# @return {Boolean}
def has_path_sum(root, sum)
  return false if root.nil?
  return _has_path_sum_(root, 0, sum)
end

private def _has_path_sum_(root, s, sum)
  l, r, v = root.left, root.right, root.val
  return s + v == sum if l.nil? && r.nil?

  return true if l && _has_path_sum_(l, s + v, sum)
  return true if r && _has_path_sum_(r, s + v, sum)
  return false
end
