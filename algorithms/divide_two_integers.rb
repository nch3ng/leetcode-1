# https://leetcode.com/problems/divide-two-integers/
#
# Divide two integers without using multiplication, division and mod operator.
# If it is overflow, return MAX_INT.


# Limits on Integer Constants
INT_BIT = 32
INT_MAX =  2 ** (INT_BIT - 1) - 1
INT_MIN = -2 ** (INT_BIT - 1)


# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
  positive = true if dividend > 0 && divisor > 0
  positive = true if dividend < 0 && divisor < 0
  dividend, divisor = dividend.abs, divisor.abs

  nums = Array.new(INT_BIT, divisor)
  1.upto(INT_BIT - 1) { |i| nums[i] = nums[i - 1] << 1 }

  quotient = 0
  nums.to_enum.with_index.reverse_each do |n, i|
    case dividend <=> n
    when  1; quotient += 2 ** i; dividend -= n
    when  0; quotient += 2 ** i; break
    when -1; nil
    end
  end

  positive ? [quotient, INT_MAX].min : [-quotient, INT_MIN].max
end
