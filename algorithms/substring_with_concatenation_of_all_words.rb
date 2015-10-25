# https://leetcode.com/problems/substring-with-concatenation-of-all-words/
#
# You are given a string, s, and a list of words, words, that are all of the
# same length. Find all starting indices of substring(s) in s that is a
# concatenation of each word in words exactly once and without any intervening
# characters.
#
# For example, given:
#
#     s: "barfoothefoobarman"
#     words: ["foo", "bar"]
#
# You should return the indices: [0,9]. (order does not matter).


# @param {string} s
# @param {string[]} words
# @return {integer[]}
def find_substring(s, words)
  wmap = words.each_with_object({}) { |w, memo| memo[w] ||= 0; memo[w] += 1 }
  wsize, wcount = words[0].size, words.size

  m, result = {}, []
  lbound, ubound = 0, s.size - wsize * wcount
  while lbound <= ubound
    wcount.times do |count|
      substr = s.slice(lbound + wsize * count, wsize)
      break if wmap[substr].nil?

      m[substr] ||= 0
      m[substr]  += 1
      break if wmap[substr] < m[substr]
    end

    result << lbound if wmap == m
    lbound += 1; m.clear
  end

  result
end
