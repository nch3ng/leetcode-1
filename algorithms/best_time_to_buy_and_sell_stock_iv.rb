# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv/
#
# Say you have an array for which the ith element is the price of a given
# stock on day i. Design an algorithm to find the maximum profit. You may
# complete at most k transactions. However, You may not engage in multiple
# transactions at the same time (ie, you must sell the stock before you buy
# again).
#
# Credits:
#
#     Special thanks to @Freezen for adding this problem and creating all
#     test cases.


# @param {Integer} k
# @param {Integer[]} prices
# @return {Integer}
def max_profit(k, prices)
  return _max_profit_kmax_(prices) if prices.size <= 2 * k

  hold = Array.new(k + 1, -prices[0])
  sell = Array.new(k + 1, 0)
  prices.each do |price|
    1.upto(k) do |kth|
      hold[kth] = [hold[kth], sell[kth - 1] - price].max
      sell[kth] = [sell[kth], hold[kth] + price].max
    end
  end

  sell[k]
end

private def _max_profit_kmax_(prices)
  prices.each_cons(2).map(&->(p1, p2){ [p2 - p1, 0].max }).reduce(0, &:+)
end
