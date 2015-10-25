# https://leetcode.com/problems/insert-interval/
#
# Given a set of non-overlapping intervals, insert a new interval into the
# intervals (merge if necessary).
#
# You may assume that the intervals were initially sorted according to their
# start times.
#
# Example 1:
#
#     Given intervals [1, 3], [6, 9], insert and merge [2, 5] in as [1, 5],
#     [6, 9].
#
# Example 2:
#
#     Given [1, 2], [3, 5], [6, 7], [8, 10], [12, 16], insert and merge [4, 9]
#     in as [1, 2], [3, 10], [12, 16]. This is because the new interval [4, 9]
#     overlaps with [3, 5], [6, 7], [8, 10].


# Definition for an interval.
# class Interval
#   attr_accessor :start, :end
#   def initialize(s=0, e=0)
#     @start = s
#     @end = e
#   end
# end


# @param {Interval[]} intervals
# @param {Interval} new_interval
# @return {Interval[]}
def insert(intervals, new_interval)
  result = []

  intervals.each do |interval|
    if new_interval.start > interval.end
      result << interval
    elsif new_interval.end < interval.start
      result << new_interval
      new_interval = interval
    else
      new_interval.start = [new_interval.start, interval.start].min
      new_interval.end = [new_interval.end, interval.end].max
    end
  end
  result << new_interval

  result
end
