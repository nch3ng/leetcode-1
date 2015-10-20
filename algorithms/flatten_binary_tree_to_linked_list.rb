# https://leetcode.com/problems/flatten-binary-tree-to-linked-list/
#
# Given a binary tree, flatten it to a linked list in-place.
#
# For example, Given
#
#         1
#        / \
#       2   5
#      / \   \
#     3   4   6
#
# The flattened tree should look like:
#
#     1
#      \
#       2
#        \
#         3
#          \
#           4
#            \
#             5
#              \
#               6


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def flatten(root)
  (_flatten_(root); nil) if root
end

private def _flatten_(root)
  l, r = root.left, root.right
  return root if l.nil? && r.nil?
  return _flatten_(r) if l.nil?

  last = _flatten_(l)
  root.left, root.right = nil, l
  return last if r.nil?

  last.right = r
  return _flatten_(r)
end
