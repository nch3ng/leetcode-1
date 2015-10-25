# https://leetcode.com/problems/reverse-nodes-in-k-group/
#
# Given a linked list, reverse the nodes of a linked list k at a time and
# return its modified list. If the number of nodes is not a multiple of k
# then left-out nodes in the end should remain as it is. You may not alter
# the values in the nodes, only nodes itself may be changed. Only constant
# memory is allowed.
#
# For example:
#
#     Given this linked list: 1 -> 2 -> 3 -> 4 -> 5
#     For k = 2, you should return: 2 -> 1 -> 4 -> 3 -> 5
#     For k = 3, you should return: 3 -> 2 -> 1 -> 4 -> 5


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
def reverse_k_group(head, k)
  return head if (k -= 1) == 0

  dummy = ListNode.new(0)
   tail = dummy

  fast, slow = head, head
  while fast
    k.times { fast && fast = fast.next }
    break if fast.nil?

    curr, prev = slow, nil
    while prev != fast
      curr_next = curr.next
      curr.next = prev
      prev = curr
      curr = curr_next
    end

    tail.next = fast
    tail = slow

    fast, slow = curr, curr
  end
  tail.next = slow

  dummy.next
end
