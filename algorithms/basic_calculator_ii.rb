# https://leetcode.com/problems/basic-calculator-ii/
#
# Implement a basic calculator to evaluate a simple expression string. The
# expression string contains only non-negative integers, +, -, *, / operators
# and empty spaces. The integer division should truncate toward zero. You may
# assume that the given expression is always valid.
#
# Some examples:
#
#     "3+2*2" = 7
#     " 3/2 " = 1
#     " 3+5 / 2 " = 5
#
# Note:
#
#     Do not use the eval built-in library function.
#
# Credits:
#
#     Special thanks to @ts for adding this problem and creating all test
#     cases.


# @param {String} s
# @return {Integer}
def calculate(s)
  s, s1, s2 = "#{s}+0", [], []

  s.scan(/ \s | [+-] | [\*\/] | \d+ /x) do |token|
    case token
    when ' '
      next
    when '+', '-'
      while true
        case s1.pop
        when nil; break
        when '+'; s2.push(s2.pop + s2.pop)
        when '-'; v1, v2 = s2.pop, s2.pop; s2.push(v2 - v1)
        when '*'; s2.push(s2.pop * s2.pop)
        when '/'; v1, v2 = s2.pop, s2.pop; s2.push(v2.fdiv(v1).truncate)
        end
      end
      s1.push(token)
    when '*', '/'
      case s1.pop
      when '+'; s1.push('+')
      when '-'; s1.push('-')
      when '*'; s2.push(s2.pop * s2.pop)
      when '/'; v1, v2 = s2.pop, s2.pop; s2.push(v2.fdiv(v1).truncate)
      end
      s1.push(token)
    else
      s2.push(token.to_i)
    end
  end

  s2.pop
  s2.pop
end
