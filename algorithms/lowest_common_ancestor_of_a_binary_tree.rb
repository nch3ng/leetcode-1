# https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
#
# Given a binary tree, find the lowest common ancestor (LCA) of two given
# nodes in the tree. According to the definition of LCA on Wikipedia: "The
# lowest common ancestor is defined between two nodes v and w as the lowest
# node in T that has both v and w as descendants (where we allow a node to be
# a descendant of itself)."
#
#           ----3----
#          /         \
#       --5--       --1--
#      /     \     /     \
#     6      -2-  0       8
#           /   \
#          7     4
#
# For example, the lowest common ancestor (LCA) of nodes 5 and 1 is 3. Another
# example is LCA of nodes 5 and 4 is 5, since a node can be a descendant of
# itself according to the LCA definition.


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#  end
# end


# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  return root if root.nil? || root == p || root == q

  l = lowest_common_ancestor(root.left, p, q)
  r = lowest_common_ancestor(root.right, p, q)
  return l && r ? root : (l ? l : r)
end
