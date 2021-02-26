
⍝ (C) 2021 by Kamila Szewczyk.
⍝ Licensed under the terms of the AGPLv3 license.

dx←{
    ns←⎕ns⍬
    t←'~' '_Neg'⋄ns._Neg←{0=⍵}
    t,←'⍭' '_Pco'⋄ns._Pco←({⍵⊣⍵.⎕CY'dfns'}⎕NS ⍬).pco
    t,←'√' '_Root'⋄ns._Root←{⍺←2⋄:⍵*÷⍺}
    t,←'<' '_Lt'⋄ns._Lt←{0=⎕NC'⍺':⍵-1⋄⍺<⍵}
    t,←'>' '_Gt'⋄ns._Gt←{0=⎕NC'⍺':⍵+1⋄⍺>⍵}
    t,←'⍛' '_Rc'⋄ns._Rc←{⍵⍵∘⍺⍺}
    t,←'⍢' '_Round' ⋄ ns._Round←{⍺←1⋄⍺(⊢∘××⊣×∘⌈¯0.5+∘|÷⍨)⍵}
    h←{k v←↓⍉2(⊢⍴⍨÷⍨∘≢,⊣)⍺⋄{⍵∊k:⊃v[k⍳⍵] ⋄ ⍵}¨⍵}
    g←⍺⍺⋄c←↓⎕CR'g'
    s←{{⍵/⍨2∨/0,' '≠⍵}⍵/⍨~+\⍵='⍝'}¨c
    b←↑,/'⋄',⍨¨{⍵/⍨0≠{≢⍵}¨⍵}s
    f←{'}',⍨⍵/⍨1=+\1 ¯1 0['{}'⍳⍵]}b
    e←(∊' '(1↓∘,,⍤0){t h⍵}¨60⌶f)
    d←ns⍎e
    0=⎕nc'⍺':d⍵⋄⍺d⍵
}
