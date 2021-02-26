
# Domain eXtensions for Dyalog APL.

## Installation

In your APL REPL, run
```
)load /path/to/dx
```
.. to load the `dx` workspace.

## Usage

Use the operator `dx` to extend the domain of any monadic or dyadic function.

```
      {~⍵} 2 3 4 0
DOMAIN ERROR
      {~⍵}2 3 4 0
       ∧
      {~⍵}dx 2 3 4 0
0 0 0 1
```

## Features

TODO
