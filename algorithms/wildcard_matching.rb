# https://leetcode.com/problems/wildcard-matching/
#
# Implement wildcard pattern matching with support for '?' and '*'. '?'
# Matches any single character. '*' Matches any sequence of characters
# (including the empty sequence). The matching should cover the entire
# input string (not partial).
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
#     isMatch("aa" , "*")     -> true
#     isMatch("aa" , "a*")    -> true
#     isMatch("ab" , "?*")    -> true
#     isMatch("aab", "c*a*b") -> false


# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  s, p = s.chars, p.gsub(/(\*)\1+/, '\1').chars

  _is_match_(
    s, 0, s.size - 1, p, 0, p.size - 1,
    Array.new(s.size, &Proc.new{ Array.new(p.size) }),
    s.size - p.size + p.count('*') + 1
  )
end

private def _is_match_(s, sl, su, p, pl, pu, marks, anychars_limit)
  return p[pl..pu].all? { |r| r == '*' } if sl > su
  return p[pu] == '*' if pl > pu
  return false if marks[sl][pl]

  case p[pl]
  when '*'
    offset = su - sl + 1
    offset = anychars_limit if offset > anychars_limit
    offset.times do |o|
      return true if _is_match_(
        s, sl + o, su, p, pl + 1, pu, marks, anychars_limit - o
      )
    end
  when '?', s[sl]
    return true if _is_match_(
      s, sl + 1, su, p, pl + 1, pu, marks, anychars_limit
    )
  end

  marks[sl][pl] = true
  return false
end
