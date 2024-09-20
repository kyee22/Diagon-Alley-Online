# 作业 1

## Statement

对正整数 $n$，用 $p(n)$ 表示 $n$ 的各位非 $0$ 数字的乘积，如果 $n$ 是个位数，则 $p(n)=n$。例如：$p(1)=1, p(100)=1, p(123)=6$。给定 $m$，求 $p(1)+p(2)+\cdots+p(m)$ 的最大质因数，如果不存在最大质因数，则返回 $1$。

写一个尽量简短的 Ruby 程序实现解决上述问题，方法定义格式如下：

```ruby
def mfp(m)
  ...
end
```

**约束：**

*   $1\leq m \leq 1000000$，$2$ 秒内执行完毕

**提交要求：**

*   文件名 `lab1.rb`（文件中仅包含上述方法定义，不含方法定义以外的其它代码），用 git 提交到main分枝（默认分枝）根目录

**一些测试用例：**

*   `mfp(1) = 1`
*   `mfp(9999) = 73`
*   `mfp(10000) = 23`

**本次作业 deadline 为第 3 次课上课前（ 9 月 16 日）**



## Local Test

利用 Python 的 `pytest` 测试框架来构建本地的单元测试。运行公开的部分样例，测试结果如下

```bash
$ pytest test_lab1.py 
==================== test session starts ====================
platform linux -- Python 3.9.5, pytest-8.3.2, pluggy-1.5.0
rootdir: /home/arren22/BUAA_Ruby
collected 4 items                                                                                                                                                                   

test_lab1.py ....                                                                                                                                    [100%]

==================== 4 passed in 0.15s ====================
```

