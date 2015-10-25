# https://leetcode.com/problems/simplify-path/
#
# Given an absolute path for a file (Unix-style), simplify it.
#
# For example:
#
#     path = "/home/", => "/home"
#     path = "/a/./b/../../c/", => "/c"


# @param {String} path
# @return {String}
def simplify_path(path)
  s = []

  path.split('/').each do |e|
    case e
    when ''   ; nil
    when '.'  ; nil
    when '..' ; s.pop
    else      ; s.push(e)
    end
  end

  "/#{s.join('/')}"
end
