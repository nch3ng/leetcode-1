# https://leetcode.com/problems/generate-parentheses/
#
# Given n pairs of parentheses, write a function to generate all combinations
# of well-formed parentheses.
#
# For example, given n = 3, a solution set is:
#
#     "((()))", "(()())", "(())()", "()(())", "()()()"


# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  [].tap do |result|
    _generate_parenthesis_(n, 0, 0, '', result)
  end
end

private def _generate_parenthesis_(pairs, lparen, rparen, tracing, result)
  if lparen + rparen == 2 * pairs
    result << tracing; return
  end

  if lparen < pairs
    _generate_parenthesis_(pairs, lparen + 1, rparen, tracing + '(', result)
  end

  if rparen < pairs && rparen < lparen
    _generate_parenthesis_(pairs, lparen, rparen + 1, tracing + ')', result)
  end
end
