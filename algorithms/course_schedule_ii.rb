# https://leetcode.com/problems/course-schedule-ii/
#
# There are a total of n courses you have to take, labeled from 0 to n - 1.
# Some courses may have prerequisites, for example to take course 0 you have
# to first take course 1, which is expressed as a pair: [0, 1]. Given the total
# number of courses and a list of prerequisite pairs, return the ordering of
# courses you should take to finish all courses.
#
# There may be multiple correct orders, you just need to return one of them.
# If it is impossible to finish all courses, return an empty array.
#
# For example:
#
#     2, [[1, 0]]
#
# There are a total of 2 courses to take. To take course 1 you should have
# finished course 0. So the correct course order is [0, 1]
#
#     4, [[1, 0], [2, 0], [3, 1], [3, 2]]
#
# There are a total of 4 courses to take. To take course 3 you should have
# finished both courses 1 and 2. Both courses 1 and 2 should be taken after
# you finished course 0. So one correct course order is [0, 1, 2, 3]. Another
# correct ordering is [0, 2, 1, 3].
#
# Note: The input prerequisites is a graph represented by a list of edges, not
# adjacency matrices.


# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def find_order(num_courses, prerequisites)
  indegrees = Array.new(num_courses, 0)
  prerequisites.each do |prerequisite|
    indegrees[prerequisite[0]] += 1
  end

  courses = []
  indegrees.each_with_index do |indegree, course|
    courses << course if indegree.zero?
  end

  result = []
  until courses.empty?
    result.concat(courses)

    newcourses = []
    prerequisites = prerequisites.reject do |prerequisite|
      to, fr = prerequisite
      if courses.include?(fr)
        indegrees[to] -= 1
        newcourses << to if indegrees[to].zero?
        true
      end
    end
    courses = newcourses
  end

  prerequisites.empty? ? result : []
end
