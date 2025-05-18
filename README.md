# Kattis kickstart

Automate repetetive parts of solving Kattis problems.

## Features

- Create a folder for your solution
- Download and unzip sample inputs and answers
- Optionally copy in a template code file of your choice

## Details

Note that there are 3 hard coded configuration values in the top of the main file.

The script is written in [Amber](https://amber-lang.com/), which transpiles to bash.

## Running

Execute : `$ amber kickstart.ab`. You will then be prompted for the problem **keyword** and which **template** you want to use

### Example of running

```
$ amber kickstart.ab

*** Kattis kickstart ***
Problem code name: >99problems2
Ok, will initialize 99problems2.
Downloading samples..
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   427    0   427    0     0   2053      0 --:--:-- --:--:-- --:--:--  2062
Done..
Unzipping..
Archive:  99problems2/samples.zip
  inflating: 99problems2/1.in
  inflating: 99problems2/1.ans
  inflating: 99problems2/2.in
  inflating: 99problems2/2.ans
Done..
Your detected templates are ../akademika/elyse/kattis/cpp.cpp ../akademika/elyse/kattis/go.go
Which template? >go
OK, using template ../akademika/elyse/kattis/go.go
Opening editor.
```
