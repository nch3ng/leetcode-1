# https://leetcode.com/problems/sum-root-to-leaf-numbers/
#
# Given a binary tree containing digits from 0-9 only, each root-to-leaf path
# could represent a number. An example is the root-to-leaf path 1 -> 2 -> 3
# which represents the number 123. Find the total sum of all root-to-leaf
# numbers.
#
# For example:
#
#       1
#      / \
#     2   3
#
#     The root-to-leaf path 1->2 represents the number 12.
#     The root-to-leaf path 1->3 represents the number 13.
#     Return the sum = 12 + 13 = 25.


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
def sum_numbers(root)
  return 0 if root.nil?
  return [].tap(&Proc.new{ |nums| _traversal_(root, root.val, nums) }).reduce(&:+)
end

private def _traversal_(root, num, nums)
  l, r = root.left, root.right
  if l.nil? && r.nil?
    nums << num
  else
    _traversal_(l, 10 * num + l.val, nums) if l
    _traversal_(r, 10 * num + r.val, nums) if r
  end
end
