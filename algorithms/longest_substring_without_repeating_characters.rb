# https://leetcode.com/problems/longest-substring-without-repeating-characters/
#
# Given a string, find the length of the longest substring without repeating
# characters. For example, the longest substring without repeating letters for
# "abcabcbb" is "abc", which the length is 3. For "bbbbb" the longest
# substring is "b", with the length of 1.


# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  substr, maxlen = '', 0

  s.each_char do |ch|
    if substr.include?(ch)
      maxlen = substr.length if maxlen < substr.length
      substr = substr[(substr.index(ch) + 1)..-1]
    end
    substr << ch
  end
  maxlen = substr.length if maxlen < substr.length

  maxlen
end
