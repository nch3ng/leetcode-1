# https://leetcode.com/problems/binary-search-tree-iterator/
#
# Implement an iterator over a binary search tree (BST). Your iterator will
# be initialized with the root node of a BST. Calling next() will return the
# next smallest number in the BST.
#
# Note:
#
#     next() and hasNext() should run in average O(1) time and uses O(h)
#     memory, where h is the height of the tree.
#
# Credits:
#
#     Special thanks to @ts for adding this problem and creating all test
#     cases.


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


class BSTIterator
  # @param {TreeNode} root
  def initialize(root)
    @fiber = Fiber.new { _inorder_traversal_(root) }
    @node, @nextnode = nil, @fiber.resume
  end

  # @return {Boolean}
  def has_next
    !!@nextnode
  end

  # @return {Integer}
  def next
    @node, @nextnode = @nextnode, @fiber.resume
    @node.val
  end

  # @return {TreeNode}
  private def _inorder_traversal_(root)
    return nil if root.nil?

    node, stack = root, []
    while true
      Fiber.yield node if node.left.nil?

      if node.left || node.right
        stack.push(node)
        node = node.left || node.right
        next
      end

      while true
        pnode = stack.pop
        return nil if pnode.nil?

        if node == pnode.left
          Fiber.yield pnode
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
end


# Your BSTIterator will be called like this:
# i, v = BSTIterator.new(root), []
# while i.has_next()
#   v << i.next
# end
