# https://leetcode.com/problems/binary-tree-inorder-traversal/
#
# Given a binary tree, return the inorder traversal of its nodes' values.
#
# For example:
#
#     Given binary tree {1, #, 2, 3},
#
#         1
#          \
#           2
#          /
#         3
#
#     Return [1, 3, 2].
#
# Note: Recursive solution is trivial, could you do it iteratively?


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
def inorder_traversal(root)
  return [] if root.nil?

  node, stack, result = root, [], []
  while true
    result << node.val if node.left.nil?

    if node.left || node.right
      stack.push(node)
      node = node.left || node.right
      next
    end

    while true
      pnode = stack.pop
      return result if pnode.nil?

      if node == pnode.left
        result << pnode.val
        node = pnode
        next if node.right.nil?
        stack.push(node)
        node = node.right
        break
      else
        node = pnode
        next
      end
    end
  end
end
