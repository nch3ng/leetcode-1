# https://leetcode.com/problems/set-matrix-zeroes/
#
# Given a m x n matrix, if an element is 0, set its entire row and column to 0.
# Do it in place.
#
# Follow up: Did you use extra space? A straight forward solution using O(mn)
# space is probably a bad idea. A simple improvement uses O(m + n) space, but
# still not the best solution. Could you devise a constant space solution?


# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  return if matrix.empty?

  m, n = matrix.size, matrix[0].size
  row0marker = (0...n).any? { |j| matrix[0][j].zero? }
  col0marker = (0...m).any? { |i| matrix[i][0].zero? }

  (1...m).each do |i|
    (1...n).each do |j|
      if matrix[i][j].zero?
        matrix[0][j] = matrix[i][0] = 0
      end
    end
  end

  (1...m).each do |i|
    (1...n).each do |j|
      if matrix[0][j].zero? || matrix[i][0].zero?
        matrix[i][j] = 0
      end
    end
  end

  ((0...n).each { |j| matrix[0][j] = 0 }; nil) if row0marker
  ((0...m).each { |i| matrix[i][0] = 0 }; nil) if col0marker
end
