# https://leetcode.com/problems/palindrome-partitioning-ii/
#
# Given a string s, partition s such that every substring of the partition is
# a palindrome. Return the minimum cuts needed for a palindrome partitioning
# of s.
#
# For example, given s = "aab", Return 1 since the palindrome partitioning
# ["aa","b"] could be produced using 1 cut.


# @param {String} s
# @return {Integer}
def min_cut(s)
  return 0 if _is_palindrome_(s, 0, s.size - 1)

  min, q, marks = 1, [0, nil], Array.new(s.size)
  while true
    lbound = q.shift

    if lbound.nil?
      min += 1
      q << nil; next
    end

    Range.new(lbound, s.size - 2).each do |spt|
      next unless _is_palindrome_(s, lbound, spt)

      nextlbound = spt + 1
      return min if _is_palindrome_(s, nextlbound, s.size - 1)

      q << nextlbound unless marks[nextlbound]
      marks[nextlbound] = true
    end
  end
end

private def _is_palindrome_(s, lbound, ubound)
  while lbound < ubound && s[lbound] == s[ubound]
    lbound += 1; ubound -= 1
  end
  s[lbound] == s[ubound]
end
