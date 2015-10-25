# https://leetcode.com/problems/contains-duplicate-ii/
#
# Given an array of integers and an integer k, find out whether there are two
# distinct indices i and j in the array such that nums[i] = nums[j] and the
# difference between i and j is at most k.


# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  map = {}
  nums.each_with_index do |num, idx|
    return true if map[num] && (map[num] - idx).abs <= k
    map[num] = idx
  end
  return false
end
