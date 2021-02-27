
⍝ (C) 2021 by Kamila Szewczyk.
⍝ Licensed under the terms of the AGPLv3 license.

 dx←{
     ns←⎕NS ⍬
     t←'~' '_Neg' ⋄ ns._Neg←{0=⍵}
     t,←'⍭' '_Pco' ⋄ ns._Pco←({⍵⊣⍵.⎕CY'dfns'}⎕NS ⍬).pco
     t,←'√' '_Root' ⋄ ns._Root←{⍺←2 ⋄ :⍵*÷⍺}
     t,←'<' '_Lt' ⋄ ns._Lt←{0=⎕NC'⍺':⍵-1 ⋄ ⍺<⍵}
     t,←'>' '_Gt' ⋄ ns._Gt←{0=⎕NC'⍺':⍵+1 ⋄ ⍺>⍵}
     t,←'⍛' '_Rc' ⋄ ns._Rc←{⍵⍵∘⍺⍺}
     t,←'⍢' '_Round' ⋄ ns._Round←{⍺←1 ⋄ ⍺(⊢∘××⊣×∘⌈¯0.5+∘|÷⍨)⍵}
     t,←'⍍' '_MatMul' ⋄ ns._MatMul←{0=⎕NC'⍺':(,⍨⍴1,⍴∘0)⍵ ⋄ ⍺+.×⍵}
     t,←'…' '_Range' ⋄ ns._Range←{
         ⍝ Adam Brudzewsky's Range function.
         ⍝ modified to follow a terser code style.
         ⎕IO←0 ⋄ c←0 2∊⍨10|⎕DR ⋄ t←1↓⍵ ⋄ d←c(e←⊃⍵)
         f←⎕UCS⍣d⊢0 ⋄ ⍺←f ⋄ l←-(2-d)⌊(≢⍺)⌊+/d=c¨¯2↑⍺
         s←l↓⍺ ⋄ b←(¯1⌊l)↑¯2↑f,l↑⍺ ⋄ d:s,t,⍨⎕UCS(⎕UCS b)∇ ⎕UCS e
         F S←-⍨\2↑b,b+×e-b ⋄ s,t,⍨F+S×⍳0⌈1+⌊(e-F)÷S+S=0
     }
     t,←'⍙' '_MonadicDot' ⋄ ns._MonadicDot←{
         i←⍵ ⋄ o←⍳n←⊃⍴⍵
         m←1+↓⍉↑{1=⍵:,⊂,0 ⋄ (⊃,/)¨(⍳⍵)⌽¨⊂(⊂(!⍵-1)⍴⍵-1),⍨∇ ⍵-1}n
         ⍺⍺/(⍵⍵{⍺⍺/⌷∘i¨o,¨⍵})¨m
     }
     t,←'𝑓' '_Fib' ⋄ ns._Fib←{⍺←0 1 ⋄ 0=⍵:⊃⍺ ⋄ (1↓⍺,+/⍺)∇ ⍵-1}
     t,←'⍗' '_PowerDown' ⋄ ns._PowerDown←{op←⍺⍺⍣¯1 ⋄ 0=⎕NC'⍺':op ⍵ ⋄ ⍺ op ⍵}
     t,←'⍐' '_PowerUp' ⋄ ns._PowerUp←{op←⍺⍺⍣(¯1+2*31) ⋄ 0=⎕NC'⍺':op ⍵ ⋄ ⍺ op ⍵}
     t,←'∧' '_And' ⋄ ns._And←{0=⎕NC'⍺':⍵[⍋⍵] ⋄ ⍺∧⍵}
     t,←'∨' '_Or' ⋄ ns._Or←{0=⎕NC'⍺':⍵[⍒⍵] ⋄ ⍺∨⍵}
     h←{k v←↓⍉2(⊢⍴⍨÷⍨∘≢,⊣)⍺ ⋄ {⍵∊k:⊃v[k⍳⍵] ⋄ ⍵}¨⍵}
     g←⍺⍺ ⋄ c←↓⎕CR'g'
     s←{{⍵/⍨2∨/0,' '≠⍵}⍵/⍨~+\⍵='⍝'}¨c
     b←↑,/'⋄',⍨¨{⍵/⍨0≠{≢⍵}¨⍵}s
     f←{'}',⍨⍵/⍨1=+\1 ¯1 0['{}'⍳⍵]}b
     e←(∊' '(1↓∘,,⍤0){t h ⍵}¨60⌶f)
     d←ns⍎e ⋄ 0=⎕NC'⍺':d ⍵ ⋄ ⍺ d ⍵
 }
