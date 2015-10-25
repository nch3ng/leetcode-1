# https://leetcode.com/problems/min-stack/
#
# Design a stack that supports push, pop, top, and retrieving the minimum
# element in constant time.
#
#     + push(x) -- Push element x onto stack.
#     + pop() -- Removes the element on top of the stack.
#     + top() -- Get the top element.
#     + getMin() -- Retrieve the minimum element in the stack.


class MinStack
  # Initialize your data structure here
  def initialize
    @stack = []
    @min_stack = []
  end

  # @param {Integer} x
  # @return {Void} nothing
  def push(x)
    @stack.push(x)
    @min_stack.push(x) if @min_stack.empty? || @min_stack[-1] >= x
  end

  # @return {Void} nothing
  def pop
    @min_stack.pop if @min_stack[-1] == @stack[-1]
    @stack.pop; nil
  end

  # @return {Integer}
  def top
    @stack[-1]
  end

  # @return {Integer}
  def get_min
    @min_stack[-1]
  end
end
