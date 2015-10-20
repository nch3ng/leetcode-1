# https://leetcode.com/problems/distinct-subsequences/
#
# Given a string S and a string T, count the number of distinct
# subsequences of T in S. A subsequence of a string is a new string
# which is formed from the original string by deleting some (can be none)
# of the characters without disturbing the relative positions of
# the remaining characters. (ie, "ACE" is a subsequence of "ABCDE"
# while "AEC" is not).
#
# Here is an example: S = "rabbbit", T = "rabbit", Return 3.


# @param {String} s
# @param {String} t
# @return {Integer}
def num_distinct(s, t)
  return 0 if s.size < t.size

  return _num_distinct_(
    s, 0, s.size - 1,
    t, 0, t.size - 1,
    Array.new(s.size, &Proc.new{ Array.new(t.size) })
  )
end

private def _num_distinct_(s, sl, su, t, tl, tu, nums)
  return 1 if tl > tu
  return 0 if sl > su
  return nums[sl][tl] if nums[sl][tl]

  sum  = _num_distinct_(s, sl + 1, su, t, tl, tu, nums)
  sum += _num_distinct_(s, sl + 1, su, t, tl + 1, tu, nums) if s[sl] == t[tl]

  nums[sl][tl] = sum
  return sum
end
