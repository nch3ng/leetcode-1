# https://leetcode.com/problems/zigzag-conversion/
#
# The string "PAYPALISHIRING" is written in a zigzag pattern on a given
# number of rows like this: (you may want to display this pattern in a fixed
# font for better legibility)
#
#     P   A   H   N
#     A P L S I I G
#     Y   I   R
#
# And then read line by line: "PAHNAPLSIIGYIR"
#
# Write the code that will take a string and make this conversion given a
# number of rows:
#
#     string convert(string text, int nRows);
#
# convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".


# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  return s.dup if num_rows == 1 || s.size <= num_rows

  newstr, cycle = '', 2 * num_rows - 2
  0.upto(num_rows - 1) do |row|
    0.upto(s.size.fdiv(cycle).ceil - 1) do |kth|
      base = kth * cycle

      newstr << s[base + row].to_s
      newstr << s[base + cycle - row].to_s if row.between?(1, num_rows - 2)
    end
  end
  newstr
end
