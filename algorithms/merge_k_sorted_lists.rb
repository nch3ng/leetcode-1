# https://leetcode.com/problems/merge-k-sorted-lists/
#
# Merge k sorted linked lists and return it as one sorted list. Analyze and
# describe its complexity.


# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end


# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  _merge_k_lists_(lists, 0, lists.size - 1)
end

private def _merge_k_lists_(list, lbound, ubound)
  return list[lbound] unless ubound - lbound > 0

  m = (ubound + lbound) / 2
  l = _merge_k_lists_(list, lbound, m)
  r = _merge_k_lists_(list, m + 1, ubound)
  return _merge_two_lists_(l, r)
end

private def _merge_two_lists_(alist, blist)
  return alist || blist unless alist && blist

  alist, blist = blist, alist unless alist.val < blist.val
  clist, alist = alist, alist.next

  walker = clist
  while alist && blist
    if alist.val < blist.val
      walker.next = alist
      alist = alist.next
    else
      walker.next = blist
      blist = blist.next
    end

    walker = walker.next
  end
  walker.next = alist || blist

  clist
end
