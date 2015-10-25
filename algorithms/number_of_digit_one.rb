# https://leetcode.com/problems/number-of-digit-one/
#
# Given an integer n, count the total number of digit 1 appearing in all
# non-negative integers less than or equal to n.
#
# For example:
#
#     Given n = 13, Return 6, because digit 1 occurred in the following
#     numbers: 1, 10, 11, 12, 13.


# @param {Integer} n
# @return {Integer}
def count_digit_one(n)
  count, spt = 0, 1

  while n >= spt
    quo, rem = n.divmod(spt)

    case quo % 10
    when 0; count += quo * (spt / 10)
    when 1; count += quo * (spt / 10) + 1 + rem
    else  ; count += quo * (spt / 10) + spt
    end

    spt *= 10
  end

  count
end
