# https://leetcode.com/problems/partition-list/
#
# Given a linked list and a value x, partition it such that all nodes less
# than x come before nodes greater than or equal to x.
#
# You should preserve the original relative order of the nodes in each of the
# two partitions.
#
# For example:
#
#     Given 1 -> 4 -> 3 -> 2 -> 5 -> 2 and x = 3,
#     Return 1 -> 2 -> 2 -> 4 -> 3 -> 5.


# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end


# @param {ListNode} head
# @param {Integer} x
# @return {ListNode}
def partition(head, x)
  h1 = t1 = ListNode.new(0)
  h2 = t2 = ListNode.new(0)

  while head
    temp = head.next

    if head.val < x
      t1.next, head.next = head, nil
      t1 = t1.next
    else
      t2.next, head.next = head, nil
      t2 = t2.next
    end

    head = temp
  end

  t1.next = h2.next
  h1.next
end
