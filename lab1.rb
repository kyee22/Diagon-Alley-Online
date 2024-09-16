##############################################################
##     Ruby Programming @ Beihang University, Fall 2024     ##
##                Lab1 by Yixuan Kuang                      ##
##############################################################


def mfp(m)
  # Helper function #1:
  def product_digit(num)
    product = 1
    while num > 0
      digit = num % 10
      if digit != 0 then
        product *= digit
      end
      num /= 10
    end
    product
  end

  # Helper function #2:
  def max_prime_factor(num)
    # Special Case: there is no max prime factor for integer 1
    if num == 1 then return 1 end

    # General Cases
    factor = 2
    while factor < num
      num % factor == 0 ? num /= factor : factor = factor + 1
    end

    num
  end

  # calculate sum: version 1
  # sum = 0
  # 1.upto(m) {|x| sum = sum + product_digit(x)}

  # calculate sum: version 2
  sum = (1..m).sum{|x| product_digit(x)}
  max_prime_factor(sum)
end

# puts mfp(1), mfp(2), mfp(9999), mfp(10000)