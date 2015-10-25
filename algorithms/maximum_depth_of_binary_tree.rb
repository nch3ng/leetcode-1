# https://leetcode.com/problems/maximum-depth-of-binary-tree/
#
# Given a binary tree, find its maximum depth. The maximum depth is the number
# of nodes along the longest path from the root node down to the farthest leaf
# node.


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  return 0 if root.nil?

  depth, q = 0, [root, nil]
  while true
    n = q.shift

    if n.nil?
      depth += 1

      break if q.empty?
      q << nil; next
    end

    q << n.left if n.left
    q << n.right if n.right
  end
  depth
end
