# https://leetcode.com/problems/implement-strstr/
#
# Implement strStr(). Returns the index of the first occurrence of needle in
# haystack, or -1 if needle is not part of haystack.


# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  haystack.index(needle) || -1
end
