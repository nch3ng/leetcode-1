# https://leetcode.com/problems/word-ladder/
#
# Given two words (beginWord and endWord), and a dictionary's word list, find
# the length of shortest transformation sequence from beginWord to endWord,
# such that:
#
#     + Only one letter can be changed at a time
#     + Each intermediate word must exist in the word list
#
# For example, Given:
#
#     beginWord = "hit"
#     endWord = "cog"
#     wordList = ["hot","dot","dog","lot","log"]
#
# As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
# return its length 5.
#
# Note:
#
#     + Return 0 if there is no such transformation sequence.
#     + All words have the same length.
#     + All words contain only lowercase alphabetic characters.


# @param {String} begin_word
# @param {String} end_word
# @param {Set<String>} word_list
# @return {Integer}
def ladder_length(begin_word, end_word, word_list)
  _ladder_length_(
    Hash(begin_word => true),
    Hash(end_word => true),
    Marshal.load(Marshal.dump(word_list)), 1
  )
end

private def _ladder_length_(ws1, ws2, words, steps)
  return _ladder_length_(ws2, ws1, words, steps) if ws1.size > ws2.size
  return 0 if ws1.size == 0

  nextws1 = {}
  ws1.keys.map(&:dup).each do |w|
    w.chars.each_with_index do |ch, idx|
      Range.new('a', 'z').each do |newch|
        w[idx] = newch
        return steps + 1 if ws2.key?(w)
        nextws1[w] = true if words.delete?(w)
      end

      w[idx] = ch
    end
  end

  _ladder_length_(nextws1, ws2, words, steps + 1)
end
