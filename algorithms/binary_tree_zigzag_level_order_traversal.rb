# https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/
#
# Given a binary tree, return the zigzag level order traversal of its nodes'
# values. (ie, from left to right, then right to left for the next level and
# alternate between).
#
# For example:
#
#     Given binary tree {3, 9, 20, #, #, 15, 7},
#
#           3
#          / \
#         9  20
#           /  \
#          15   7
#
#     Return its zigzag level order traversal as:
#
#         [
#           [3],
#           [20, 9],
#           [15, 7]
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
# @return {Integer[][]}
def zigzag_level_order(root)
  return [] if root.nil?

  tracing, paths, q, l2r = [], [], [root, nil], true
  while true
    n = q.shift

    if n.nil?
      paths << (l2r ? tracing.map(&:val) : tracing.map(&:val).reverse)
      tracing.clear; l2r = !l2r

      break if q.empty?
      q << nil; next
    end

    tracing << n
    q << n.left if n.left
    q << n.right if n.right
  end

  paths
end
