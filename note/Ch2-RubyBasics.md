# 第二章：基本语法

$Ruby \text{ } Programming$



>**Exercise**
>
>*   用最少的语句，打印右图（右对齐）
>
>    ```
>    abcdefghijklmnopqrstuvwxyz
>    abcdefghijklmnopqrstuvwxy
>    abcdefghijklmnopqrstuvwx
>    ......
>    abc
>    ab
>    a
>    ```
>
>*   只用 1 条语句且不许包含分号



*   2 条语句：

    ```ruby
    s=('a'..'z').inject(:+);
    26.times{puts s; s.chop!}
    ```

*   1 条语句：

    ```ruby
    puts ('a'..'z').map{|x|('a'..x).inject(:+)}.reverse.join("\n")
    ```

    