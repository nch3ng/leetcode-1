# https://leetcode.com/problems/rotate-image/
#
# You are given an n x n 2D matrix representing an image. Rotate the image by
# 90 degrees (clockwise).
#
# Follow up: Could you do this in-place?


# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  m, n = matrix, matrix.size

  (0...n).each do |i|
    (i...n).each do |j|
      m[i][j], m[j][i] = m[j][i], m[i][j]
    end
  end
  m.each(&:reverse!); nil
end
