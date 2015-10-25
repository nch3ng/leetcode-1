# https://leetcode.com/problems/valid-anagram/
#
# Given two strings s and t, write a function to determine if t is an anagram
# of s.
#
# For example:
#
#     s = "anagram", t = "nagaram", return true.
#     s = "rat", t = "car", return false.
#
# Note:
#
#     You may assume the string contains only lowercase alphabets.
#
# Follow up:
#
#     What if the inputs contain unicode characters? How would you adapt
#     your solution to such case?


# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false if s.size != t.size

  m = Range.new('a', 'z').each_with_object({}) { |ch, memo| memo[ch] = 0 }
  s.each_char { |ch| m[ch] += 1 }
  t.each_char { |ch| m[ch] -= 1 }
  m.values.all?(&:zero?)
end
