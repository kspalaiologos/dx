
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

| Glyph | Extension                                                    |
| :---: | ------------------------------------------------------------ |
|  `~`  | Extended domain, behaves like `0=`                           |
|  `⍭`  | New function, `dfns.pco`                                     |
|  `√`  | New function, `⍺`-th root (by default `⍺=2`)                 |
|  `<`  | Extended domain, monadic decrement.                          |
|  `>`  | Extended domain, monadic increment.                          |
|  `⍛`  | New function, reverse compose.                               |
|  `⍢`  | Round towards closest `⍺`, defaulting to `⍺=1`               |
|  `⍍`  | Matrix multiplication, identity matrix of size..             |
|  `…`  | Adam Brudzewsky's Range                                      |
|  `⍙`  | Iverson's monadic dot product (e.g. `-⍙×` - determinant)     |

## Quirks & Bugs

* The left operand to `dx` must be a dfn, either inline or named.
