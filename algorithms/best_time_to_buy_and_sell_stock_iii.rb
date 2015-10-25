# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/
#
# Say you have an array for which the ith element is the price of a given
# stock on day i. Design an algorithm to find the maximum profit. You may
# complete at most two transactions. However, You may not engage in multiple
# transactions at the same time (ie, you must sell the stock before you buy
# again).


# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  profits = Array.new(prices.size)

  maxprofit, minprice = 0, prices[0]
  prices.each_with_index do |price, idx|
    minprice = price if minprice > price

    profit = price - minprice
    maxprofit = profit if maxprofit < profit
    profits[idx] = maxprofit
  end

  maxprofit, maxprice = 0, prices[-1]
  prices.reverse.each_with_index do |price, idx|
    maxprice = price if maxprice < price

    profit = maxprice - price
    maxprofit = profit if maxprofit < profit
    profits[-1 + -idx] += maxprofit
  end

  profits.max || 0
end
