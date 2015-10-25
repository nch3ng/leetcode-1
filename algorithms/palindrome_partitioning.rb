# https://leetcode.com/problems/palindrome-partitioning/
#
# Given a string s, partition s such that every substring of the partition is
# a palindrome. Return all possible palindrome partitioning of s.
#
# For example, given s = "aab", Return
#
#     [
#       ["aa","b"],
#       ["a","a","b"]
#     ]


# @param {String} s
# @return {String[][]}
def partition(s)
  [].tap { |result| _partition_(s, 0, [], result) }
end

private def _partition_(s, spt, tracing, result)
  if spt == s.size
    result << tracing; return
  end

  spt.upto(s.size - 1) do |ubound|
    l, u = spt, ubound
    while l < u && s[l] == s[u]
      l += 1; u -= 1
    end
    next if s[l] != s[u]

    _partition_(s, ubound + 1, tracing.dup << s[spt..ubound], result)
  end
end
