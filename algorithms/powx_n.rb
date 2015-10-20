# https://leetcode.com/problems/powx-n/
#
# Implement pow(x, n).


# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  return _pow_(x, n) if n > 0
  return 1 / _pow_(x, -n)
end

private def _pow_(base, exp)
  return 1 if exp == 0

  v = _pow_(base, exp / 2)
  if exp % 2 == 0
    v * v
  else
    v * v * base
  end
end
