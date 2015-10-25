# https://leetcode.com/problems/multiply-strings/
#
# Given two numbers represented as strings, return multiplication of the
# numbers as a string.
#
# Note: The numbers can be arbitrarily large and are non-negative.


# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
  (num1.to_i * num2.to_i).to_s
end
