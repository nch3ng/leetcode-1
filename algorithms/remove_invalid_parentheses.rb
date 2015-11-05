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
  q = [['', 0]]
  s.each_char do |ch|
    q.uniq!; q << nil

    while (e = q.shift)
      substr, lparen = e
      case ch
      when '('; q << e; q << [substr + '(', lparen + 1]
      when ')'; q << e; q << [substr + ')', lparen - 1] if lparen > 0
      else    ; q << [substr + ch, lparen]
      end
    end
  end

  out, maxlen = [], 0
  q.each do |e|
    next if e[1].nonzero?

    case e[0].size <=> maxlen
    when -1; next
    when  0; out << e[0]
    when  1; out.clear; out << e[0]; maxlen = e[0].size
    end
  end
  out.uniq
end
