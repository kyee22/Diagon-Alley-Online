require 'prime'

def mfp(m)
  product_of_sum = (1..m).map { |i|
    i.to_s.chars.map(&:to_i).select(&:nonzero?).inject(:*)
  }.sum

  product_of_sum.prime_division.map(&:first).max || 1
end