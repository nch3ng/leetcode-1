# https://leetcode.com/problems/regular-expression-matching/
#
# Implement regular expression matching with support for '.' and '*'. '.'
# Matches any single character. '*' Matches zero or more of the preceding
# element. The matching should cover the entire input string (not partial).
#
# The function prototype should be:
#
#     bool isMatch(const char *s, const char *p)
#
# Some examples:
#
#     isMatch("aa" , "a")     -> false
#     isMatch("aa" , "aa")    -> true
#     isMatch("aaa", "aa")    -> false
#     isMatch("aa" , "a*")    -> true
#     isMatch("aa" , ".*")    -> true
#     isMatch("ab" , ".*")    -> true
#     isMatch("aab", "c*a*b") -> true


# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  _is_match_(s.chars, 0, _simplify_(p).chars, 0)
end

private def _simplify_(re)
  re.gsub(/(.\*)\1+/, '\1')
end

private def _is_match_(str, stridx, re, reidx)
  return stridx == str.size if reidx == re.size

  token, nexttoken = re[reidx, 2]
  if nexttoken == '*'
    str[stridx..-1].each_with_index do |char, idx|
      break unless token == '.' || token == char
      return true if _is_match_(str, stridx + idx + 1, re, reidx + 2)
    end
    return _is_match_(str, stridx, re, reidx + 2)
  end

  if token == '.' || token == str[stridx]
    return false if stridx == str.size
    return _is_match_(str, stridx + 1, re, reidx + 1)
  end

  return false
end
