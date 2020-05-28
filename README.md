# Readme

## makeDir.sh

from problem URL, make dir

ex1) from https://atcoder.jp/contests/abc155/tasks/abc155\_b , make [b155\_abc]
ex2) from https://atcoder.jp/contests/agc040/tasks/agc040\_a , make [a040\_agc]

## getTestCase.sh

with problemURL file, generate all testcase in problem page.

if Output is just one line, set Output for Input filename.

ex1) from https://atcoder.jp/contests/abc155/tasks/abc155\_b , make 1inout\_APPROVED / 2inout\_DENIED
ex2) from https://atcoder.jp/contests/abc155/tasks/abc155\_c , make 1in ,1out / 2inout\_buffalo / 3inout\_kick / 4in, 4out


# usecase

### 1. makedir

$ sh makeDir.sh "URL"


### 2. make testcase
$ (cd problemURL dir)
$ sh getTestCase.sh

### 3. run main.sh with testcase

$ sh main.sh < 1in

$ diff <(sh main < 1in) <(cat 1out)
