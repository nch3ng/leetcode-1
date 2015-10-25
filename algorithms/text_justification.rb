# https://leetcode.com/problems/text-justification/
#
# Given an array of words and a length L, format the text such that each
# line has exactly L characters and is fully (left and right) justified.
# You should pack your words in a greedy approach; that is, pack as many
# words as you can in each line. Pad extra spaces ' ' when necessary so
# that each line has exactly L characters. Extra spaces between words
# should be distributed as evenly as possible. If the number of spaces
# on a line do not divide evenly between words, the empty slots on the
# left will be assigned more spaces than the slots on the right. For the
# last line of text, it should be left justified and no extra space is
# inserted between words.
#
# For example:
#
#     words: ["This", "is", "an", "example", "of", "text", "justification."]
#     L: 16.
#
# Return the formatted lines as:
#
#     [
#       "This    is    an",
#       "example  of text",
#       "justification.  "
#     ]
#
# Note: Each word is guaranteed not to exceed L in length.


# @param {String[]} words
# @param {Integer} max_width
# @return {String[]}
def full_justify(words, max_width)
  output = []

  line, width = [], 0
  words.each do |word|
    if width + word.size > max_width
      if line.size == 1
        output << sprintf("%-#{max_width}s", line.join(' '))
      else
        spacescount, lwcount =
          (max_width - line.map(&:size).reduce(&:+)).divmod(line.size - 1)
        spaces = ' ' * spacescount

        if lwcount.zero?
          output << line.join(spaces)
        else
          output << line[0...lwcount].join(spaces + ' ') + spaces + ' ' +
                    line[lwcount..-1].join(spaces)
        end
      end

      line, width = [], 0
    end

    line  << word
    width += word.size + 1
  end
  output << sprintf("%-#{max_width}s", line.join(' '))

  output
end
