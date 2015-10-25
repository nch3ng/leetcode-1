# https://leetcode.com/problems/contains-duplicate-iii/
#
# Given an array of integers, find out whether there are two distinct indices
# i and j in the array such that the difference between nums[i] and nums[j] is
# at most t and the difference between i and j is at most k.


# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} t
# @return {Boolean}
def contains_nearby_almost_duplicate(nums, k, t)
  return _contains_nearby_duplicate_(nums, k) if t.zero?

  buckets = {}
  nums.each_with_index do |num, idx|
    bucketnum = num / t
    Range.new(bucketnum - 1, bucketnum + 1).each do |n|
      return true if buckets.key?(n) && (buckets[n] - num).abs <= t
    end

    buckets[bucketnum] = num
    buckets.delete(nums[idx - k] / t) if idx >= k
  end
  return false
end

private def _contains_nearby_duplicate_(nums, k)
  map = {}
  nums.each_with_index do |num, idx|
    return true if map[num] && (map[num] - idx).abs <= k
    map[num] = idx
  end
  return false
end
