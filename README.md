# Readme

tool for AtCoder / my answers

tool = makeDir.sh & getTestCase.sh

## makeDir.sh

make directory from problem URL

ex1) from https://atcoder.jp/contests/abc155/tasks/abc155_b
-> [b155\_abc]

ex2) from https://atcoder.jp/contests/agc040/tasks/agc040_a
-> [a040\_agc] 

## getTestCase.sh

generate all testcase in problem page.

if Output is just one line, rename Input filename with Output.

ex1) from https://atcoder.jp/contests/abc155/tasks/abc155_b
-> 1inout\_APPROVED / 2inout\_DENIED

ex2) from https://atcoder.jp/contests/abc155/tasks/abc155_c ,
-> 1in ,1out / 2inout\_buffalo / 3inout\_kick / 4in, 4out


# usecase

### 1. makedir

$ sh makeDir.sh "URL"


### 2. make testcase
$ (cd problemURL dir)

$ sh getTestCase.sh

### 3. run main.sh with testcase

$ sh main.sh < 1in

$ diff <(sh main < 1in) <(cat 1out)


# example

```
$ sh makeDir.sh https://atcoder.jp/contests/abc155/tasks/abc155_b
[DONE] b155_abc generated.
$ cd b155_abc/
$ sh getTestCase.sh
$ ls
1inout_APPROVED  2inout_DENIED  getTestCase.sh  problemURL
```
