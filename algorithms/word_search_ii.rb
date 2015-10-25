# https://leetcode.com/problems/word-search-ii/
#
# Given a 2D board and a list of words from the dictionary, find all words in
# the board.
#
# Each word must be constructed from letters of sequentially adjacent cell,
# where "adjacent" cells are those horizontally or vertically neighboring.
# The same letter cell may not be used more than once in a word.
#
# For example, Given words = ["oath","pea","eat","rain"] and board =
#
#     [
#       ['o','a','a','n'],
#       ['e','t','a','e'],
#       ['i','h','k','r'],
#       ['i','f','l','v']
#     ]
#
# Return ["eat","oath"].
#
# Note: You may assume that all inputs are consist of lowercase letters a-z.


class TrieNode
  attr_accessor :fullword, :children

  def initialize
    @fullword = false
    @children = {}
  end
end


class Trie
  attr_accessor :root

  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    node = @root
    word.each_char { |char| node = (node.children[char] ||= TrieNode.new) }
    node.fullword = word
  end
end


# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
def find_words(board, words)
  rows, columns = board.size, board[0].size
  marks = Array.new(rows) { Array.new(columns) }

  trie = Trie.new
  words.each { |word| trie.insert(word) }

  result = []
  0.upto(rows - 1) do |row|
    0.upto(columns - 1) do |column|
      _find_words_(board, row, column, trie.root, marks, result)
    end
  end
  result.uniq
end

private def _find_words_(board, row, column, node, marks, result)
  return if marks[row][column] == true

  char = board[row][column]
  node = node.children[char]
  return if node.nil?

  marks[row][column] = true
  result << node.fullword if node.fullword

  [-1, 1].each do |offset|
    new_row = row + offset
    if new_row.between?(0, board.size - 1)
      _find_words_(board, new_row, column, node, marks, result)
    end

    new_column = column + offset
    if new_column.between?(0, board[0].size - 1)
      _find_words_(board, row, new_column, node, marks, result)
    end
  end

  marks[row][column] = false
end
