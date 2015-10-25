# https://leetcode.com/problems/find-median-from-data-stream/
#
# Median is the middle value in an ordered integer list. If the size of the
# list is even, there is no middle value. So the median is the mean of the two
# middle value.
#
# Examples:
#
#     [2, 3, 4], the median is 3
#     [2, 3], the median is (2 + 3) / 2 = 2.5
#
# Design a data structure that supports the following two operations:
#
#     + void addNum(int num) - Add a integer number from the data stream to
#       the data structure.
#     + double findMedian() - Return the median of all elements so far.
#
# For example:
#
#     add(1)
#     add(2)
#     findMedian() -> 1.5
#     add(3)
#     findMedian() -> 2
#
# Credits:
#
#     Special thanks to @Louis1992 for adding this problem and creating all
#     test cases.


class PriorityQueue
  def initialize(cmp)
    @queue, @cmp = [], cmp
  end

  def <<(value)
    @queue << value; _swim_(@queue.size - 1); self
  end

  def shift
    @queue[0], @queue[-1] = @queue[-1], @queue[0]
    @queue.pop.tap { _sink_(0) }
  end

  def peek
    @queue[0]
  end

  def size
    @queue.size
  end

  def empty?
    @queue.empty?
  end

  private def _swim_(k)
    while k > 0 && @cmp.call(@queue[k], @queue[(k - 1) / 2])
      @queue[k], @queue[(k - 1) / 2] = @queue[(k - 1) / 2], @queue[k]
      k = (k - 1) / 2
    end
  end

  private def _sink_(k)
    while k * 2 + 1 < @queue.size
      kk  = k * 2 + 1
      kk += 1 if @queue[kk + 1] && @cmp.call(@queue[kk + 1], @queue[kk])
      break if @cmp.call(@queue[k], @queue[kk])

      @queue[k], @queue[kk] = @queue[kk], @queue[k]
      k = kk
    end
  end
end


class MedianFinder
  # Initialize your data structure here.
  def initialize
    @maxpq = PriorityQueue.new(->(x1, x2) { x1 > x2 })
    @minpq = PriorityQueue.new(->(x1, x2) { x1 < x2 })
  end

  # @param {Integer} num
  # @return {Void}
  # Adds a num into the data structure.
  def add_num(num)
    if @maxpq.empty?
      @maxpq << num; return
    end

    if @maxpq.size == @minpq.size
      @maxpq << num
    else
      @minpq << num
    end

    if @maxpq.peek > @minpq.peek
      @maxpq << @minpq.shift
      @minpq << @maxpq.shift
    end; nil
  end

  # @return {Float}
  # Returns median of current data stream
  def find_median
    @maxpq.size == @minpq.size ? (@maxpq.peek + @minpq.peek).fdiv(2) : @maxpq.peek
  end
end


# Your MedianFinder object will be instantiated and called as such:
# mf = MedianFinder.new
# mf.add_num(1)
# mf.find_median()
