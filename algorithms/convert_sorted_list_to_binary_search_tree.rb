# https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/
#
# Given a singly linked list where elements are sorted in ascending order,
# convert it to a height balanced BST.


# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end
#
# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {ListNode} head
# @return {TreeNode}
def sorted_list_to_bst(head)
  size, node = 0, head
  while node
    size, node = size + 1, node.next
  end

  _sorted_list_to_bst_(head, size)[1]
end

private def _sorted_list_to_bst_(lhead, size)
  return [lhead, nil] if size.zero?

  lsize = size / 2
  rsize = size - lsize - 1

  ltail, lnode = _sorted_list_to_bst_(lhead, lsize)
  v = ltail.val
  rtail, rnode = _sorted_list_to_bst_(ltail.next, rsize)

  rootnode = TreeNode.new(v)
  rootnode.left, rootnode.right = lnode, rnode

  return [rtail, rootnode]
end
