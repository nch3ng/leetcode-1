# https://leetcode.com/problems/longest-palindromic-substring/
#
# Given a string S, find the longest palindromic substring in S. You may
# assume that the maximum length of S is 1000, and there exists one unique
# longest palindromic substring.


# @param {String} s
# @return {String}
def longest_palindrome(s)
  middle, offset, maxstr = (0 + s.size) / 2, 0, ''

  while true
    return maxstr if (middle - offset) < 0 && (middle + offset) >= s.size
    return maxstr if (middle - offset + 1) * 2 < maxstr.size

    [-1, 1].each do |sign|
      idx = middle + sign * offset
      str = _longest_palindrome_(s, idx, idx)
      maxstr = str if maxstr.size < str.size

      if s[idx] == s[idx + 1]
        str = _longest_palindrome_(s, idx, idx + 1)
        maxstr = str if maxstr.size < str.size
      end
    end

    offset += 1
  end
end

private def _longest_palindrome_(s, lbound, ubound)
  while lbound >= 0 && ubound < s.size && s[lbound] == s[ubound]
    lbound -= 1; ubound += 1
  end
  s[(lbound + 1)..(ubound - 1)] || ''
end
