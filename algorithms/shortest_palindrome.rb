# https://leetcode.com/problems/shortest-palindrome/
#
# Given a string S, you are allowed to convert it to a palindrome by adding
# characters in front of it. Find and return the shortest palindrome you can
# find by performing this transformation.
#
# For example:
#
#     Given "aacecaaa", return "aaacecaaa".
#     Given "abcd", return "dcbabcd".
#
# Credits:
#
#     Special thanks to @ifanchu for adding this problem and creating all test
#     cases. Thanks to @Freezen for additional test cases.


# @param {String} s
# @return {String}
def shortest_palindrome(s)
  newstr = s + '#' + s.reverse
  ptable = Array.new(newstr.size, 0)

  pidx = 0
  1.upto(newstr.size - 1) do |sidx|
    pidx = ptable[pidx - 1] while pidx > 0 && newstr[pidx] != newstr[sidx]
    pidx += 1 if newstr[pidx] == newstr[sidx]
    ptable[sidx] = pidx
  end

  s[ptable[-1]..-1].reverse + s
end
