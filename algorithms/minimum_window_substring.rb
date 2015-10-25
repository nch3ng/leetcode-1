# https://leetcode.com/problems/minimum-window-substring/
#
# Given a string S and a string T, find the minimum window in S which will
# contain all the characters in T in complexity O(n).
#
# For example:
#
#     S = "ADOBECODEBANC"
#     T = "ABC"
#     Minimum window is "BANC".
#
# Notes:
#
#     + If there is no such window in S that covers all characters in T,
#       return the empty string "".
#     + If there are multiple such windows, you are guaranteed that there
#       will always be only one unique minimum window in S.


# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  return '' if s.size < t.size
  return '' if t.size.zero?

  s, t = s.chars, t.chars
  m = t.each_with_object({}) { |c, memo| memo[c] ||= 0; memo[c] += 1 }

  lbound = 0
  require_num = t.size
  minlen, minstr = s.size + 1, []
  s.each_with_index do |c, ubound|
    next unless m.key?(c)

    m[c] -= 1
    require_num -= 1 if m[c] >= 0

    if require_num.zero?
      while true
        cc = s[lbound]
        if m.key?(cc)
          m[cc] += 1
          require_num += 1 if m[cc] > 0
          break if require_num.nonzero?
        end
        lbound += 1
      end

      strlen = ubound - lbound + 1
      minlen, minstr = strlen, s.slice(lbound, strlen) if minlen > strlen
      lbound += 1
    end
  end
  minstr.join
end
