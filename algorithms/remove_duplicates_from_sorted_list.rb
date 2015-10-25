# https://leetcode.com/problems/remove-duplicates-from-sorted-list/
#
# Given a sorted linked list, delete all duplicates such that each element
# appear only once.
#
# For example:
#
#     Given 1 -> 1 -> 2, return 1 -> 2.
#     Given 1 -> 1 -> 2 -> 3 -> 3, return 1 -> 2 -> 3.


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
def delete_duplicates(head)
  curr, cursor = head, head

  while cursor
    val = cursor.val
    cursor = cursor.next
    while cursor && cursor.val == val
      cursor = cursor.next
    end

    if cursor.nil?
      curr.val, curr.next = val, nil
      break
    end

    curr.val, curr = val, curr.next
  end

  head
end
