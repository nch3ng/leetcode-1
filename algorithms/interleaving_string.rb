# https://leetcode.com/problems/interleaving-string/
#
# Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.
#
# For example:
#
#     Given: s1 = "aabcc", s2 = "dbbca",
#     When s3 = "aadbbcbcac", return true.
#     When s3 = "aadbbbaccc", return false.


# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
  return false if s1.size + s2.size != s3.size

  return _is_interleave_(
    s1, 0, s1.size - 1,
    s2, 0, s2.size - 1,
    s3, 0, s3.size - 1,
    Array.new(s1.size, &Proc.new{ Array.new(s2.size) })
  )
end

private def _is_interleave_(s1, l1, u1, s2, l2, u2, s3, l3, u3, marks)
  return s3[l3..u3] == s2[l2..u2] if l1 > u1
  return s3[l3..u3] == s1[l1..u1] if l2 > u2
  return false if marks[l1][l2]

  if s3[l3] == s1[l1]
    return true if _is_interleave_(
      s1, l1 + 1, u1, s2, l2, u2, s3, l3 + 1, u3, marks
    )
  end

  if s3[l3] == s2[l2]
    return true if _is_interleave_(
      s1, l1, u1, s2, l2 + 1, u2, s3, l3 + 1, u3, marks
    )
  end

  marks[l1][l2] = true
  return false
end
