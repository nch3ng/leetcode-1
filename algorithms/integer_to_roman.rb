# https://leetcode.com/problems/integer-to-roman/
#
# Given an integer, convert it to a roman numeral. Input is guaranteed to be
# within the range from 1 to 3999.


# @param {Integer} num
# @return {String}
def int_to_roman(num)
  w0 = ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX']
  w1 = ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC']
  w2 = ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM']
  w3 = ['', 'M', 'MM', 'MMM']

  str = ''
  num, rem = num.divmod(1000); str << w3[num]
  num, rem = rem.divmod(100) ; str << w2[num]
  num, rem = rem.divmod(10)  ; str << w1[num]; str << w0[rem]
  str
end
