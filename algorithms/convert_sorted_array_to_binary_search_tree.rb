# https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/
#
# Given an array where elements are sorted in ascending order, convert it to a
# height balanced BST.


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
  _sorted_array_to_bst_(nums, 0, nums.size)
end

private def _sorted_array_to_bst_(nums, lbound, ubound)
  return nil unless lbound < ubound

  m = (lbound + ubound) / 2

  l = _sorted_array_to_bst_(nums, lbound, m)
  r = _sorted_array_to_bst_(nums, m + 1, ubound)
  return TreeNode.new(nums[m]).tap { |n| n.left, n.right = l, r }
end
