# https://leetcode.com/problems/longest-consecutive-sequence/
#
# Given an unsorted array of integers, find the length of the longest
# consecutive elements sequence.
#
# For example, Given [100, 4, 200, 1, 3, 2], The longest consecutive elements
# sequence is [1, 2, 3, 4]. Return its length: 4.
#
# Your algorithm should run in O(n) complexity.


# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  maxlen, map = 1, nums.each_with_object({}) { |num, memo| memo[num] = num }

  nums.each do |num|
    midnum = map.delete(num)
    next unless midnum

    len  = 1
    len += 1 while (midnum = map.delete(midnum - 1))

    midnum = num
    len += 1 while (midnum = map.delete(midnum + 1))

    maxlen = len if maxlen < len
  end

  maxlen
end
