
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
