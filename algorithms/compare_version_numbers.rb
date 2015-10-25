# https://leetcode.com/problems/compare-version-numbers/
#
# Compare two version numbers version1 and version2. If version1 > version2
# return 1, if version1 < version2 return -1, otherwise return 0. You may
# assume that the version strings are non-empty and contain only digits and
# the . character. The . character does not represent a decimal point and is
# used to separate number sequences. For instance, 2.5 is not "two and a half"
# or "half way to version three", it is the fifth second-level revision of the
# second first-level revision. Here is an example of version numbers ordering:
#
#     0.1 < 1.1 < 1.2 < 13.37
#
# Credits:
#
#     Special thanks to @ts for adding this problem and creating all test
#     cases.


# @param {String} version1
# @param {String} version2
# @return {Integer}
def compare_version(version1, version2)
  v1 = version1.split('.').map(&:to_i)
  v2 = version2.split('.').map(&:to_i)

  size = v1.size - v2.size
  return v1 <=> v2 if size == 0
  return v1 <=> v2.concat(Array.new(size, 0)) if size > 0
  return v1.concat(Array.new(-size, 0)) <=> v2
end
