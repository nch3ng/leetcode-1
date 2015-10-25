# https://leetcode.com/problems/power-of-two/
#
# Given an integer, write a function to determine if it is a power of two.
#
# Credits:
#
#     Special thanks to @jianchao.li.fighter for adding this problem and
#     creating all test cases.


# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
  return false if n <= 0

  while n > 1
    return false if n % 2 != 0
    n = n / 2
  end
  return true
end
