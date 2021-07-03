
⍝ (C) 2021 by Kamila Szewczyk.
⍝ Licensed under the terms of the AGPLv3 license.

 dx←{
     ⍝ import dfns
     dfns←{(⍎⍵⎕NS⍬).⎕CY ⍵}'dfns'
     ⍝ namespace for symbol implementations
     ns←⎕NS⍬
     ⍝ code page
     cp←'⌶%⍺⍵_abcdefghijklmnopqrstuvwxyz¯.'
     cp,←'⍬0123456789⊢∆ABCDEFGHIJKLMNOPQRS'
     cp,←'TUVWXYZ⍙[/⌿\⍀<≤=≥>≠∨∧-+÷×?∊"#&@:'
     cp,←'⍷⋄←⍝)]⍴~↑↓⍳○*⌈⌊∇∘(⊂⊃∩∪⊥⊤|;,⍱⍲⍒⍋⍉'
     cp,←'⌽⊖⍟⌹!⍕⍎⍫⍪≡≢⎕⍞⍣⍭√⍛⍢⍍…⍙φ⍗⍐⍦⍁⍮Φ⍡'
     cp,←∊(⎕UCS 32)(⎕UCS 10)
     ⍝ custom operations
     t←⊂'~' '_Neg' ⋄ ns._Neg←{0=⍵}
     t,←⊂'⍭' '_Pco' ⋄ ns._Pco←dfns.pco
     t,←⊂'√' '_Root' ⋄ ns._Root←{⍺←2 ⋄ :⍵*÷⍺}
     t,←⊂'<' '_Lt' ⋄ ns._Lt←{0=⎕NC'⍺':⍵-1 ⋄ ⍺<⍵}
     t,←⊂'>' '_Gt' ⋄ ns._Gt←{0=⎕NC'⍺':⍵+1 ⋄ ⍺>⍵}
     t,←⊂'⍛' '_Rc' ⋄ ns._Rc←{⍵⍵∘⍺⍺}
     t,←⊂'⍢' '_Round' ⋄ ns._Round←{⍺←1 ⋄ ⍺(⊢∘××⊣×∘⌈¯0.5+∘|÷⍨)⍵}
     t,←⊂'⍍' '_MatMul' ⋄ ns._MatMul←{0=⎕NC'⍺':(,⍨⍴1,⍴∘0)⍵ ⋄ ⍺+.×⍵}
     t,←⊂'…' '_Range' ⋄ ns._Range←{
         ⍝ Adam Brudzewsky's Range function.
         ⍝ modified to follow a terser code style.
         ⎕IO←0 ⋄ c←0 2∊⍨10|⎕DR ⋄ t←1↓⍵ ⋄ d←c(e←⊃⍵)
         f←⎕UCS⍣d⊢0 ⋄ ⍺←f ⋄ l←-(2-d)⌊(≢⍺)⌊+/d=c¨¯2↑⍺
         s←l↓⍺ ⋄ b←(¯1⌊l)↑¯2↑f,l↑⍺ ⋄ d:s,t,⍨⎕UCS(⎕UCS b)∇ ⎕UCS e
         F S←-⍨\2↑b,b+×e-b ⋄ s,t,⍨F+S×⍳0⌈1+⌊(e-F)÷S+S=0
     }
     t,←⊂'⍙' '_MonadicDot' ⋄ ns._MonadicDot←{
         i←⍵ ⋄ o←⍳n←⊃⍴⍵
         m←1+↓⍉↑{1=⍵:,⊂,0 ⋄ (⊃,/)¨(⍳⍵)⌽¨⊂(⊂(!⍵-1)⍴⍵-1),⍨∇ ⍵-1}n
         ⍺⍺/(⍵⍵{⍺⍺/⌷∘i¨o,¨⍵})¨m
     }
     t,←⊂'φ' '_Fib' ⋄ ns._Fib←{⍺←0 1 ⋄ 0=⍵:⊃⍺ ⋄ (1↓⍺,+/⍺)∇ ⍵-1}
     t,←⊂'⍗' '_PowerDown' ⋄ ns._PowerDown←{op←⍺⍺⍣¯1 ⋄ 0=⎕NC'⍺':op ⍵ ⋄ ⍺ op ⍵}
     t,←⊂'⍐' '_PowerUp' ⋄ ns._PowerUp←{op←⍺⍺⍣(¯1+2*31) ⋄ 0=⎕NC'⍺':op ⍵ ⋄ ⍺ op ⍵}
     t,←⊂'∧' '_And' ⋄ ns._And←{0=⎕NC'⍺':⍵[⍋⍵] ⋄ ⍺∧⍵}
     t,←⊂'∨' '_Or' ⋄ ns._Or←{0=⎕NC'⍺':⍵[⍒⍵] ⋄ ⍺∨⍵}
     t,←⊂'⍦' '_Middle' ⋄ ns._Middle←{⍺>0:(-⍺)↓⍺↓⍵ ⋄ x←⌈(|⍺)-⍨2÷⍨≢⍵ ⋄ (-x)↓x↓⍵}
     t,←⊂'⍁' '_Diagonal' ⋄ ns._Diagonal←{⍵⊢∘⊂⌸⍨⍥,+/↑⍳⍴⍵}
     t,←⊂'⍮' '_Pair' ⋄ ns._Pair←{
         0≠⎕nc'⍺':⍺ ⍵
         ⍵=0:'0123456789'
         ⍵=1:'abcdefghijklmnopqrstuvwxyz'
         ⍵=2:'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
         ⍵=3:'yaeiou'
         ⍵=4:'YAEIOU'
         ⍵=5:'YAEIOU'
         ⍵=6:819⌶⎕A~'YAEIOU'
         ⍵=7:⎕A~'YAEIOU'
         ⍵=8:4294967296
         ⍵=9:4294967295
         ⍵=10:2÷¯1+5*÷2  ⍝ golden ratio
         ⍵=11:⎕UCS 10
         ⍵=12:3.1415
     }
     t,←⊂'Φ' '_Totient' ⋄ ns._Totient←((×/⊢-≠)3∘dfns.pco)
     t,←⊂'⍲' '_Prefixes' ⋄ ns._Prefixes←{0=⎕nc'⍺':(⍳∘≢↑¨⊂)⍵⋄⍺⍲⍵}
     t,←⊂'⍱' '_Suffixes' ⋄ ns._Suffixes←{0=⎕nc'⍺':(⌽∘,¨,\∘⌽)⍵⋄⍺⍱⍵}
     t,←c'=' '_Equal' ⋄ ns._Equal←{0=⎕nc'⍺':(1=≢∘∪)⍵⋄⍺=⍵}
     t,←c'⍡' '_Filter' ⋄ ns._Filter←{⍵/⍨⍺⍺⍵}
     ⍝ translation and execution
     k←,¯1↓⍉↑t⋄t3←{{0=≢⊃⍵:⊃⌽⍵⋄⊃⌽t⊃⍨⊃⍵}¨⍵,⍥⊂¨⍨{⍸∊k=⊃⍵}¨⍵}
     g←⍺⍺⋄r←t3¨{⍵/⍨{0≠≢⍵}¨⍵}{{⍵↓⍨-'⍝'=⊃⊃⌽⍵}60⌶⍵}¨↓⎕CR'g'
     2=⎕NC'⍺':⍺(ns⍎∊r)⍵⋄(ns⍎∊r)⍵
 }
