# https://leetcode.com/problems/sqrtx/
#
# Implement int sqrt(int x). Compute and return the square root of x.


# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  return 0 if x.zero?

  xn = 1.0
  while (xn * xn - x).abs > 0.1
    xn = (xn + x / xn) / 2
  end
  xn.truncate
end
