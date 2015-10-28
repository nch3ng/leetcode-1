# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
#
# Say you have an array for which the ith element is the price of a given
# stock on day i. Design an algorithm to find the maximum profit. You may
# complete as many transactions as you like (ie, buy one and sell one share
# of the stock multiple times). However, you may not engage in multiple
# transactions at the same time (ie, you must sell the stock before you buy
# again).


# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  prices.each_cons(2).map(&->(p1, p2){ [p2 - p1, 0].max }).reduce(0, &:+)
end
