# https://leetcode.com/problems/remove-element/
#
# Given an array and a value, remove all instances of that value in place and
# return the new length. The order of elements can be changed. It doesn't
# matter what you leave beyond the new length.


# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
  nums.delete(val)
  nums.size
end
