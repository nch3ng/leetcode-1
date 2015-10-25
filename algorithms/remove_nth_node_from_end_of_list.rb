# https://leetcode.com/problems/remove-nth-node-from-end-of-list/
#
# Given a linked list, remove the nth node from the end of list and return its
# head.
#
# For example:
#
#     Given linked list: 1 -> 2 -> 3 -> 4 -> 5, and n = 2. After removing the
#     second node from the end, the linked list becomes 1 -> 2 -> 3 -> 5.
#
# Note:
#
#     Given n will always be valid. Try to do this in one pass.


# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end


# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  fast, slow = head, head

  n.times { fast = fast.next }
  return head.next if fast.nil?

  fast, slow = fast.next, slow.next while fast.next
  slow.next = slow.next.next
  return head
end
