# https://leetcode.com/problems/word-break/
#
# Given a string s and a dictionary of words dict, determine if s can be
# segmented into a space-separated sequence of one or more dictionary words.
#
# For example:
#
#     Given s = "leetcode", dict = ["leet", "code"].
#     Return true because "leetcode" can be segmented as "leet code".


# @param {String} s
# @param {Set<String>} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  _word_break_(s, 0, s.size - 1, word_dict, Array.new(s.size))
end

private def _word_break_(s, lbound, ubound, word_dict, marks)
  return true if lbound > ubound

  lbound.upto(ubound).each do |spt|
    next if  marks[spt]
    next if !word_dict.include?(s[lbound..spt])

    marks[spt] = true
    return true if _word_break_(s, spt + 1, ubound, word_dict, marks)
  end

  return false
end
