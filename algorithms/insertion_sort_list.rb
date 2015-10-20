# https://leetcode.com/problems/insertion-sort-list/
#
# Sort a linked list using insertion sort.


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
def insertion_sort_list(head)
  return nil if head.nil?

  dummy = ListNode.new(0)
  dummy.next = head

  last = head
  curr = last.next
  while curr
    if last.val <= curr.val
      last = curr
      curr = last.next
      next
    end

    inst = dummy
    inst = inst.next while inst.next && inst.next.val <= curr.val

    last.next = curr.next
    curr.next = inst.next
    inst.next = curr
    curr = last.next
  end

  dummy.next
end
