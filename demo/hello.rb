# frozen_string_literal: true

a = "hello, world"

3.times {puts a}

elems = [0, "", nil, false]

for elem in elems
  puts elem
  if elem then
    puts " is true"
  else
    puts " is false"
  end
end


def double(x)
  return x * 2
end

for i in 1..10
  puts double(i)
end