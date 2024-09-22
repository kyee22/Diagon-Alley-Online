# 作业2： case equality 调研

>   *   通过网上搜索资料，结合实际实验，给出 **case equality** 操作符的语义分析
>   *   用Markdown语法写一个文档
>       *   https://en.wikipedia.org/wiki/Markdown
>
>   *   文件名：`lab2.md`
>   *   提交到 git `main` 分枝根目录

$Author:\text{Yixuan Kuang}$

在 Ruby 语言中，`===`（Triple Equals）操作符通常被称为“Case Equality”或“三等号操作符”。这个操作符是Ruby中极为强大的特性之一，它在不同的上下文中表现出不同的行为，具体取决于其所在的类。虽然它被称为“等号操作符”，但它与传统的`==`操作符（用于比较值是否相等）有很大的不同。

## Case Equality 的语义

`===`操作符的主要作用是测试“成员关系”或“归属关系”。它通常用于检查某个值是否“属于”某个类、范围或模式。通过这样的语义，可以将其看作是一种“子集化操作符”（subsumption operator），而非传统的等值判断。

### Case 1：在类中使用`===`

在类中，`===`的作用相当于`is_a?`方法，用于判断一个对象是否是某个类的实例。例如：

```ruby
String === "hello" # => true
"hello".is_a?(String) # => true
```

在这里，`===`操作符相当于问“`hello`是否是`String`类的一个成员？”

### Case 2：在正则表达式中使用`===`

在正则表达式（Regexp）中，`===`操作符的作用类似于匹配操作符，用于检查某个字符串是否匹配给定的正则表达式：

```ruby
/hello/ === "hello world" # => true
```

这一语法实际上在`case`语句中广泛应用。在`case`语句中，当`when`分支中的条件被`===`操作符满足时，执行相应的代码。例如：

```ruby
case "hello world"
when /hello/
  puts "Matched!"
end
```

等价于：

```ruby
if /hello/ === "hello world"
  puts "Matched!"
end
```

### Case 3：在范围（Range）中使用`===`

在范围对象（Range）中，`===`操作符的作用类似于`include?`，用于判断一个值是否属于某个范围。例如：

```ruby
(1..10) === 5 # => true
```

这等价于：

```ruby
(1..10).include?(5) # => true
```

### Case 4：在`case`语句中使用`===`

`===`操作符的一个最常见的应用场景是在`case`语句中。它用于判断给定的值是否匹配`when`分支中的条件。在Ruby的`case`语句中，`when`条件实际上是通过`===`操作符来进行比较的。例如：

```ruby
case 5
when 1..10
  puts "In the range!"
end
```

相当于：

```ruby
if (1..10) === 5
  puts "In the range!"
end
```

### Case 5：函数与闭包

在Ruby中，匿名函数（例如Proc和Lambda）也实现了`===`操作符，允许函数本身成为`case`语句中的条件。例如：

```
ruby复制代码is_even = ->(x) { x.even? }

case 4
when is_even
  puts "Even number!"
end
```

在这种情况下，`===`操作符允许我们测试一个值是否在某个函数的有效输入范围（即域）内。这种用法在函数式编程中非常有用。

## TODO

*(TBD)*

## Reference

1.   https://stackoverflow.com/a/3422349

2.   https://dev.to/baweaver/understanding-ruby-triple-equals-2p9c