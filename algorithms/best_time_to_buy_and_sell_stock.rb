# https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
#
# Say you have an array for which the ith element is the price of a given
# stock on day i. If you were only permitted to complete at most one
# transaction (ie, buy one and sell one share of the stock), design an
# algorithm to find the maximum profit.


# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  maxprofit = 0

  minprice = prices[0]
  prices.each do |price|
    minprice = price if minprice > price

    profit = price - minprice
    maxprofit = profit if maxprofit < profit
  end

  maxprofit
end
