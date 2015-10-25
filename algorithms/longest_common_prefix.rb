# https://leetcode.com/problems/longest-common-prefix/
#
# Write a function to find the longest common prefix string amongst an array
# of strings.


# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return '' if strs.empty?

  str, cnt = strs[0], 0
  str.chars.each_with_index do |ch, idx|
    break if strs[1..-1].any? { |s| s[idx] != ch }
    cnt += 1
  end
  str.slice(0, cnt)
end
