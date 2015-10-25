# https://leetcode.com/problems/binary-tree-postorder-traversal/
#
# Given a binary tree, return the postorder traversal of its nodes' values.
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
#     Return [3, 2, 1].
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
def postorder_traversal(root)
  return [] if root.nil?

  node, stack, result = root, [], []
  while true
    if node.left || node.right
      stack.push(node)
      node = node.left || node.right
      next
    end

    while true
      result << node.val

      pnode = stack.pop
      return result if pnode.nil?

      if node == pnode.left
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
