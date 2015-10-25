# https://leetcode.com/problems/integer-to-english-words/
#
# Convert a non-negative integer to its english words representation. Given
# input is guaranteed to be less than 2 ** 31 - 1.
#
# For example:
#
#     123 ->
#         One Hundred Twenty Three
#     12345 ->
#         Twelve Thousand Three Hundred Forty Five
#     1234567 ->
#         One Million Two Hundred Thirty Four Thousand Five Hundred Sixty
#         Seven


# @param {Integer} num
# @return {String}
def number_to_words(num)
  return 'Zero' if num.zero?

  w0 = [''   , 'One'     , 'Two'    , 'Three'   , 'Four'    , 'Five'   , 'Six'    , 'Seven'    , 'Eight'   , 'Nine']
  w1 = ['Ten', 'Eleven'  , 'Twelve' , 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen']
  w2 = [''   , ''        , 'Twenty' , 'Thirty'  , 'Forty'   , 'Fifty'  , 'Sixty'  , 'Seventy'  , 'Eighty'  , 'Ninety']
  w3 = [''   , 'Thousand', 'Million', 'Billion']

  str = []
  0.upto(3) do |i|
    num, rem = num.divmod(1000)
    next if rem.zero?

    s, (n, r) = [], rem.divmod(100)
    s << w0[n] << 'Hundred' if n.nonzero?
    case r
    when   0..9; s << w0[r]
    when 10..19; n, r = r.divmod(10); s << w1[r]
    when 20..99; n, r = r.divmod(10); s << w2[n] << w0[r]
    end
    s << w3[i]

    str = s.concat(str)
  end

  str.reject(&:empty?).join(' ')
end
