# https://leetcode.com/problems/trapping-rain-water/
#
# Given n non-negative integers representing an elevation map where the width
# of each bar is 1, compute how much water it is able to trap after raining.
#
# For example, Given [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1], return 6.
#
#     ^
#     |
#     |
#     |                            ||||
#     |                            ||||
#     |            ||||************||||||||****||||
#     |            ||||************||||||||****||||
#     |    ||||****||||||||****||||||||||||||||||||||||
#     |    ||||****||||||||****||||||||||||||||||||||||
#     +---------------------------------------------------->


# @param {Integer[]} height
# @return {Integer}
def trap(height)
  lbound, ubound = 0, height.size - 1
  boundheight, capacity = 0, 0

  while lbound < ubound
    lh, uh = height[lbound], height[ubound]
    if lh < uh
      lbound += 1
      h = lh
    else
      ubound -= 1
      h = uh
    end

    if h > boundheight
      boundheight = h
    else
      capacity += boundheight - h
    end
  end

  capacity
end
