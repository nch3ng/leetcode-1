# https://leetcode.com/problems/container-with-most-water/
#
# Given n non-negative integers a1, a2, ..., an, where each represents a point
# at coordinate (i, ai). n vertical lines are drawn such that the two
# endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together
# with x-axis forms a container, such that the container contains the most
# water.
#
# Note: You may not slant the container.


# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  maxarea = 0

  lbound, ubound = 0, height.size - 1
  while lbound < ubound
    if height[lbound] < height[ubound]
      area = (ubound - lbound) * height[lbound]
      lbound += 1
    else
      area = (ubound - lbound) * height[ubound]
      ubound -= 1
    end

    maxarea = area if maxarea < area
  end

  maxarea
end
