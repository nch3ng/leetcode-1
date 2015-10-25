# https://leetcode.com/problems/anagrams/
#
# Given an array of strings, group anagrams together.
#
# For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"], Return:
#
#     [
#       ["ate", "eat", "tea"],
#       ["nat", "tan"],
#       ["bat"]
#     ]
#
# Notes:
#
#     + For the return value, each inner list's elements must follow the
#       lexicographic order.
#     + All inputs will be in lower-case.


# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  strs.group_by(&->(s){ s.chars.sort.join }).values.map(&:sort)
end
