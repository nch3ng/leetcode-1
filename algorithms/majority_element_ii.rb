# https://leetcode.com/problems/majority-element-ii/
#
# Given an integer array of size n, find all elements that appear more than
# n/3 times. The algorithm should run in linear time and in O(1) space.


# @param {Integer[]} nums
# @return {Integer[]}
def majority_element(nums)
  n1, n2, c1, c2 = nil, nil, 0, 0

  nums.each do |num|
    if num == n1
      c1 += 1
    elsif num == n2
      c2 += 1
    elsif c1.zero?
      n1, c1 = num, 1
    elsif c2.zero?
      n2, c2 = num, 1
    else
      c1 -= 1
      c2 -= 1
    end
  end

  c1, c2 = 0, 0
  nums.each do |num|
    if num == n1
      c1 += 1
    elsif num == n2
      c2 += 1
    end
  end

  [c1 > nums.size / 3 ? n1 : nil, c2 > nums.size / 3 ? n2 : nil].compact
end
