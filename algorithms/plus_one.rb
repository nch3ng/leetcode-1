# https://leetcode.com/problems/plus-one/
#
# Given a non-negative number represented as an array of digits, plus one to
# the number. The digits are stored such that the most significant digit is
# at the head of the list.


# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  sum, carry = [], 1

  digits.reverse_each do |digit|
    if carry.nonzero?
      value = digit + carry
      carry, value = value.divmod(10)
    else
      value = digit
    end

    sum.insert(0, value)
  end
  sum.insert(0, carry) if carry.nonzero?

  sum
end
