# https://leetcode.com/problems/longest-valid-parentheses/
#
# Given a string containing just the characters '(' and ')', find the length
# of the longest valid (well-formed) parentheses substring.
#
# For "(()", the longest valid parentheses substring is "()", which has
# length = 2. Another example is ")()())", where the longest valid parentheses
# substring is "()()", which has length = 4.


# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  maxlen, stack = 0, []

  bound = s.index('(') || s.size
  stack.push(bound - 1)

  bound.upto(s.size - 1) do |idx|
    if s[idx] == '('
      stack.push(idx); next
    end

    stack.pop
    if stack.empty?
      stack.push(idx)
    else
      maxlen = [maxlen, idx - stack[-1]].max
    end
  end

  maxlen
end
