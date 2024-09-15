=begin
this is mult-line comment!
this is mult-line comment!
this is mult-line comment!
=end

# Output "I love Ruby"
say = "I love Ruby"
puts say
puts "I don't love Ruby"

# Every statement has a return value
x = y = 1

# Everything is an Object
# a = b		# ERROR: b is not defined
a = nil
puts "a.nil?", a.nil?  # =>true
puts "nil.nil?", nil.nil? #=>true

a, b, c = 10, 20, 30
puts a,b,c

x = [10, 20]
puts "x: ", x

a, b, c = x
puts a, b, c