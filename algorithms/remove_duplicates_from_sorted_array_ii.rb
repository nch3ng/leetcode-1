# https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
#
# Follow up for "Remove Duplicates":
#
#     What if duplicates are allowed at most twice?
#
# For example, Given sorted array nums = [1, 1, 1, 2, 2, 3], Your function
# should return length = 5, with the first five elements of nums being 1, 1,
# 2, 2 and 3. It doesn't matter what you leave beyond the new length.


# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  size, cursor = 0, 0

  while cursor < nums.size
    num, dup = nums[cursor], false
    cursor += 1
    while nums[cursor] == num
      cursor += 1
      dup = true
    end

    nums[size] = num; size += 1
    next unless dup

    nums[size] = num; size += 1
  end

  size
end
