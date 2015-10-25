# https://leetcode.com/problems/sliding-window-maximum/
#
# Given an array nums, there is a sliding window of size k which is moving
# from the very left of the array to the very right. You can only see the k
# numbers in the window. Each time the sliding window moves right by one
# position.
#
# For example, Given nums = [1, 3, -1, -3, 5, 3, 6, 7], and k = 3.
#
#     Window position                Max
#     ---------------               -----
#    [1  3  -1] -3  5  3  6  7       3
#     1 [3  -1  -3] 5  3  6  7       3
#     1  3 [-1  -3  5] 3  6  7       5
#     1  3  -1 [-3  5  3] 6  7       5
#     1  3  -1  -3 [5  3  6] 7       6
#     1  3  -1  -3  5 [3  6  7]      7
#
# Therefore, return the max sliding window as [3, 3, 5, 5, 6, 7].
#
# Note:
#
#     You may assume k is always valid, ie: 1 ≤ k ≤ input array's size for
#     non-empty array.
#
# Follow up:
#
#     Could you solve it in linear time?


class MonotonicQueue
  MonotonicQueueNode = Struct.new(:value, :count)

  def initialize
    @queue = []
  end

  def <<(value)
    count = 0
    while !@queue.empty? && @queue[-1].value < value
      count += @queue[-1].count + 1
      @queue.pop
    end
    @queue << MonotonicQueueNode.new(value, count); self
  end

  def shift
    if @queue[0].count > 0
      @queue[0].count -= 1; return
    end
    @queue.shift; nil
  end

  def peek
    @queue[0].value
  end
end


# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
  return [] if nums.empty?

  out, q = [], MonotonicQueue.new

  0.upto(k - 1) { |i| q << nums[i] }
  out << q.peek

  k.upto(nums.size - 1) { |i| q.shift; q << nums[i]; out << q.peek }
  out
end
