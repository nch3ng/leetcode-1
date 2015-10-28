# https://leetcode.com/problems/combination-sum-iii/
#
# Find all possible combinations of k numbers that add up to a number n, given
# that only numbers from 1 to 9 can be used and each combination should be a
# unique set of numbers. Ensure that numbers within the set are sorted in
# ascending order.
#
# Example 1:
#
#     Input: k = 3, n = 7
#     Output: [[1, 2, 4]]
#
# Example 2:
#
#     Input: k = 3, n = 9
#     Output: [[1, 2, 6], [1, 3, 5], [2, 3, 4]]
#
# Credits:
#
#     Special thanks to @mithmatt for adding this problem and creating all
#     test cases.


# @param {Integer} k
# @param {Integer} n
# @return {Integer[][]}
def combination_sum3(k, n)
  [].tap do |result|
    _combination_sum3_(1, 9, k, n, [], result)
  end
end

private def _combination_sum3_(lbound, ubound, k, n, tracing, result)
  sum = tracing.reduce(0, &:+)
  lbound.upto(ubound) do |i|
    break if sum + i > n

    result << (tracing.dup << i) if sum + i == n && tracing.size == k - 1
    _combination_sum3_(i + 1, ubound, k, n, tracing.dup << i, result)
  end
end
