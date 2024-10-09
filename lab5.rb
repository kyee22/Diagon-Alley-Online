##############################################################
##     Ruby Programming @ Beihang University, Fall 2024     ##
##                Lab5 by Yixuan Kuang                      ##
##############################################################

keys, values = gets().split(" "), gets().split(" ")
hash = Hash.new(0)
keys.each_with_index {|key, index| hash[key] = values[index]}
puts hash.to_s

# keys = gets().split(" ")
# values = gets.split(" ")
# hash = Hash[keys.zip(values)]
# puts hash.inspect



# def twice
#   yield("Yixuan")
#   yield("Yixuan")
# end
#
#
# twice {|x| puts "hello, this is #{x}"}
#
# def check_class(&p)
#   puts p.class
#   p.call
#   yield
# end
#
# # Example 1
# def is_prime(n)
#   (n.instance_of?(Integer) && n > 1) ? (2..Math.sqrt(n)).all? {|x| n % x > 0} : false
# end
#
#
# [10,"2024", 0, 1, 2, 3, 4, 5, 997, 2023].each{|x| puts is_prime(x) ? "#{x} is prime!\n" : "#{x} is not prime!\n" }
#
#
# # Example
# def qsort(lst)
#   (p = lst.pop) ? qsort(lst.select{|x| x <= p}) + [p] + qsort(lst.select{|x| x > p}) : []
# end
#
# a = [2, 0, 2, 4, 2, 2, 3, 7, 1, 0, 9, 2]
# puts a.inject(Hash.new(0)) {|hash, x| hash[x] += 1; hash}.inspect
#
#
# check_class {puts "hello, this is Yixuan Kuang!"}
#
# puts qsort([42, 7, 5, 19, 88, 5, 62, 14, 91, 33, 75, 91]).inspect
