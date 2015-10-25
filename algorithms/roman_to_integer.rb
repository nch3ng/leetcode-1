# https://leetcode.com/problems/roman-to-integer/
#
# Given a roman numeral, convert it to an integer. Input is guaranteed to be
# within the range from 1 to 3999.


# @param {String} s
# @return {Integer}
def roman_to_int(s)
  map = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  sum = map[s[0]]
  s.chars.each_cons(2) do |c1, c2|
    sum += map[c2]
    sum -= map[c1] * 2 if map[c1] < map[c2]
  end
  sum
end
