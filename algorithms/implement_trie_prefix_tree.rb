# https://leetcode.com/problems/implement-trie-prefix-tree/
#
# Implement a trie with insert, search, and startsWith methods.
#
# Note: You may assume that all inputs are consist of lowercase letters a-z.


class TrieNode
  attr_accessor :fullword, :children

  # Initialize your data structure here.
  def initialize
    @fullword = false
    @children = {}
  end
end


class Trie
  def initialize
    @root = TrieNode.new
  end

  # @param {String} word
  # @return {Void}
  # Inserts a word into the trie.
  def insert(word)
    node = @root

    word.each_char do |char|
      node = (node.children[char] ||= TrieNode.new)
    end
    node.fullword = true; nil
  end

  # @param {String} word
  # @return {Boolean}
  # Returns if the word is in the trie.
  def search(word)
    node = @root

    word.each_char do |char|
      return false unless node.children.key?(char)
      node = node.children[char]
    end
    return node.fullword
  end

  # @param {String} prefix
  # @return {Boolean}
  # Returns if there is any word in the trie
  # that starts with the given prefix.
  def starts_with(prefix)
    node = @root

    prefix.each_char do |char|
      return false unless node.children.key?(char)
      node = node.children[char]
    end
    return true
  end
end


# Your Trie object will be instantiated and called as such:
# trie = Trie.new
# trie.insert("somestring")
# trie.search("key")
