# https://leetcode.com/problems/rotate-list/
#
# Given a list, rotate the list to the right by k places, where k is
# non-negative.
#
# For example:
#
#     Given 1 -> 2 -> 3 -> 4 -> 5 -> NULL and k = 2,
#     return 4 -> 5 -> 1 -> 2 -> 3 -> NULL.


# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end


# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  return head if head.nil? || head.next.nil?

  node, size = head, 1
  while node = node.next; size += 1; end

  k = k % size
  return head if k.zero?

  h1 = t1 = head
  steps = size - k - 1
  steps.times { t1 = t1.next }

  h2 = t2 = t1.next
  while t2.next; t2 = t2.next; end

  t1.next = nil
  t2.next = h1
  h2
end
