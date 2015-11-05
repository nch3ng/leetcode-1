# https://leetcode.com/problems/remove-invalid-parentheses/
#
# Remove the minimum number of invalid parentheses in order to make the input
# string valid. Return all possible results.
#
# Note:
#
#     The input string may contain letters other than the parentheses ( and ).
#
# Examples:
#
#     "()())()"   ->  ["()()()", "(())()"]
#     "(a)())()"  ->  ["(a)()()", "(a())()"]
#     ")("        ->  [""]
#
# Credits:
#
#     Special thanks to @hpplayer for adding this problem and creating all
#     test cases.


# @param {String} s
# @return {String[]}
def remove_invalid_parentheses(s)
  return [''] if s.empty?

  q, idx = [['', 0], nil], 0
  while true
    e = q.shift

    if e.nil?
      break if (idx += 1) == s.size
      q = q.uniq << nil; next
    end

    substr, lparen = e
    case s[idx]
    when '('; q << e; q << [substr + '(', lparen + 1]
    when ')'; q << e; q << [substr + ')', lparen - 1] if lparen > 0
    else    ; q << [substr + s[idx], lparen]
    end
  end

  out, maxlen = [], 0
  q.each do |qe|
    next if qe[1].nonzero?

    case qe[0].size <=> maxlen
    when -1; next
    when  0; out << qe[0]
    when  1; out.clear; out << qe[0]; maxlen = qe[0].size
    end
  end
  out.uniq
end
