
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

| Glyph | Extension                                                     |
| :---: | ------------------------------------------------------------- |
|  `~`  | Extended, behaves like `0=`                                   |
|  `⍭`  | New, `dfns.pco`                                               |
|  `√`  | New, `⍺`-th root (by default `⍺=2`)                           |
|  `<`  | Extended, monadic decrement.                                  |
|  `>`  | Extended, monadic increment.                                  |
|  `⍛`  | New, reverse compose.                                         |
|  `⍢`  | New, Round towards closest `⍺`, defaulting to `⍺=1`           |
|  `⍍`  | New, Matrix multiplication, identity matrix of size..         |
|  `…`  | New, Adam Brudzewsky's Range                                  |
|  `⍙`  | New, Iverson's monadic dot product (e.g. `-⍙×` - determinant) |
|  `∧`  | Extended, monadic sorts ascending                             |
|  `∨`  | Extended, monadic sorts descending                            |
|  `⍗`  | New, inverse a function                                       |
|  `⍐`  | New, iterate infintely                                        |
|  `𝑓`  | New, fibonacci numbers                                        |
|  `⍦`  | New, middle function                                          |

Example usage of the middle function:
```
      3⍦⍳7
4
      2⍦⍳7
3 4 5
      1⍦⍳7
2 3 4 5 6
      1⍦⍳8
2 3 4 5 6 7
      ¯1⍦⍳8
4 5
      ¯2⍦⍳8
3 4 5 6
      ¯3⍦⍳8
2 3 4 5 6 7
```

## Quirks & Bugs

* The left operand to `dx` must be a dfn, either inline or named.

## Additional credits

```
Dzaima: a better pmat implementation
Adam Brudzewsky: Range implementation 
```
