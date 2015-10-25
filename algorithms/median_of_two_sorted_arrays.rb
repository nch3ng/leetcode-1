# https://leetcode.com/problems/median-of-two-sorted-arrays/
#
# There are two sorted arrays nums1 and nums2 of size m and n respectively.
# Find the median of the two sorted arrays. The overall run time complexity
# should be O(log(m+n)).


# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  l1, u1 = 0, nums1.size - 1
  l2, u2 = 0, nums2.size - 1
  numlen = nums1.size + nums2.size

  k1 = _kth_smallest_(nums1, l1, u1, nums2, l2, u2, numlen / 2 + 1)
  return k1 if (numlen % 2).nonzero?

  k2 = _kth_smallest_(nums1, l1, u1, nums2, l2, u2, numlen / 2)
  return (k1 + k2).fdiv(2)
end

private def _kth_smallest_(nums1, l1, u1, nums2, l2, u2, kth)
  s1, s2 = u1 - l1 + 1, u2 - l2 + 1
  return _kth_smallest_(nums2, l2, u2, nums1, l1, u1, kth) if s1 > s2

  return nums2[kth - 1] if s1 == 0
  return nums1[l1] < nums2[l2] ? nums1[l1] : nums2[l2] if kth == 1

  k1 = kth / 2 < s1 ? kth / 2 : s1
  k2 = kth - k1
  case nums1[l1 + k1 - 1] <=> nums2[l2 + k2 - 1]
  when -1
    return _kth_smallest_(nums1, l1 + k1, u1, nums2, l2, u2, k2)
  when  1
    return _kth_smallest_(nums1, l1, u1, nums2, l2 + k2, u2, k1)
  when  0
    return nums1[l1 + k1 - 1]
  end
end
