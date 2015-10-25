# https://leetcode.com/problems/length-of-last-word/
#
# Given a string s consists of upper/lower-case alphabets and empty space
# characters ' ', return the length of last word in the string. If the last
# word does not exist, return 0.
#
# For example:
#
#     Given s = "Hello World", return 5.
#
# Note:
#
#     A word is defined as a character sequence consists of non-space
#     characters only.


# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  str = s.reverse.lstrip
  str.index(' ') || str.size
end
