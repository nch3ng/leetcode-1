# https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/
#
# Given inorder and postorder traversal of a tree, construct the binary tree.
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


# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree(inorder, postorder)
  inorder_map = {}
  inorder.each_with_index { |num, idx| inorder_map[num] = idx }

  _build_tree_(
    postorder, 0, postorder.size,
      inorder, 0,   inorder.size, inorder_map
  )
end

private def _build_tree_(postorder, pl, pu, inorder, il, iu, inorder_map)
  return nil if pu - pl <= 0

  num = postorder[pu - 1]
  return TreeNode.new(num) if pu - pl == 1

  im = inorder_map[num]
  pm = pl + (im - il)

  ltree = _build_tree_(postorder, pl, pm, inorder, il, im, inorder_map)
  rtree = _build_tree_(postorder, pm, pu - 1, inorder, im + 1, iu, inorder_map)

  root = TreeNode.new(num)
  root.left, root.right = ltree, rtree
  root
end
