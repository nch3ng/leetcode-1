# https://leetcode.com/problems/repeated-dna-sequences/
#
# All DNA is composed of a series of nucleotides abbreviated as A, C, G, and T,
# for example: "ACGAATTCCG". When studying DNA, it is sometimes useful to
# identify repeated sequences within the DNA.
#
# Write a function to find all the 10-letter-long sequences (substrings) that
# occur more than once in a DNA molecule.
#
# For example:
#
#     Given s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT",
#     Return ["AAAAACCCCC", "CCCCCAAAAA"].


# @param {String} s
# @return {String[]}
def find_repeated_dna_sequences(s)
  map, result = {}, []

  0.upto(s.size - 10) do |idx|
    substr = s.slice(idx, 10)
    result << substr if map[substr]

    map[substr] = true
  end

  result.uniq
end
