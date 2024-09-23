# 作业2： case equality 调研

>   *   通过网上搜索资料，结合实际实验，给出 **case equality** 操作符的语义分析
>   *   用Markdown语法写一个文档
>       *   https://en.wikipedia.org/wiki/Markdown
>
>   *   文件名：`lab2.md`
>   *   提交到 git `main` 分枝根目录

>   $Author:\text{Yixuan Kuang}$

在 Ruby 语言中，`===` 叫做 *case equality operator*, *triple equals operator* 或者 *threequals operator*。虽然它的名称带有“equality”，但它与传统的 `==` 操作符（用于比较值是否相等）又有很大的不同。

更贴切的讲，`===` 是一种 ***case subsumption operator***，即测试“成员关系”或“归属关系”的操作符。它在不同的上下文中表现出不同的行为，具体取决于其所在的类。

## Case Equality 在不同类的语义

### `range`s

在 range 对象中，**`===` 相当于 `include?` 方法**，用于判断一个值是否属于某个范围。例如：

```ruby
irb(main):007:0> (1..10) === 5
=> true
```

这等价于：

```ruby
irb(main):008:0> (1..10).include? 5
=> true
```

### Classes

在类中，**`===`的作用相当于`is_a?`方法**，用于判断一个对象是否是某个类的实例。例如：

```ruby
irb(main):001:0> Integer === 1
=> true
irb(main):002:0> Integer === 1.0
=> false
irb(main):003:0> String === "123"
=> true
irb(main):004:0> String === 123
=> false
irb(main):005:0> String === 123.0
=> false
irb(main):006:0> String === /message/
=> false
```

这等价于：

```ruby
irb(main):010:0> 1.is_a? Integer
=> true
irb(main):011:0> 1.0.is_a? Integer
=> false
irb(main):012:0> "123".is_a? String
=> true
irb(main):013:0> 123.is_a? String
=> false
irb(main):014:0> 123.0.is_a? String
=> false
irb(main):015:0> /message/.is_a? String
=> false
```

### Regular Expressions

在正则表达式中，**`===` 的作用相当于 `match?`**，用于检查某个字符串是否匹配给定的正则表达式：

```ruby
# 匹配 (1) 0, 或者 (2) 不带前导0的无符号整数
irb(main):022:0> /\A0\z|\A[1-9][0-9]*\z/ === "0123"
=> false
irb(main):023:0> /\A0\z|\A[1-9][0-9]*\z/ === "123"
=> true
irb(main):024:0> /\A0\z|\A[1-9][0-9]*\z/ === "0"
=> true
```

这等价于：

```ruby
irb(main):026:0> /\A0\z|\A[1-9][0-9]*\z/.match? "0123"
=> false
irb(main):027:0> /\A0\z|\A[1-9][0-9]*\z/.match? "123"
=> true
irb(main):028:0> /\A0\z|\A[1-9][0-9]*\z/.match? "0"
=> true
```

### Functions (Proc and Lambda)

Ruby 通过 Proc 和 Lambda 等支持了匿名函数，对于它们来说，**`===` 相当于  `call` 方法 （或 `[]` 或 `.()` ）**。例如：

```ruby
irb(main):029:0> divided_by_3 = proc {|x| x % 3 == 0}
irb(main):030:0> divided_by_3 === 27
=> true
irb(main):031:0> divided_by_3[28]
=> false
irb(main):032:0> divided_by_3.(29)
=> false
irb(main):033:0> divided_by_3 === 30
=> true
```

## Case Equality 的显式与隐式使用

尽管在上一节中我们提到在了 `===` 在不同类中有其等价的方法，但是在实际应用中，我们应该更清楚地使用那些方法，而不是显示地使用 `===`。

`===` 的重要作用在于其的隐式使用。在 `case` 语句的 `when` 分支，就隐式使用了 `===` 来实现条件判断。

比如：

*   例子 1：通过 `===` 的隐式使用来判断所属区间

    ```ruby
    case 1990
    when ..1899     then :too_early
    when 1900..1924 then :gi
    when 1925..1945 then :silent
    when 1946..1964 then :baby_boomers
    when 1965..1979 then :generation_x
    when 1980..2000 then :millenials
    when 2000..2010 then :generation_z
    when 2010..     then :generation_alpha
    else
      :who_knows
    end
    # => :millenials
    ```

*   例子 2：可以使用 `,` 来实现多条件匹配

    ```ruby
    case 'foobar'
    when String, Integer then :one
    when Float, NilClass then :two
    else
      :three
    end
    # => :one
    ```

*   例子 3：利用函数闭包 / 高阶函数和 `===` 语义（`call`）的隐式使用，来判断一个数能否被某些数字整除

    ```ruby
    divisible_by = -> divisor { -> n { n % divisor == 0 } }
    
    (1..15).map do |n|
      case n
      when divisible_by[15] then :fizzbuzz
      when divisible_by[5]  then :buzz
      when divisible_by[3]  then :fizz
      else
        n
      end
    end
    # => [
    #   1, 2, :fizz, 4, :buzz, :fizz, 7, 8, :fizz, :buzz,
    #   11, :fizz, 13, 14, :fizzbuzz
    # ]
    ```

## Summary  / Take-away Message

*   `===`  操作符在 Ruby 中用于测试“归属关系”，在不同类中表现出不同的行为。
*   相较于显式使用，`===` 操作符的核心用途在于通过隐式使用来简化 `case` 语句的条件判断
*   在 `when` 分支中，它隐式调用，自动比较表达式与分支条件的归属关系。通过这种方式，`case` 语句不仅能处理简单的相等性判断，还能利用 `Range`、`Class`、`Regexp`、`Proc` 等类的 `===` 实现，完成区间判断、类型检查、正则匹配和函数调用等复杂逻辑，从而简洁高效地进行多条件匹配。

## Reference

1.   https://stackoverflow.com/a/3422349

2.   https://dev.to/baweaver/understanding-ruby-triple-equals-2p9c