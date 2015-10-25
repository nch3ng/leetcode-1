# https://leetcode.com/problems/path-sum-ii/
#
# Given a binary tree and a sum, find all root-to-leaf paths where each path's
# sum equals the given sum.
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
#          /  \    / \
#         7    2  5   1
#
#     Return
#
#         [
#           [5, 4, 11, 2],
#           [5, 8, 4, 5]
#         ]


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
# @return {Integer[][]}
def path_sum(root, sum)
  return [] if root.nil?
  return [].tap { |paths| _traversal_(root, 0, sum, [], paths) }
end

private def _traversal_(root, s, sum, tracing, paths)
  tracing.push(root)

  l, r, v = root.left, root.right, root.val
  if l.nil? && r.nil?
    paths << tracing.map(&:val) if s + v == sum
  else
    _traversal_(l, s + v, sum, tracing, paths) if l
    _traversal_(r, s + v, sum, tracing, paths) if r
  end

  tracing.pop
end
