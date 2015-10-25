# https://leetcode.com/problems/fraction-to-recurring-decimal/
#
# Given two integers representing the numerator and denominator of a fraction,
# return the fraction in string format. If the fractional part is repeating,
# enclose the repeating part in parentheses.
#
# For example:
#
#     Given numerator = 1, denominator = 2, return "0.5".
#     Given numerator = 2, denominator = 1, return "2".
#     Given numerator = 2, denominator = 3, return "0.(6)".
#
# Credits:
#
#     Special thanks to @Shangrila for adding this problem and creating all
#     test cases.


# @param {integer} numerator
# @param {integer} denominator
# @return {string}
def fraction_to_decimal(numerator, denominator)
  sign = numerator * denominator >= 0 ? '' : '-'
  numerator, denominator = numerator.abs, denominator.abs

  quo, rem = numerator.divmod(denominator)
  return sprintf("%s%d", sign, quo) if rem.zero?

  out = sprintf("%s%d.", sign, quo)
  m, reaching = {}, out.size
  while rem.nonzero?
    return out.insert(m[rem], '(') + ')' if m.key?(rem)
    m[rem] = reaching

    rem *= 10; reaching += 1
    quo, rem = rem.divmod(denominator)
    out << quo.to_s
  end

  out
end
