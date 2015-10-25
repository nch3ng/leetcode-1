# https://leetcode.com/problems/merge-intervals/
#
# Given a collection of intervals, merge all overlapping intervals.
#
# For example:
#
#     Given [1, 3], [2, 6], [8, 10], [15, 18],
#     Return [1, 6], [8, 10], [15, 18].


# Definition for an interval.
# class Interval
#   attr_accessor :start, :end
#   def initialize(s=0, e=0)
#     @start = s
#     @end = e
#   end
# end


# @param {Interval[]} intervals
# @return {Interval[]}
def merge(intervals)
  return [] if intervals.empty?

  intervals = intervals.sort { |x, y| x.start <=> y.start }

  result, newinterval = [], Interval.new(intervals[0].start, intervals[0].end)
  intervals.each do |interval|
    if interval.start <= newinterval.end
      newinterval.end = interval.end if newinterval.end < interval.end
    else
      result << newinterval
      newinterval = Interval.new(interval.start, interval.end)
    end
  end
  result << newinterval
  result
end
