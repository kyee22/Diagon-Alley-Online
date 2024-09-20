# 作业2： case equality 调研

>   *   通过网上搜索资料，结合实际实验，给出 **case equality** 操作符的语义分析
>   *   用Markdown语法写一个文档
>       *   https://en.wikipedia.org/wiki/Markdown
>
>   *   文件名：`lab2.md`
>   *   提交到 git `main` 分枝根目录

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