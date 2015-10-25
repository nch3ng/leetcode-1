# https://leetcode.com/problems/swap-nodes-in-pairs/
#
# Given a linked list, swap every two adjacent nodes and return its head.
#
# For example, Given 1 -> 2 -> 3 -> 4, you should return the list as
# 2 -> 1 -> 4 -> 3.
#
# Note: Your algorithm should use only constant space. You may not modify the
# values in the list, only nodes itself can be changed.


# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end


# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  return head if head.nil? || head.next.nil?

  h = ListNode.new(0)
  h.next = head

  n = h
  while n.next && n.next.next
    n1, n2, n3 = n, n.next, n.next.next

    n2.next = n3.next
    n3.next = n2
    n1.next = n3

    n = n2
  end

  h.next
end
