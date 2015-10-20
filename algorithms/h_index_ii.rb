# https://leetcode.com/problems/h-index-ii/
#
# Follow up for "H-Index":
#
#     What if the citations array is sorted in ascending order?
#     Could you optimize your algorithm?


# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
  lbound, ubound = 0, citations.size - 1

  while ubound >= lbound
    m = (ubound + lbound) / 2

    case citations[m] <=> citations.size - m
    when -1; lbound = m + 1
    when  1; ubound = m - 1
    when  0; return citations[m]
    end
  end

  citations.size - ubound - 1
end
