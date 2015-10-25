# https://leetcode.com/problems/lru-cache/
#
# Design and implement a data structure for Least Recently Used (LRU) cache.
# It should support the following operations: get and set.
#
#     + get(key) - Get the value (will always be positive) of the key if the
#       key exists in the cache, otherwise return -1.
#     + set(key, value) - Set or insert the value if the key is not already
#       present. When the cache reached its capacity, it should invalidate the
#       least recently used item before inserting a new item.


class DoublyLinkedListNode
  attr_accessor :key, :value, :prev, :next

  def initialize(key=nil, value=nil)
    @key, @value = key, value
  end
end


class DoublyLinkedList
  def initialize
    @dummy = DoublyLinkedListNode.new
    @dummy.prev = @dummy
    @dummy.next = @dummy
  end

  def push_front(key, value)
    n = DoublyLinkedListNode.new(key, value)
    n.prev = @dummy
    n.next = @dummy.next
    @dummy.next.prev = n
    @dummy.next = n
    n
  end

  def pop_back
    delete(@dummy.prev)
  end

  def delete(node)
    node.tap { |n| n.prev.next, n.next.prev = n.next, n.prev }
  end
end


class LRUCache
  # Initialize your data structure here
  # @param {Integer} capacity
  def initialize(capacity)
    @capacity = capacity
    @map, @list = {}, DoublyLinkedList.new
  end

  # @param {Integer} key
  # @return {Integer}
  def get(key)
    return -1 unless @map.key?(key)

    n = @list.delete(@map.delete(key))
    @map[key] = @list.push_front(n.key, n.value)
    n.value
  end

  # @param {Integer} key
  # @param {Integer} value
  # @return {Void}
  def set(key, value)
    if @map.key?(key)
      @list.delete(@map.delete(key))
    elsif @map.size == @capacity
      @map.delete(@list.pop_back.key)
    end

    @map[key] = @list.push_front(key, value)
    nil
  end
end
