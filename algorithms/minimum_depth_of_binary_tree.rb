# https://leetcode.com/problems/minimum-depth-of-binary-tree/
#
# Given a binary tree, find its minimum depth. The minimum depth is the number
# of nodes along the shortest path from the root node down to the nearest leaf
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
def min_depth(root)
  return 0 if root.nil?

  depth, q = 1, [root, nil]
  while true
    n = q.shift

    if n.nil?
      depth += 1

      break if q.empty?
      q << nil; next
    end

    break unless n.left || n.right
    q << n.left if n.left
    q << n.right if n.right
  end
  depth
end
