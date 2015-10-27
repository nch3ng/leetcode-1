# https://leetcode.com/problems/the-skyline-problem/
#
# A city's skyline is the outer contour of the silhouette formed by all the
# buildings in that city when viewed from a distance. Now suppose you are
# given the locations and height of all the buildings as shown on a cityscape
# photo (Figure A), write a program to output the skyline formed by these
# buildings collectively (Figure B).
#
#     ^                                        ^
#     |                                        |
#     |    +---+                               |    O---+
#     |    |   |                               |    |   |
#     |    |   |                               |    |   |
#     |    |   +------+                        |    |   O------+
#     |    |   |      |                        |    |          |
#     |  +-+------+   |   +------+             |  O-+          |   O------+
#     |  |        |   |   |      |             |  |            |   |      |
#     |  |        |   |   |     ++-----+       |  |            |   |      O-----+
#     |  |        |   |   |     |      |       |  |            |   |            |
#     |  |        |   |   |     |      |       |  |            |   |            |
#     |  |        |   |   |     |      |       |  |            |   |            |
#     |  |        |   |   |     |      |       |  |            |   |            |
#     |  |        |   |   |     |      |       |  |            |   |            |
#     |  |        |   |   |     |      |       |  |            |   |            |
#     |  |        |   |   |     |      |       |  |            |   |            |
#     +--+--------+---+---+-----+------+-->    +--+------------O---+------------O-->
#                 Figure A                                 Figure B
#
# The geometric information of each building is represented by a triplet of
# integers [Li, Ri, Hi], where Li and Ri are the x coordinates of the left and
# right edge of the ith building, respectively, and Hi is its height. It is
# guaranteed that 0 <= Li, Ri <= INT_MAX, 0 < Hi <= INT_MAX, and Ri - Li > 0.
# You may assume all buildings are perfect rectangles grounded on an absolutely
# flat surface at height 0.
#
# For instance, the dimensions of all buildings in Figure A are recorded as:
#
#     [[2 9 10], [3 7 15], [5 12 12], [15 20 10], [19 24 8]]
#
# The output is a list of "key points" (red dots in Figure B) in the format of
# [[x1, y1], [x2, y2], [x3, y3], ... ] that uniquely defines a skyline. A key
# point is the left endpoint of a horizontal line segment. Note that the last
# key point, where the rightmost building ends, is merely used to mark the
# termination of the skyline, and always has zero height. Also, the ground in
# between any two adjacent buildings should be considered part of the skyline
# contour.
#
# For instance, the skyline in Figure B should be represented as:
#
#     [[2 10], [3 15], [7 12], [12 0], [15 10], [20 8], [24 0]]
#
# Notes:
#
#     + The number of buildings in any input list is guaranteed to be in the
#       range [0, 10000].
#     + The input list is already sorted in ascending order by the left x
#       position Li.
#     + The output list must be sorted by the x position.
#     + There must be no consecutive horizontal lines of equal height in the
#       output skyline. For instance, [[2 3], [4 5], [7 5], [11 5], [12 7]]
#       is not acceptable; the three lines of height 5 should be merged into
#       one in the final output as such: [[2 3], [4 5], [12 7]]
#
# Credits:
#
#     Special thanks to @stellari for adding this problem, creating these
#     two awesome images and all test cases.


class PriorityQueue
  def initialize(cmp)
    @queue, @cmp = [], cmp
  end

  def <<(value)
    @queue << value; _swim_(@queue.size - 1); self
  end

  def shift
    @queue[0], @queue[-1] = @queue[-1], @queue[0]
    @queue.pop.tap { _sink_(0) }
  end

  def peek
    @queue[0]
  end

  private def _swim_(k)
    while k > 0 && @cmp.call(@queue[k], @queue[(k - 1) / 2])
      @queue[k], @queue[(k - 1) / 2] = @queue[(k - 1) / 2], @queue[k]
      k = (k - 1) / 2
    end
  end

  private def _sink_(k)
    while k * 2 + 1 < @queue.size
      kk  = k * 2 + 1
      kk += 1 if @queue[kk + 1] && @cmp.call(@queue[kk + 1], @queue[kk])
      break if @cmp.call(@queue[k], @queue[kk])

      @queue[k], @queue[kk] = @queue[kk], @queue[k]
      k = kk
    end
  end
end


# @param {Integer[][]} buildings
# @return {Integer[][]}
def get_skyline(buildings)
  maxpq = PriorityQueue.new(Proc.new{ |(_, h1), (_, h2)| h1 > h2 })
    out = []

   prev = 0
  maxpq << [Float::INFINITY, prev]

  buildings.each_with_object([]) do |(lbound, ubound, height), memo|
    memo << [lbound, -height, ubound] << [ubound, +height, ubound]
  end.sort.each do |bound, height, ubound|
    if height < 0
      maxpq << [ubound, -height]
    else
      maxpq.shift until maxpq.peek[0] > bound
    end

    curr = maxpq.peek[1]
    next if prev == curr

    out << [bound, curr]
    prev = curr
  end

  out
end
