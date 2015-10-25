# https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
#
# Given a binary search tree (BST), find the lowest common ancestor (LCA) of
# two given nodes in the BST. According to the definition of LCA on Wikipedia:
# “The lowest common ancestor is defined between two nodes v and w as the
# lowest node in T that has both v and w as descendants (where we allow a node
# to be a descendant of itself).”
#
#           ----6----
#          /         \
#       --2--       --8--
#      /     \     /     \
#     0      -4-  7       9
#           /   \
#          3     5
#
# For example, the lowest common ancestor (LCA) of nodes 2 and 8 is 6. Another
# example is LCA of nodes 2 and 4 is 2, since a node can be a descendant of
# itself according to the LCA definition.


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  while true
    v1 = root.val - p.val
    v2 = root.val - q.val

    return root if v1 * v2 <= 0
    v1 > 0 ? root = root.left : root = root.right
  end
end
