# https://leetcode.com/problems/reorder-list/
#
# Given a singly linked list L: L0 -> L1 -> ... L(n-1) -> Ln reorder it to:
# L0 -> Ln -> L1 -> L(n-1) -> ...
#
# You must do this in-place without altering the nodes' values.
#
# For example, Given {1, 2, 3, 4}, reorder it to {1, 4, 2, 3}.


# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end


# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  return nil if head.nil?

  fast, slow = head, head
  while fast && fast.next
    fast = fast.next.next
    slow = slow.next
  end

  curr, prev = slow, nil
  while curr
    curr_next = curr.next
    curr.next = prev
    prev = curr
    curr = curr_next
  end

  h1, h2 = head, prev
  while h1.next && h2.next
    t1, t2 = h1.next, h2.next
    h1.next, h2.next = h2, h1.next
    h1, h2 = t1, t2
  end

  nil
end
