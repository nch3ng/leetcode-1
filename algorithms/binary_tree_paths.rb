# https://leetcode.com/problems/binary-tree-paths/
#
# Given a binary tree, return all root-to-leaf paths.
#
# For example:
#
#     Given the following binary tree:
#
#           1
#          / \
#         2   3
#          \
#           5
#
#     All root-to-leaf paths are:
#
#         ["1->2->5", "1->3"]
#
# Credits:
#
#     Special thanks to @jianchao.li.fighter for adding this problem and
#     creating all test cases.


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {TreeNode} root
# @return {String[]}
def binary_tree_paths(root)
  return [] if root.nil?
  return [].tap { |paths| _traversal_(root, [], paths) }
end

private def _traversal_(root, tracing, paths)
  tracing.push(root)

  l, r = root.left, root.right
  if l.nil? && r.nil?
    paths << tracing.map(&:val).join('->')
  else
    _traversal_(l, tracing, paths) if l
    _traversal_(r, tracing, paths) if r
  end

  tracing.pop
end
