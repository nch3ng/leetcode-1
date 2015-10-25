# https://leetcode.com/problems/decode-ways/
#
# A message containing letters from A-Z is being encoded to numbers using the
# following mapping:
#
#     'A' -> 1
#     'B' -> 2
#     ...
#     'Z' -> 26
#
# Given an encoded message containing digits, determine the total number of
# ways to decode it.
#
# For example, Given encoded message "12", it could be decoded as "AB" (1 2)
# or "L" (12). The number of ways decoding "12" is 2.


# @param {String} s
# @return {Integer}
def num_decodings(s)
  return 0 if s.empty?

  dp = Array.new([s.size, 2].max, 0)
  dp[0] = case s[0]
          when      '0'; 0
          when '1'..'9'; 1
          end
  dp[1] = case s[0, 2]
          when '00'..'09'; 0
          when '10', '20'; 1
          when '11'..'19'; 2
          when '21'..'26'; 2
          when '30', '40', '50', '60', '70', '80', '90'; 0
          when '27'..'99'; 1
          end

  2.upto(s.size - 1) do |bound|
    dp[bound] += dp[bound - 1] if s[bound].between?('1', '9')
    dp[bound] += dp[bound - 2] if s[bound - 1, 2].between?('10', '26')
  end

  dp[s.size - 1]
end
