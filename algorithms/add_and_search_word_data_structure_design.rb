# https://leetcode.com/problems/add-and-search-word-data-structure-design/
#
# Design a data structure that supports the following two operations:
#
#     void addWord(word)
#     bool search(word)
#
# search(word) can search a literal word or a regular expression string
# containing only letters a-z or .. A . means it can represent any one letter.
#
# For example:
#
#     addWord("bad")
#     addWord("dad")
#     addWord("mad")
#     search("pad") -> false
#     search("bad") -> true
#     search(".ad") -> true
#     search("b..") -> true
#
# Note:
#
#     You may assume that all words are consist of lowercase letters a-z.


class TrieNode
  attr_accessor :fullword, :children

  def initialize
    @fullword = false
    @children = {}
  end
end


class Trie
  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    node = @root
    word.each_char { |char| node = (node.children[char] ||= TrieNode.new) }
    node.fullword = true; nil
  end

  def search(word)
    _search_(@root, word.chars, 0)
  end

  private def _search_(node, chars, idx)
    chars[idx..-1].each do |char|
      if char == '.'
        node.children.values.each do |cnode|
          return true if _search_(cnode, chars, idx + 1)
        end
        return false
      end

      return false unless node.children.key?(char)
      node = node.children[char]
      idx += 1
    end
    return node.fullword
  end
end


class WordDictionary
  def initialize
    @tree = Trie.new
  end

  # @param {String} word
  # @return {Void}
  # Adds a word into the data structure.
  def add_word(word)
    @tree.insert(word)
  end

  # @param {String} word
  # @return {Boolean}
  # Returns if the word is in the data structure. A word could
  # contain the dot character '.' to represent any one letter.
  def search(word)
    @tree.search(word)
  end
end
