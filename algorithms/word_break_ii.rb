# https://leetcode.com/problems/word-break-ii/
#
# Given a string s and a dictionary of words dict, add spaces in s to
# construct a sentence where each word is a valid dictionary word. Return all
# such possible sentences.
#
# For example:
#
#     Given s = "catsanddog", dict = ["cat", "cats", "and", "sand", "dog"].
#     A solution is ["cats and dog", "cat sand dog"].


# @param {String} s
# @param {Set<String>} word_dict
# @return {String[]}
def word_break(s, word_dict)
  [].tap do |result|
    _word_break_(s, 0, s.size - 1, word_dict, Array.new(s.size), [0], result)
  end
end

private def _word_break_(s, lbound, ubound, word_dict, marks, tracing, result)
  if lbound > ubound
    result << tracing.each_cons(2).map(&->(l, u){ s[l...u] }).join(' ')
    return true
  end

  ok = false
  lbound.upto(ubound).each do |spt|
    next if  marks[spt]
    next if !word_dict.include?(s[lbound..spt])

    tracing.push(spt + 1)
    if _word_break_(s, spt + 1, ubound, word_dict, marks, tracing, result)
      ok = true
    end
    tracing.pop
  end

   marks[lbound - 1] = true unless ok
   return ok
end
