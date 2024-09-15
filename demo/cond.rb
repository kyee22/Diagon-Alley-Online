x = 5
if x > 5 then
  puts "x>5"
else
  puts "x<=5"
end


x = 5
if x > 5 then
  puts "x>5"
elsif x > 0
  puts "0<x<=5"
else
  puts "x<=0"
end

x = false
if x then
  puts "a"
else
  puts "b"
end


x = 0
if x then
  puts "a"
else
  puts "b"
end


x = nil
if x then
  puts "a"
else
  puts "b"
end

x = ""
if x then
  puts "a"
else
  puts "b"
end


my_status = "happy"
puts "hello world" if my_status == "happy"

my_status = "happy"
puts "hello world" unless my_status != "happy"

score = 70
result = case score
         when 0..40 then "Fail"
         when 41..60 then "Pass"
         when 61..70 then "Pass with Merit"
         when 71..100 then "Pass with Distinction" 	else "Invalid Score"
end
puts result

