# https://leetcode.com/problems/additive-number/
#
# Additive number is a positive integer whose digits can form additive
# sequence. A valid additive sequence should contain at least three numbers.
# Except for the first two numbers, each subsequent number in the sequence
# must be the sum of the preceding two. Given a string represents an integer,
# write a function to determine if it's an additive number.
#
# For example:
#
#     "112358" is an additive number because the digits can form an additive
#     sequence:
#
#         1, 1, 2, 3, 5, 8 => 1 + 1 = 2, 1 + 2 = 3, 2 + 3 = 5, 3 + 5 = 8
#
#     "199100199" is also an additive number, the additive sequence is:
#
#         1, 99, 100, 199 => 1 + 99 = 100, 99 + 100 = 199
#
# Note:
#
#     Numbers in the additive sequence cannot have leading zeros, so sequence
#     1, 2, 03 or 1, 02, 3 is invalid.
#
# Follow up:
#
#     How would you handle overflow for very large input integers?
#
# Credits:
#
#     Special thanks to @jeantimex for adding this problem and creating all
#     test cases.


# @param {String} num
# @return {Boolean}
def is_additive_number(num)
  Range.new(1, num.size - 2).each do |p2|
    Range.new(p2 + 1, num.size - 1).each do |p3|
      return true if _is_additive_number_(num, 0, p2, p3)
    end
  end
  return false
end

private def _is_additive_number_(num, p1, p2, p3)
  return false if num[p1] == '0' && p2 - p1 > 1
  return false if num[p2] == '0' && p3 - p2 > 1

  _v1, v2, v3 = 0, num[p1...p2].to_i, num[p2...p3].to_i
  while true
    _v1, v2, v3 = v2, v3, v2 + v3
    s3 = v3.to_s
    return false if num.slice(p3, s3.size) != s3
    return true if (p3 += s3.size) == num.size
  end
end
