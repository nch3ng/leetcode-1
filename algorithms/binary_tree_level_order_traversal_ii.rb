# https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
#
# Given a binary tree, return the bottom-up level order traversal of its
# nodes' values. (ie, from left to right, level by level from leaf to root).
#
# For example:
#
#     Given binary tree {3, 9, 20, #, #, 15, 7},
#
#           3
#          / \
#         9  20
#            / \
#           15  7
#
#     Return its level order traversal as:
#
#         [
#           [15, 7],
#           [9, 20],
#           [3]
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
def level_order_bottom(root)
  return [] if root.nil?

  tracing, paths, q = [], [], [root, nil]
  while true
    n = q.shift

    if n.nil?
      paths.insert(0, tracing.map(&:val))
      tracing.clear

      break if q.empty?
      q << nil; next
    end

    tracing << n
    q << n.left if n.left
    q << n.right if n.right
  end

  paths
end
