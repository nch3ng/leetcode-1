# https://leetcode.com/problems/ugly-number/
#
# Write a program to check whether a given number is an ugly number. Ugly
# numbers are positive numbers whose prime factors only include 2, 3, 5. For
# example, 6, 8 are ugly while 14 is not ugly since it includes another prime
# factor 7.
#
# Credits:
#
#     Special thanks to @jianchao.li.fighter for adding this problem and
#     creating all test cases.


# @param {Integer} num
# @return {Boolean}
def is_ugly(num)
  return false if num <= 0

  num = num / 5 while num % 5 == 0
  num = num / 3 while num % 3 == 0
  num = num / 2 while num % 2 == 0
  num == 1
end
