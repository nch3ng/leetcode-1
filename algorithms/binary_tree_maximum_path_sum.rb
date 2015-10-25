# https://leetcode.com/problems/binary-tree-maximum-path-sum/
#
# Given a binary tree, find the maximum path sum. For this problem, a path is
# defined as any sequence of nodes from some starting node to any node in the
# tree along the parent-child connections. The path does not need to go
# through the root.
#
# For example:
#
#     Given the below binary tree:
#
#           1
#          / \
#         2   3
#
#     Return 6.


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
def max_path_sum(root)
  _max_path_sum_(root)[1]
end

private def _max_path_sum_(root)
  return [0, nil] if root.nil?

  lpathsum, lmax = _max_path_sum_(root.left)
  rpathsum, rmax = _max_path_sum_(root.right)

  pathsum = root.val + [lpathsum, rpathsum, 0].max
  max = root.val + [lpathsum, 0].max + [rpathsum, 0].max
  max = lmax if lmax && lmax > max
  max = rmax if rmax && rmax > max

  return [pathsum, max]
end
