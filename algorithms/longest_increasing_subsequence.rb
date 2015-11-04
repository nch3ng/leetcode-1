# https://leetcode.com/problems/longest-increasing-subsequence/
#
# Given an unsorted array of integers, find the length of longest increasing
# subsequence.
#
# For example, Given [10, 9, 2, 5, 3, 7, 101, 18], The longest increasing
# subsequence is [2, 3, 7, 101], therefore the length is 4. Note that there
# may be more than one LIS combination, it is only necessary for you to return
# the length.
#
# Your algorithm should run in O(n2) complexity.
#
# Follow up:
#
#     Could you improve it to O(n log n) time complexity?
#
# Credits:
#
#     Special thanks to @pbrother for adding this problem and creating all
#     test cases.


# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  array = []

  nums.each do |num|
    idx = (0...array.size).bsearch { |i| array[i] >= num } || array.size
    array[idx] = num
  end

  array.size
end
