# https://leetcode.com/problems/next-permutation/
#
# Implement next permutation, which rearranges numbers into the
# lexicographically next greater permutation of numbers. If such arrangement
# is not possible, it must rearrange it as the lowest possible order (ie,
# sorted in ascending order). The replacement must be in-place, do not
# allocate extra memory. Here are some examples. Inputs are in the left-hand
# column and its corresponding outputs are in the right-hand column.
#
#     1, 2, 3 -> 1, 3, 2
#     3, 2, 1 -> 1, 2, 3
#     1, 1, 5 -> 1, 5, 1


# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
  if nums.size < 3
    nums.reverse!; return
  end

  n, i = nums[-1], nums.size - 1
  nums.reverse_each do |num|
    break if num < n
    n = num; i -= 1
  end

  if i == -1
    nums.reverse!; return
  end

  j = nums.size - 1
  nums.reverse_each do |num|
    break if nums[i] < num
    j -= 1
  end

  nums[i], nums[j] = nums[j], nums[i]
  nums[(i + 1)..-1] = nums[(i + 1)..-1].reverse!
  nil
end
