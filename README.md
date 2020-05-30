# Readme

tool for AtCoder / my answers

tool = makeDir.sh & getTestCase.sh

## makeDir.sh

make directory from problem URL

ex1) makeDir.sh https://atcoder.jp/contests/abc155/tasks/abc155_b
-> generate [b155\_abc]

ex2) makeDir.sh https://atcoder.jp/contests/agc040/tasks/agc040_a
-> generate [a040\_agc] 

## getTestCase.sh

generate all testcase in problem webpage.

if Output is just one line, rename Input filename with Output.

ex1) getTestCase.sh [b155\_abc], problemURL=https://atcoder.jp/contests/abc155/tasks/abc155_b
-> 1inout\_APPROVED / 2inout\_DENIED

ex2) getTestCase.sh [c155\_abc], problemURL=https://atcoder.jp/contests/abc155/tasks/abc155_c 
-> 1in ,1out / 2inout\_buffalo / 3inout\_kick / 4in, 4out


# usecase


### make problem Dir/get testcase
$ sh makeDir.sh "URL" 

### answer check

$ sh main.sh < 1in

$ diff <(sh main < 1in) <(cat 1out)


# example

```
$ sh makeDir.sh https://atcoder.jp/contests/abc155/tasks/abc155_b
[DONE] b155_abc generated.
[DONE] TestCase generated.

$ ls b155_abc/
1inout_APPROVED  2inout_DENIED  problemURL


```
