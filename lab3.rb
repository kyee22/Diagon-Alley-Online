##############################################################
##     Ruby Programming @ Beihang University, Fall 2024     ##
##                Lab3 by Yixuan Kuang                      ##
##############################################################


# @param n: a positive integer
# @return count of '1' in binary representation of `n`
def count_ones(n)
  # Version 1:
  # binary_rep_lst = n.to_s(2).chars
  # binary_rep_lst.delete("0")
  # return binary_rep_lst.size

  # Version 2
  return n.to_s(2).chars.count("1")
end
