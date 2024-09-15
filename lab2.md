# Lab 2: Case equality operator `===` in Ruby

$Author:\text{Yixuan Kuang}$



```ruby
irb(main):011:-> divided_by_3 = -> x {x % 3 == 0}
irb(main):012:0> divided_by_3 === 27
=> true
irb(main):013:0> divided_by_3 === 28
=> false
```





## Reference

1.   https://stackoverflow.com/a/3422349

2.   https://dev.to/baweaver/understanding-ruby-triple-equals-2p9c