##
# This collection of methods takes a space-separated list of socks and groups,
# pairs, and counts them. If you just want to know how many pairs of each kind
# you have from an input string, simply call:
#
#   > to_s_from_input('white pink pink white pink white checkered checkered')
#  => 'white: 1 pair, pink: 1 pair, checkered: 1 pair'

def list(sock_list_string)
  sock_list_string.split(' ')
end

def groups(sock_list)
  {}.tap do |groups|
    sock_list.map do |sock|
      groups[sock] ||= 0
      groups[sock] += 1
    end
  end
end

def pairs(groups)
  {}.tap do |pairs|
    groups.each do |sock, count|
      pairs[sock] = count / 2
    end
  end
end

def to_s_from_pairs(pairs)
  pair_str = pairs
    .select{|sock, pair_count| pair_count > 0 }
    .map{|sock, pair_count| "#{sock}: #{pair_count} pair" }
    .join(', ')

  pair_str.empty? ? 'No pairs' : pair_str
end

def to_s_from_input(input)
  to_s_from_pairs(
    pairs(
      groups(
        list(input)
      )
    )
  )
end
