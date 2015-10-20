# https://leetcode.com/problems/candy/
#
# There are N children standing in a line. Each child is assigned a rating
# value. You are giving candies to these children subjected to the following
# requirements:
#
#     + Each child must have at least one candy.
#     + Children with a higher rating get more candies than their neighbors.
#
# What is the minimum candies you must give?


# @param {Integer[]} ratings
# @return {Integer}
def candy(ratings)
  candies = Array.new(ratings.size, 1)

  (0...ratings.size).each_cons(2) do |i1, i2|
    if ratings[i1] < ratings[i2]
      candies[i2] = candies[i1] + 1
    end
  end

  (ratings.size - 1).downto(0).each_cons(2) do |i1, i2|
    if ratings[i1] < ratings[i2]
      candies[i2] = candies[i1] + 1 if candies[i2] < candies[i1] + 1
    end
  end

  candies.reduce(&:+)
end
