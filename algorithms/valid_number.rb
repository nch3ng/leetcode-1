# https://leetcode.com/problems/valid-number/
#
# Validate if a given string is numeric.
#
# Some examples:
#
#     "0"     => true
#     " 0.1 " => true
#     "abc"   => false
#     "1 a"   => false
#     "2e10"  => true


# @param {String} s
# @return {Boolean}
def is_number(s)
  s =~ /\A\s*
    (?:[+-]?)             (?# 1: sign)
    (?:\d+\.?|\d*\.\d+)   (?# 2: significand)
    (?:[eE][+-]?\d+)?     (?# 3: exponent)
  \s*\z/x ? true : false
end
