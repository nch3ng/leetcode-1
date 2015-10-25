# https://leetcode.com/problems/binary-tree-right-side-view/
#
# Given a binary tree, imagine yourself standing on the right side of it,
# return the values of the nodes you can see ordered from top to bottom.
#
# For example:
#
#     Given the following binary tree,
#
#           1         <---
#          / \
#         2   3       <---
#          \   \
#           5   4     <---
#
#     Return [1, 3, 4].
#
# Credits:
#
#     Special thanks to @amrsaqr for adding this problem and creating all
#     test cases.


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {TreeNode} root
# @return {Integer[]}
def right_side_view(root)
  return [] if root.nil?

  v, q = [], [root, nil]
  while true
    n = q.shift

    if n.nil?
      break if q.empty?
      q << nil; next
    end

    v << n if q.first.nil?
    q << n.left if n.left
    q << n.right if n.right
  end
  v.map(&:val)
end
