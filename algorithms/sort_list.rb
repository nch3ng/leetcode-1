# https://leetcode.com/problems/sort-list/
#
# Sort a linked list in O(nlogn) time using constant space complexity.


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
def sort_list(head)
  return head if head.nil? || head.next.nil?

  dummy = ListNode.new(0).tap { |node| node.next = head }
  size  = 1
  size += 1 while (head = head.next)

  subsize = 1
  while subsize < size
    subdummy = dummy

    while subdummy.next
      alist, alistend = subdummy.next, subdummy
      subsize.times { alistend = alistend.next if alistend.next }
      break if alistend.next.nil?

      blist, blistend = alistend.next, alistend
      subsize.times { blistend = blistend.next if blistend.next }

      alistend.next = blistend.next
      _merge_two_lists_(subdummy, alist, blist, blistend.next)

      subdummy = alistend.val < blistend.val ? blistend : alistend
    end

    subsize *= 2
  end

  dummy.next
end

private def _merge_two_lists_(dummy, alist, blist, tail)
  walker = dummy
  while alist != tail && blist != tail
    if alist.val < blist.val
      walker.next = alist
      alist = alist.next
    else
      walker.next = blist
      blist = blist.next
    end

    walker = walker.next
  end
  walker.next = (alist != tail) ? alist : blist
end
