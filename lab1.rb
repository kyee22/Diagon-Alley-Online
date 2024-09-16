##############################################################
##     Ruby Programming @ Beihang University, Fall 2024     ##
##                Lab1 by Yixuan Kuang                      ##
##############################################################


def mfp(m)
  # Helper function #1:
  def product_of_digits(num)
    return num.digits.reject(&:zero?).reduce(&:*)
  end

  # Helper function #2:
  def max_prime_factor(num)
    # Special Case: there is no max prime factor for integer 1
    return 1 if num == 1

    # General Cases
    factor = 2
    num % factor == 0 ? num /= factor : factor += 1 while factor < num
    factor
  end

  # calculate sum: version 1
  # sum = 0
  # 1.upto(m) {|x| sum = sum + product_digit(x)}

  # calculate sum: version 2
  sum = (1..m).sum{|x| product_of_digits(x)}
  max_prime_factor(sum)
end

# puts mfp(9999)
# puts mfp(1), mfp(2), mfp(9999), mfp(10000)