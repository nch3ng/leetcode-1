# https://leetcode.com/problems/maximum-product-subarray/
#
# Find the contiguous subarray within an array (containing at least one number)
# which has the largest product.
#
# For example, given the array [2, 3, -2, 4], the contiguous subarray [2,3] has
# the largest product = 6.


# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  product, lsubproduct, rsubproduct = [nums[0], nums[-1]].max, nums[0], nums[-1]

  (1...nums.size).each do |idx|
    lsubproduct  = 1 if lsubproduct == 0
    lsubproduct *= nums[idx]
    product = lsubproduct if product < lsubproduct

    rsubproduct  = 1 if rsubproduct == 0
    rsubproduct *= nums[-1 + -idx]
    product = rsubproduct if product < rsubproduct
  end

  product
end
