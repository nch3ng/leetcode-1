# https://leetcode.com/problems/remove-linked-list-elements/
#
# Remove all elements from a linked list of integers that have value val.
#
# Example:
#
#     Given: 1 --> 2 --> 6 --> 3 --> 4 --> 5 --> 6, val = 6
#     Return: 1 --> 2 --> 3 --> 4 --> 5
#
# Credits:
#
#     Special thanks to @mithmatt for adding this problem and creating all
#     test cases.


# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end


# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
  head = head.next while head && head.val == val
  return nil if head.nil?

  node = head
  while node.next
    if node.next.val == val
      node.next = node.next.next
    else
      node = node.next
    end
  end

  head
end
