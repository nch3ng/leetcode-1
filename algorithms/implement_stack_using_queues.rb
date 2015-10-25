# https://leetcode.com/problems/implement-stack-using-queues/
#
# Implement the following operations of a stack using queues.
#
#     + push(x) -- Push element x onto stack.
#     + pop() -- Removes the element on top of the stack.
#     + top() -- Get the top element.
#     + empty() -- Return whether the stack is empty.
#
# Notes:
#
#     + You must use only standard operations of a queue -- which means only
#       push to back, peek/pop from front, size, and is empty operations are
#       valid.
#     + Depending on your language, queue may not be supported natively. You
#       may simulate a queue by using a list or deque (double-ended queue), as
#       long as you use only standard operations of a queue.
#     + You may assume that all operations are valid (for example, no pop or
#       top operations will be called on an empty stack).
#
# Credits:
#
#     Special thanks to @jianchao.li.fighter for adding this problem and all
#     test cases.


class Stack
  # Initialize your data structure here.
  def initialize
    @q1, @q2 = [], []
  end

  # @param {Integer} x
  # @return {void}
  def push(x)
    if @q1.empty?
      @q2 << x
      return
    end

    @q1 << x
    return
  end

  # @return {void}
  def pop
    if @q1.empty?
      while true
        e = @q2.shift
        return if @q2.empty?
        @q1 << e
      end
    end

    while true
      e = @q1.shift
      return if @q1.empty?
      @q2 << e
    end
  end

  # @return {Integer}
  def top
    if @q1.empty?
      while true
        e = @q2.shift
        @q1 << e
        return e if @q2.empty?
      end
    end

    while true
      e = @q1.shift
      @q2 << e
      return e if @q1.empty?
    end
  end

  # @return {Boolean}
  def empty
    @q1.empty? && @q2.empty?
  end
end
