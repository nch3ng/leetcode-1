# https://leetcode.com/problems/count-primes/
#
# Count the number of prime numbers less than a non-negative number, n.
#
# Credits:
#
#     Special thanks to @mithmatt for adding this problem and creating all
#     test cases.


# @param {Integer} n
# @return {Integer}
def count_primes(n)
  return 0 if n < 2

  marks = Array.new(n, 1)
  2.upto(Math.sqrt(n)) do |i|
    next unless marks[i] == 1

    j = i
    marks[j] = 0 while (j += i) < n
  end

  marks.reduce(&:+) - 2
end
