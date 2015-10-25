# https://leetcode.com/problems/scramble-string/
#
# Given a string s1, we may represent it as a binary tree by partitioning it
# to two non-empty substrings recursively.
#
# Below is one possible representation of s1 = "great":
#
#         great
#        /     \
#       gr    eat
#      / \    /  \
#     g   r  e   at
#                / \
#               a   t
#
# To scramble the string, we may choose any non-leaf node and swap its two
# children. For example, if we choose the node "gr" and swap its two children,
# it produces a scrambled string "rgeat".
#
#         rgeat
#        /     \
#       rg     eat
#      / \     /  \
#     r   g   e   at
#                 / \
#                a   t
#
# We say that "rgeat" is a scrambled string of "great". Similarly, if we
# continue to swap the children of nodes "eat" and "at", it produces a
# scrambled string "rgtae".
#
#         rgtae
#        /     \
#       rg     tae
#      / \    /  \
#     r   g  ta  e
#           / \
#          t   a
#
# We say that "rgtae" is a scrambled string of "great". Given two strings s1
# and s2 of the same length, determine if s2 is a scrambled string of s1.


# @param {String} s1
# @param {String} s2
# @return {Boolean}
def is_scramble(s1, s2)
  s1.size == s2.size && _is_scramble_(s1.chars, 0, s1.size, s2.chars, 0, s2.size)
end

private def _is_scramble_(s1, l1, u1, s2, l2, u2)
  return true  if s1[l1...u1] == s2[l2...u2]
  return false if s1[l1...u1].sort != s2[l2...u2].sort

  1.upto(u1 - l1 - 1) do |offset|
    return true if _is_scramble_(s1, l1, l1 + offset, s2, l2, l2 + offset) &&
                   _is_scramble_(s1, l1 + offset, u1, s2, l2 + offset, u2)
    return true if _is_scramble_(s1, l1, l1 + offset, s2, u2 - offset, u2) &&
                   _is_scramble_(s1, l1 + offset, u1, s2, l2, u2 - offset)
  end
  return false
end
