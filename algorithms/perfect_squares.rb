# https://leetcode.com/problems/perfect-squares/
#
# Given a positive integer n, find the least number of perfect square numbers
# (for example, 1, 4, 9, 16, ...) which sum to n.
#
# For example:
#
#     given n = 12, return 3 because 12 = 4 + 4 + 4;
#     given n = 13, return 2 because 13 = 4 + 9.
#
# Credits:
#
#     Special thanks to @jianchao.li.fighter for adding this problem and
#     creating all test cases.


# @param {Integer} n
# @return {Integer}
def num_squares(n)
  s = Math.sqrt(n).truncate
  return 1 if n == s * s

  v = Array(1..s).map { |num| num * num }
  q, l = [n], 1

  while true
    newq = []

    q.each do |n1|
      v.each do |n2|
        case n1 <=> n2
        when  1; newq << n1 - n2
        when  0; return l
        when -1; break
        end
      end
    end

    q, l = newq.uniq, l + 1
  end
end
