# https://leetcode.com/problems/expression-add-operators/
#
# Given a string that contains only digits 0-9 and a target value, return
# all possibilities to add binary operators (not unary) +, -, or * between
# the digits so they evaluate to the target value.
#
# Examples:
#
#     "123", 6 -> ["1+2+3", "1*2*3"]
#     "232", 8 -> ["2*3+2", "2+3*2"]
#     "105", 5 -> ["1*0+5","10-5"]
#     "00" , 0 -> ["0+0", "0-0", "0*0"]
#     "3456237490", 9191 -> []


# @param {String} num
# @param {Integer} target
# @return {String[]}
def add_operators(num, target)
  return [] if num.empty?

  map = Array(0...num.size).each_with_object({}) do |spt, memo|
    subnum = num.slice(spt...num.size)

    if subnum[0] == '0'
      memo[subnum] = [[0, subnum.slice(1..-1)]]
    else
      memo[subnum] = Array(1..subnum.size).map do |subspt|
        [subnum.slice(0...subspt).to_i, subnum.slice(subspt..-1)]
      end
    end
  end

  q, out = [[[nil], num, '']], []
  until q.empty?
    deque, istream, ostream = q.shift

    map[istream].each do |next_num, next_istream|
      if next_istream.empty?
        _calculate_(deque, next_num, :+)
        out << "#{ostream}#{next_num}" if deque[-1] == target
      else
        [:+, :-, :*].each do |next_op|
          de = deque.dup; _calculate_(de, next_num, next_op)
          q << [de, next_istream, "#{ostream}#{next_num}#{next_op}"]
        end
      end
    end
  end

  out
end

private def _calculate_(deque, next_num, next_op)
  deque.push(next_num)

  case next_op
  when :+, :-
    while true
      case deque[0]
      when nil; break
      when :+; deque.push(deque.pop + deque.pop)
      when :-; deque.push(- deque.pop + deque.pop)
      when :*; deque.push(deque.pop * deque.pop)
      end
      deque.shift
    end
    deque.unshift(next_op)
  when :*
    if deque[0] == :*
      deque.shift
      deque.push(deque.pop * deque.pop)
    end
    deque.unshift(next_op)
  end
end
