##############################################################
##     Ruby Programming @ Beihang University, Fall 2024     ##
##                Lab4 by Yixuan Kuang                      ##
##############################################################

# Version #1: using dp (much quicker than Version #2)
def decode_ways(code)
  # prepare data structures
  dp = []
  text = code.to_s

  # gracefully deal with base case #0
  dp[0] = text[0] > "0" ? 1 : 0
  return dp[0] if text.size == 1

  # gracefully deal with base case #1
  dp[1] = (text[1] > "0" ? dp[0] : 0) + ("10" <= text[0..1] && text[0..1] <= "26" ? 1 : 0)
  return dp[1] if text.size == 2

  # handle general cases for i >= 2:
  # dp[i] is the # of ways to decode the substring from 0 to i. For each i, check:
  #   1. If text[0..i] could be decoded by text[0..i-2] (solved sub-problem) and text[i-1..i]
  #   2. If text[0..i] could be decoded by text[0..i-1] (solved sub-problem) and text[i]
  2.upto(text.size - 1) do |i|
    dp[i] = ("10" <= text[i-1..i] && text[i-1..i] <= "26" ? dp[i-2] : 0) + (text[i] > "0" ? dp[i-1] : 0)
  end
  return dp[text.size - 1]
end

# Version #2: TLE when code.length grows longer
# def decode_ways(code)
#   def do_decode(text)
#     return 1 if text == ""
#     return 0 if text[0] == "0"
#     return do_decode(text[1..]) if text[0] >= "3"
#
#     if text[0] == "1"
#       if text.size >= 2
#         return do_decode(text[1..]) + do_decode(text[2..])
#       end
#       return do_decode(text[1..])
#     end
#
#     if text[0] == "2"
#       if text.size >= 2 && text[1] <= "6"
#         return do_decode(text[1..]) + do_decode(text[2..])
#       end
#       return do_decode(text[1..])
#     end
#   end
#
#   return do_decode(code.to_s)
# end

# puts decode_ways(121)
# puts decode_ways(121212)
# puts decode_ways(111111111111111111111111111111111111111111111)
