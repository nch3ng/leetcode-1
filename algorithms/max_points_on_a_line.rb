# https://leetcode.com/problems/max-points-on-a-line/
#
# Given n points on a 2D plane, find the maximum number of points that lie on
# the same straight line.


# Definition for a point.
# class Point
#   attr_accessor :x, :y
#   def initialize(x=0, y=0)
#     @x = x
#     @y = y
#   end
# end


# @param {Point[]} points
# @return {Integer}
def max_points(points)
  max = 0

  points.each_with_index do |p1, i1|
    count, dupcount = {}, 0

    points.each_with_index do |p2, i2|
      if p1.x == p2.x && p1.y == p2.y
        dupcount += 1; next
      end

      m = (p1.x == p2.x ? Float::INFINITY : (p1.y - p2.y).fdiv(p1.x - p2.x))
      count[m] ||= 0
      count[m]  += 1
    end

    submax = (count.values.max || 0) + dupcount
    max = submax if max < submax
  end

  max
end
