# https://leetcode.com/problems/range-sum-query-mutable/
#
# Given an integer array nums, find the sum of the elements between indices i
# and j (i <= j), inclusive. The update(i, val) function modifies nums by
# updating the element at index i to val.
#
# Example:
#
#     Given nums = [1, 3, 5]
#     sumRange(0, 2) -> 9
#     update(1, 2)
#     sumRange(0, 2) -> 8
#
# Note:
#
#     + The array is only modifiable by the update function.
#     + You may assume the number of calls to update and sumRange function is
#       distributed evenly.


class SegmentTreeNode
  attr_accessor :lbound, :ubound, :sum, :left, :right

  def initialize(lbound, ubound, sum=0)
    @lbound, @ubound, @sum = lbound, ubound, sum
  end
end


class SegmentTree
  def initialize(nums)
    @root = _build_tree_(nums, 0, nums.size)
  end

  def update(index, value)
    _update_(@root, index, value); value
  end

  def sum_range(lbound, ubound)
    _sum_range_(@root, lbound, ubound)
  end

  private def _build_tree_(nums, lbound, ubound)
    return nil if ubound - lbound <= 0

    node = SegmentTreeNode.new(lbound, ubound)
    return node.tap { |n| n.sum = nums[lbound] } if ubound - lbound == 1

     midd = _middle_(lbound, ubound)
    ltree = _build_tree_(nums, lbound, midd)
    rtree = _build_tree_(nums, midd, ubound)
    node.left, node.right = ltree, rtree
    return node.tap { |n| n.sum = n.left.sum + n.right.sum }
  end

  private def _update_(node, index, value)
    if node.ubound - node.lbound == 1
      node.sum = value; return
    end

    midd = _middle_(node.lbound, node.ubound)
    _update_(index < midd ? node.left : node.right, index, value)
    node.sum = node.left.sum + node.right.sum
  end

  private def _sum_range_(node, lbound, ubound)
    return node.sum if node.lbound == lbound && node.ubound == ubound

    midd = _middle_(node.lbound, node.ubound)
    ltree, rtree = node.left, node.right
    return _sum_range_(ltree, lbound, ubound) if midd >= ubound
    return _sum_range_(rtree, lbound, ubound) if midd <= lbound
    return _sum_range_(ltree, lbound, midd) + _sum_range_(rtree, midd, ubound)
  end

  private def _middle_(lbound, ubound)
    lbound + (ubound - lbound) / 2
  end
end


class NumArray
  # Initialize your data structure here.
  # @param {Integer[]} nums
  def initialize(nums)
    @tree = SegmentTree.new(nums)
  end

  # @param {Integer} i
  # @param {Integer} val
  # @return {Integer}
  def update(i, val)
    @tree.update(i, val)
  end

  # @param {Integer} i
  # @param {Integer} j
  # @return {Integer}
  def sum_range(i, j)
    @tree.sum_range(i, j + 1)
  end
end


# Your NumArray object will be instantiated and called as such:
# num_array = NumArray.new(nums)
# num_array.sum_range(0, 1)
# num_array.update(1, 10)
# num_array.sum_range(0, 2)
