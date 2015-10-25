# https://leetcode.com/problems/largest-rectangle-in-histogram/
#
# Given n non-negative integers representing the histogram's bar height where
# the width of each bar is 1, find the area of largest rectangle in the
# histogram.
#
#                   6
#                  ___
#               5 |   |
#              ___|   |
#             |   |   |
#             |   |   |
#             |   |   |     3
#             |   |   |    ___
#       2     |   |   | 2 |   |
#      ___    |   |   |___|   |
#     |   | 1 |   |   |   |   |
#     |   |___|   |   |   |   |
#     |   |   |   |   |   |   |
#     |___|___|___|___|___|___|
#
#
#                   6
#                  ___
#               5 |   |
#              ___|___|
#             |+-+|+-+|
#             |+-+|+-+|
#             |+-+|+-+|     3
#             |+-+|+-+|    ___
#       2     |+-+|+-+| 2 |   |
#      ___    |+-+|+-+|___|   |
#     |   | 1 |+-+|+-+|   |   |
#     |   |___|+-+|+-+|   |   |
#     |   |   |+-+|+-+|   |   |
#     |___|___|+-+|+-+|___|___|
#
# For example, Given height = [2, 1, 5, 6, 2, 3], return 10.


# @param {Integer[]} height
# @return {Integer}
def largest_rectangle_area(height)
  maxarea = 0
  height, stack = (height << 0), [-1]

  height.each_with_index do |h, i|
    while h < height[stack[-1]]
      subarea = height[stack.pop] * (i - 1 - stack[-1])
      maxarea = subarea if maxarea < subarea
    end
    stack.push(i)
  end

  maxarea
end
