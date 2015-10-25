# https://leetcode.com/problems/climbing-stairs/
#
# You are climbing a stair case. It takes n steps to reach to the top. Each
# time you can either climb 1 or 2 steps. In how many distinct ways can you
# climb to the top?


# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  return 1 if n == 0 || n == 1

  n, v1, v2, v3 = n - 1, 1, 1, nil
  n.times do
    v3 = v1 + v2
    v1 = v2
    v2 = v3
  end
  v3
end
