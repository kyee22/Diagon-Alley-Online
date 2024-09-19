# 作业3：二进制中的 1

## Statement

编写一个程序，对给的一个正整数 $n$，输出其二进制有多少个 $1$。
写一个尽量简短的Ruby程序实现解决上述问题，方法定义格式如下：

```ruby
def count_ones(n)
    ...
end
```

**约束：**

*   $1\leq n\leq 1000000$，$2$ 秒内执行完毕

**提交要求：**

*   文件名 `lab3.rb`（文件中仅包含上述方法定义，不含方法定义以外的其它代码），用git提交到main分枝（默认分枝）根目录

**一些测试用例：**

*   `count_ones(100) = 3
    count_ones(1234567890) = 12`



## Local Test

利用 Python 的 `pytest` 测试框架来构建本地的单元测试。运行公开的部分样例，测试结果如下

```bash
arren22@Ashitaka:~/BUAA_Ruby$ pytest test_lab3.py 
=============================== test session starts ===============================
platform linux -- Python 3.9.5, pytest-8.3.2, pluggy-1.5.0
rootdir: /home/arren22/BUAA_Ruby
collected 2 items                                                                                                                                                                   

test_lab3.py ..                                                                                                                                                               [100%]

=============================== 2 passed in 0.17s ===============================

```

