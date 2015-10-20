# https://leetcode.com/problems/count-complete-tree-nodes/
#
# Given a complete binary tree, count the number of nodes.


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {TreeNode} root
# @return {Integer}
def count_nodes(root)
  return 0 if root.nil?

  l, ldepth = root, 1
  ldepth += 1 while l = l.left

  r, rdepth = root, 1
  rdepth += 1 while r = r.right

  return 2 ** ldepth - 1 if ldepth == rdepth
  return 1 + count_nodes(root.left) + count_nodes(root.right)
end
