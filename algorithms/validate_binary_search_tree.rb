# https://leetcode.com/problems/validate-binary-search-tree/
#
# Given a binary tree, determine if it is a valid binary search tree (BST).
#
# Assume a BST is defined as follows:
#
#     + The left subtree of a node contains only nodes with keys less than
#       the node's key.
#     + The right subtree of a node contains only nodes with keys greater
#       than the node's key.
#     + Both the left and right subtrees must also be binary search trees.


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  return true if root.nil?
  return _is_valid_bst_(root)[0]
end

private def _is_valid_bst_(root)
  l, r, val = root.left, root.right, root.val
  minval = maxval = val

  if l
    lv = _is_valid_bst_(l)
    return [false, nil, nil] unless lv[0]
    return [false, nil, nil] unless lv[2] < val
    minval = lv[1]
  end

  if r
    rv = _is_valid_bst_(r)
    return [false, nil, nil] unless rv[0]
    return [false, nil, nil] unless rv[1] > val
    maxval = rv[2]
  end

  return [true, minval, maxval]
end
