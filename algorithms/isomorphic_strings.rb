# https://leetcode.com/problems/isomorphic-strings/
#
# Given two strings s and t, determine if they are isomorphic. Two strings are
# isomorphic if the characters in s can be replaced to get t. All occurrences
# of a character must be replaced with another character while preserving the
# order of characters. No two characters may map to the same character but a
# character may map to itself.
#
# For example:
#
#     Given "egg", "add", return true.
#     Given "foo", "bar", return false.
#     Given "paper", "title", return true.
#
# Note: You may assume both s and t have the same length.


# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  m1, m2 = {}, {}

  s.chars.each_with_index do |ch, idx|
    tc = t[idx]

    if m1.key?(ch) || m2.key?(tc)
      return false if m1[ch] != tc
      return false if m2[tc] != ch
    else
      m1[ch] = tc
      m2[tc] = ch
    end
  end
  return true
end
