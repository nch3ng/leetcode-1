# https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
#
# Given preorder and inorder traversal of a tree, construct the binary tree.
#
# Note: You may assume that duplicates do not exist in the tree.


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  inorder_map = {}
  inorder.each_with_index { |num, idx| inorder_map[num] = idx }

  _build_tree_(
    preorder, 0, preorder.size,
     inorder, 0,  inorder.size, inorder_map
  )
end

private def _build_tree_(preorder, pl, pu, inorder, il, iu, inorder_map)
  return nil if pu - pl <= 0

  num = preorder[pl]
  return TreeNode.new(num) if pu - pl == 1

  im = inorder_map[num]
  pm = pl + 1 + (im - il)

  ltree = _build_tree_(preorder, pl + 1, pm, inorder, il, im, inorder_map)
  rtree = _build_tree_(preorder, pm, pu, inorder, im + 1, iu, inorder_map)

  root = TreeNode.new(num)
  root.left, root.right = ltree, rtree
  root
end
