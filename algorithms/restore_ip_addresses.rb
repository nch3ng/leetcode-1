# https://leetcode.com/problems/restore-ip-addresses/
#
# Given a string containing only digits, restore it by returning all possible
# valid IP address combinations.
#
# For example:
#
#     Given "25525511135",
#     Return ["255.255.11.135", "255.255.111.35"]. (Order does not matter)


# @param {String} s
# @return {String[]}
def restore_ip_addresses(s)
  [].tap do |result|
    _restore_ip_addresses_(s, 0, [], result)
  end
end

private def _restore_ip_addresses_(str, idx, tracing, result)
  if str[idx].nil? || tracing.size == 4
    result << tracing.join('.') if str[idx].nil? && tracing.size == 4
    return
  end

  substr = str[idx]
  _restore_ip_addresses_(str, idx + 1, tracing.dup << substr, result)

  substr = str[idx, 2]
  return if substr.to_i < 10
  _restore_ip_addresses_(str, idx + 2, tracing.dup << substr, result)

  substr = str[idx, 3]
  return if substr.to_i < 100 || substr.to_i > 255
  _restore_ip_addresses_(str, idx + 3, tracing.dup << substr, result)
end
