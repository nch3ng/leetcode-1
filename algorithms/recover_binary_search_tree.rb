# https://leetcode.com/problems/recover-binary-search-tree/
#
# Two elements of a binary search tree (BST) are swapped by mistake. Recover
# the tree without changing its structure.
#
# Note: A solution using O(n) space is pretty straight forward. Could you
# devise a constant space solution?


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def recover_tree(root)
  n1, n2 = nil, nil

  curr, prev = root, TreeNode.new(-Float::INFINITY)
  while curr
    if curr.left.nil?
      if prev.val > curr.val
        n1.nil? ? (n1, n2 = prev, curr) : (n2 = curr)
      end
      prev, curr = curr, curr.right
    else
      node = curr.left
      node = node.right while node.right && node.right != curr

      if node.right.nil?
        node.right = curr
        curr = curr.left
      else
        if prev.val > curr.val
          n1.nil? ? (n1, n2 = prev, curr) : (n2 = curr)
        end
        node.right = nil
        prev, curr = curr, curr.right
      end
    end
  end

  n1.val, n2.val = n2.val, n1.val; nil
end
