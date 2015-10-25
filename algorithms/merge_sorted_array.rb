# https://leetcode.com/problems/merge-sorted-array/
#
# Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as
# one sorted array.
#
# Note: You may assume that nums1 has enough space (size that is greater or
# equal to m + n) to hold additional elements from nums2. The number of
# elements initialized in nums1 and nums2 are m and n respectively.


# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  s1, s2 = m - 1, n - 1
  cursor = m + n - 1

  while s1 >= 0 && s2 >= 0
    if nums1[s1] > nums2[s2]
      nums1[cursor] = nums1[s1]
      cursor -= 1
      s1 -= 1
    else
      nums1[cursor] = nums2[s2]
      cursor -= 1
      s2 -= 1
    end
  end

  while s2 >= 0
    nums1[cursor] = nums2[s2]
    cursor -= 1
    s2 -= 1
  end

  nil
end
