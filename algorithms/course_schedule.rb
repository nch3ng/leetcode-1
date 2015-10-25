# https://leetcode.com/problems/course-schedule/
#
# There are a total of n courses you have to take, labeled from 0 to n - 1.
# Some courses may have prerequisites, for example to take course 0 you have
# to first take course 1, which is expressed as a pair: [0, 1]. Given the total
# number of courses and a list of prerequisite pairs, is it possible for you
# to finish all courses?
#
# For example:
#
#     2, [[1, 0]]
#
# There are a total of 2 courses to take. To take course 1 you should have
# finished course 0. So it is possible.
#
#     2, [[1, 0], [0, 1]]
#
# There are a total of 2 courses to take. To take course 1 you should have
# finished course 0, and to take course 0 you should also have finished course
# 1. So it is impossible.
#
# Note: The input prerequisites is a graph represented by a list of edges, not
# adjacency matrices.


# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  indegrees = Array.new(num_courses, 0)
  prerequisites.each do |prerequisite|
    indegrees[prerequisite[0]] += 1
  end

  courses = []
  indegrees.each_with_index do |indegree, course|
    courses << course if indegree.zero?
  end

  until courses.empty?
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

  prerequisites.empty?
end
