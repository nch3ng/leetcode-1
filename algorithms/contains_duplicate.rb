# https://leetcode.com/problems/contains-duplicate/
#
# Given an array of integers, find if the array contains any duplicates. Your
# function should return true if any value appears at least twice in the array,
# and it should return false if every element is distinct.


# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  map = {}
  nums.each do |num|
    return true if map[num]
    map[num] = true
  end
  return false
end
