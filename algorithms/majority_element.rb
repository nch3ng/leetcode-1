# https://leetcode.com/problems/majority-element/
#
# Given an array of size n, find the majority element. The majority element is
# the element that appears more than n/2 times. You may assume that the array
# is non-empty and the majority element always exist in the array.
#
# Credits:
#
#     Special thanks to @ts for adding this problem and creating all test
#     cases.


# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  map = {}

  limit = nums.size / 2
  nums.each do |num|
    map[num] = (map[num] || 0) + 1
    return num if map[num] > limit
  end
end
