# https://leetcode.com/problems/balanced-binary-tree/
#
# Given a binary tree, determine if it is height-balanced. For this
# problem, a height-balanced binary tree is defined as a binary
# tree in which the depth of the two subtrees of every node never
# differ by more than 1.


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#     def initialize(val)
#       @val = val
#       @left, @right = nil, nil
#     end
# end


# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root)
  _is_balanced_(root) != -1
end

private def _is_balanced_(root)
  return  0 if root.nil?
  return -1 if (ldepth = _is_balanced_(root.left )) == -1
  return -1 if (rdepth = _is_balanced_(root.right)) == -1
  return -1 if (ldepth - rdepth).abs > 1
  return [ldepth, rdepth].max + 1
end
