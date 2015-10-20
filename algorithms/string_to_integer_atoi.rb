# https://leetcode.com/problems/string-to-integer-atoi/
#
# Implement atoi to convert a string to an integer.


# Limits on Integer Constants
INT_BIT = 32
INT_MAX =  2 ** (INT_BIT - 1) - 1
INT_MIN = -2 ** (INT_BIT - 1)


# @param {String} str
# @return {Integer}
def my_atoi(str)
  idx  = 0
  idx += 1 while str[idx] == ' '

  case str[idx]
  when '-'; idx, positive = idx + 1, false
  when '+'; idx, positive = idx + 1, true
  else    ; positive = true
  end

  sum = 0
  str[idx..-1].each_char do |char|
    case char
    when '0'; sum = sum * 10 + 0
    when '1'; sum = sum * 10 + 1
    when '2'; sum = sum * 10 + 2
    when '3'; sum = sum * 10 + 3
    when '4'; sum = sum * 10 + 4
    when '5'; sum = sum * 10 + 5
    when '6'; sum = sum * 10 + 6
    when '7'; sum = sum * 10 + 7
    when '8'; sum = sum * 10 + 8
    when '9'; sum = sum * 10 + 9
    else    ; break
    end
  end

  positive ? [sum, INT_MAX].min : [-sum, INT_MIN].max
end
