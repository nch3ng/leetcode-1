# https://leetcode.com/problems/palindrome-linked-list/
#
# Given a singly linked list, determine if it is a palindrome.
#
# Follow up:
#
#     Could you do it in O(n) time and O(1) space?


# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end


# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
  return true if head.nil?

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
  h1, h2 = h1.next, h2.next while h2 && h2.val == h1.val

  curr, prev = prev, nil
  while curr
    curr_next = curr.next
    curr.next = prev
    prev = curr
    curr = curr_next
  end

  h2.nil?
end
