##############################################################
##     Ruby Programming @ Beihang University, Fall 2024     ##
##              · Lab1 by Yixuan Kuang ·                    ##
##############################################################

# @param [Integer] num: a positive integer
# @return [Ineger] product of non-zero digits
def product_digit(num)
  product = 1
  while num > 0
    digit = num % 10
    if digit != 0 then
      product *= digit
    end
    num /= 10
  end
  return product
end

# @param [Integer] num: a positive integer
# @return [Boolean] whether num is a prime
def is_prime(num)
  if num == 1 then return false end

  i = 2
  while i * i <= num
    if num % i == 0
      return false
    end
    i += 1
  end

  return true
end


def max_prime_factor(num)
  # Special Case: there is no max prime factor for integer 1
  if num == 1 then return 1 end

  # General Cases
  factor = 2
  while factor < num
    num % factor == 0 ? num /= factor : factor = factor + 1
  end

  return num
end

def mfp(m)
  # calculate sum: version 1
  # sum = 0
  # 1.upto(m) {|x| sum = sum + product_digit(x)}

  # calculate sum: version 2
  sum = (1..m).sum{|x| product_digit(x)}
  return max_prime_factor(sum)
end

# puts mfp(1), mfp(2), mfp(9999), mfp(10000)