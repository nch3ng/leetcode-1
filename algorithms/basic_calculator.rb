# https://leetcode.com/problems/basic-calculator/
#
# Implement a basic calculator to evaluate a simple expression string. The
# expression string may contain open ( and closing parentheses ), the plus
# + or minus sign -, non-negative integers and empty spaces. You may assume
# that the given expression is always valid.
#
# Some examples:
#
#     "1 + 1" = 2
#     " 2-1 + 2 " = 3
#     "(1+(4+5+2)-3)+(6+8)" = 23
#
# Note: Do not use the eval built-in library function.


# @param {String} s
# @return {Integer}
def calculate(s)
  s, s1, s2 = "(#{s})", [], []

  s.scan(/ \s | \( | \) | [+-] | \d+ /x) do |token|
    case token
    when ' '
      next
    when '('
      s1.push('(')
    when ')'
      case s1.pop
      when '('; next
      when '+'; s2.push(s2.pop + s2.pop); s1.pop
      when '-'; s2.push(- s2.pop + s2.pop); s1.pop
      end
    when '+', '-'
      case s1.pop
      when nil; s1.push(token)
      when '('; s1.push('('); s1.push(token)
      when '+'; s2.push(s2.pop + s2.pop); s1.push(token)
      when '-'; s2.push(- s2.pop + s2.pop); s1.push(token)
      end
    else
      s2.push(token.to_i)
    end
  end

  s2.pop
end
