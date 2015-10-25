# https://leetcode.com/problems/evaluate-reverse-polish-notation/
#
# Evaluate the value of an arithmetic expression in Reverse Polish Notation.
# Valid operators are +, -, *, /. Each operand may be an integer or another
# expression.
#
# Some examples:
#
#     ["2", "1", "+", "3", "*"]  -> ((2 + 1) * 3)  -> 9
#     ["4", "13", "5", "/", "+"] -> (4 + (13 / 5)) -> 6


# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  s = []

  tokens.each do |token|
    case token
    when '+'; s.push(s.pop + s.pop)
    when '-'; v1, v2 = s.pop, s.pop; s.push(v2 - v1)
    when '*'; s.push(s.pop * s.pop)
    when '/'; v1, v2 = s.pop, s.pop; s.push(v2.fdiv(v1).truncate)
    else    ; s.push(token.to_i)
    end
  end

  s.pop
end
