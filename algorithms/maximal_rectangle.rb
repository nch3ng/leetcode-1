# https://leetcode.com/problems/maximal-rectangle/
#
# Given a 2D binary matrix filled with 0's and 1's, find the largest rectangle
# containing all ones and return its area.


# @param {Character[][]} matrix
# @return {Integer}
def maximal_rectangle(matrix)
  return 0 if matrix.empty?

  matrix = Marshal.load(Marshal.dump(matrix))
    m, n = matrix.size, matrix[0].size

  0.upto(m - 1) do |i|
    0.upto(n - 1) do |j|
      if i == 0
        matrix[i][j] = (matrix[i][j] == '0' ? 0 : 1)
      else
        matrix[i][j] = (matrix[i][j] == '0' ? 0 : matrix[i - 1][j] + 1)
      end
    end
  end

  maxarea = 0

  0.upto(m - 1) do |i|
    height, stack = (matrix[i] << 0), [-1]

    height.each_with_index do |h, idx|
      while h < height[stack[-1]]
        subarea = height[stack.pop] * (idx - 1 - stack[-1])
        maxarea = subarea if maxarea < subarea
      end
      stack.push(idx)
    end
  end

  maxarea
end
