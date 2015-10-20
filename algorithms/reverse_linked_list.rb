# https://leetcode.com/problems/reverse-linked-list/
#
# Reverse a singly linked list.


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
def reverse_list(head)
  return nil if head.nil?

  curr, prev = head, nil
  while curr
    curr_next = curr.next
    curr.next = prev
    prev = curr
    curr = curr_next
  end

  prev
end
