def main
  n = gets.to_i
  data = Array.new(n) { gets.split.map(&:to_f) }

  theta = 0.0

  30.times do
    h = m = 0.0
    data.each do |x, y, x_prime, y_prime|
      s, c = Math.sin(theta), Math.cos(theta)
      h += (s * x + c * y)**2 + (-c * x + s * y)**2
      m -= (s * x + c * y) * (x_prime - (c * x - s * y)) + (-c * x + s * y) * (y_prime - (s * x + c * y))
    end
    theta += m / h if h != 0
  end

  puts '%.2f' % theta
end

main()