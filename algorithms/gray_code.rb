# https://leetcode.com/problems/gray-code/
#
# The gray code is a binary numeral system where two successive values differ
# in only one bit. Given a non-negative integer n representing the total
# number of bits in the code, print the sequence of gray code. A gray code
# sequence must begin with 0.
#
# For example, given n = 2, return [0, 1, 3, 2]. Its gray code sequence is:
#
#     00 - 0
#     01 - 1
#     11 - 3
#     10 - 2
#
# Note:
#
#     + For a given n, a gray code sequence is not uniquely defined.
#     + For example, [0, 2, 3, 1] is also a valid gray code sequence according
#       to the above definition.
#     + For now, the judge is able to judge based on one instance of gray code
#       sequence. Sorry about that.


# @param {Integer} n
# @return {Integer[]}
def gray_code(n)
  return [0] if n.zero?

  n, s = n - 1, ['0', '1']
  n.times do
    s1 = s.map { |e| '0' + e }
    s2 = s.reverse.map { |e| '1' + e }
    s  = s1 + s2
  end
  s.map { |e| e.to_i(2) }
end
