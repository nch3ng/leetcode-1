# https://leetcode.com/problems/add-two-numbers/
#
# You are given two linked lists representing two non-negative numbers. The
# digits are stored in reverse order and each of their nodes contain a single
# digit. Add the two numbers and return it as a linked list.
#
#  Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8


# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end


# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  n1, n2, n3, l3, carry = l1, l2, nil, nil, 0

  while n1 || n2
    n1 ? (v1 = n1.val; n1 = n1.next) : (v1 = 0)
    n2 ? (v2 = n2.val; n2 = n2.next) : (v2 = 0)

    sum = v1 + v2 + carry
    carry, digit = sum.divmod(10)

    n = ListNode.new(digit)
    n3 ? (n3.next = n; n3 = n) : (n3 = n; l3 = n3)
  end
  n3.next = ListNode.new(carry) if carry.nonzero?

  l3
end
