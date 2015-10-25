# https://leetcode.com/problems/minimum-size-subarray-sum/
#
# Given an array of n positive integers and a positive integer s, find the
# minimal length of a subarray of which the sum >= s. If there isn't one,
# return 0 instead.
#
# For example, given the array [2, 3, 1, 2, 4, 3] and s = 7, the subarray
# [4, 3] has the minimal length under the problem constraint.
#
# Credits:
#
#     Special thanks to @Freezen for adding this problem and creating all
#     test cases.


# @param {Integer} s
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(s, nums)
  sum = 0
  idx = nums.find_index { |num| (sum += num) >= s }
  return 0 unless idx

  minlen = idx + 1
  while true
    while sum >= s && sum - nums[idx - minlen + 1] >= s
      sum -= nums[idx - minlen + 1]
      minlen -= 1
    end

    idx += 1
    break if idx >= nums.size
    sum = sum + nums[idx] - nums[idx - minlen]
  end
  minlen
end
