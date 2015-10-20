# https://leetcode.com/problems/edit-distance/
#
# Given two words word1 and word2, find the minimum number of steps required
# to convert word1 to word2. (each operation is counted as 1 step.)
#
# You have the following 3 operations permitted on a word:
#
#     a) Insert a character
#     b) Delete a character
#     c) Replace a character


# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
  return word2.size if word1.size.zero?
  return word1.size if word2.size.zero?

  m, n = word1.size, word2.size
    dp = Array.new(m + 1) { Array.new(n + 1, 0) }

  1.upto(m) { |i| dp[i][0] = i }
  1.upto(n) { |j| dp[0][j] = j }

  1.upto(m) do |i|
    1.upto(n) do |j|
      if word1[i - 1] == word2[j - 1]
        dp[i][j] = dp[i - 1][j - 1]
      else
        dp[i][j] = dp[i - 1][j - 1] + 1
        dp[i][j] = dp[i - 1][j] + 1 if dp[i][j] > dp[i - 1][j] + 1
        dp[i][j] = dp[i][j - 1] + 1 if dp[i][j] > dp[i][j - 1] + 1
      end
    end
  end

  dp[-1][-1]
end
