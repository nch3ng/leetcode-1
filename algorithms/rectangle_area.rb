# https://leetcode.com/problems/rectangle-area/
#
# Find the total area covered by two rectilinear rectangles in a 2D plane.
# Each rectangle is defined by its bottom left corner and top right corner as
# shown in the figure.
#
#                    Y
#                    ^
#                    |
#                    |    (C,D):(3,4)
#          +---------+---------+
#          |         |         |
#          |         |         |
#          |         |         |             (G,H):(9,2)
#          |         +---------+------------------+
#          |         |         |                  |
#          |         |         |                  |
#          |      O(0,0)       |                  |
#          +---------+---------+------------------+------> X
#     (A,B):(-3,0)   |                            |
#                    +----------------------------+
#               (E,F):(0,-1)
#
# Assume that the total area is never beyond the maximum possible value of int.
#
# Credits:
#
#     Special thanks to @mithmatt for adding this problem, creating the above
#     image and all test cases.


# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @param {Integer} d
# @param {Integer} e
# @param {Integer} f
# @param {Integer} g
# @param {Integer} h
# @return {Integer}
def compute_area(a, b, c, d, e, f, g, h)
  area = (d - b) * (c - a) + (h - f) * (g - e)

  left , right = [a, e].max, [c, g].min
  return area unless left  < right

  lower, upper = [b, f].max, [d, h].min
  return area unless lower < upper

  area - (upper - lower) * (right - left)
end
