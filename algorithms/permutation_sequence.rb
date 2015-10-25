# https://leetcode.com/problems/permutation-sequence/
#
# The set [1, 2, 3, ..., n] contains a total of n! unique permutations. By
# listing and labeling all of the permutations in order, We get the following
# sequence (ie, for n = 3):
#
#     1. "123"
#     2. "132"
#     3. "213"
#     4. "231"
#     5. "312"
#     6. "321"
#
# Given n and k, return the kth permutation sequence.
#
# Note: Given n will be between 1 and 9 inclusive.


# @param {Integer} n
# @param {Integer} k
# @return {String}
def get_permutation(n, k)
  seq = Array(1..n)
  mul = seq.reduce(&:*)
  kth = k - 1

  str = ''
  n.downto(1) do |num|
    mul /= num
    grp, kth = kth.divmod(mul)
    str << seq.delete_at(grp).to_s
  end
  str
end
