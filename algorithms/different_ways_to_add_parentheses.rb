# https://leetcode.com/problems/different-ways-to-add-parentheses/
#
# Given a string of numbers and operators, return all possible results from
# computing all the different possible ways to group numbers and operators.
# The valid operators are +, - and *.
#
# Example 1
#
#     Input: "2-1-1".
#
#       ((2-1)-1) = 0
#       (2-(1-1)) = 2
#
#     Output: [0, 2]
#
# Example 2
#
#     Input: "2*3-4*5"
#
#       (2*(3-(4*5))) = -34
#       ((2*3)-(4*5)) = -14
#       ((2*(3-4))*5) = -10
#       (2*((3-4)*5)) = -10
#       (((2*3)-4)*5) = 10
#
#     Output: [-34, -14, -10, -10, 10]
#
# Credits:
#
#     Special thanks to @mithmatt for adding this problem and creating all
#     test cases.


# @param {String} input
# @return {Integer[]}
def diff_ways_to_compute(input)
  out, idx = [], 0

  while true
    idx = input.index(/[\+\-\*\/]/, idx)
    break if idx.nil?

    array_l = diff_ways_to_compute(input[0...idx])
    op = input[idx]; idx += 1
    array_r = diff_ways_to_compute(input[idx..-1])

    array_l.each do |l|
      array_r.each do |r|
        case op
        when '+'; out << l + r
        when '-'; out << l - r
        when '*'; out << l * r
        when '/'; out << l / r
        end
      end
    end
  end

  out.empty? ? [input.to_i] : out
end
