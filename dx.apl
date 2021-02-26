
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
    t,←'⍢' '_Round'⋄ns._Round←{⍺←1⋄⍺(⊢∘××⊣×∘⌈¯0.5+∘|÷⍨)⍵}
    t,←'⍍' '_MatMul'⋄ns._MatMul←{0=⎕NC'⍺':(,⍨⍴1,⍴∘0)⍵ ⋄ ⍺+.×⍵}
    t,←'…' '_Range'⋄ns._Range←{
        ⍝ Adam Brudzewsky's Range function.
        ⎕IO←0
        Char←0 2∊⍨10|⎕DR
        end←⊃⍵
        tail←1↓⍵
        charend←Char end
        default←⎕UCS⍣charend⊢0
        ⍺←default
        charbegins←Char¨¯2↑⍺
        lead←-(2-charend)⌊(≢⍺)⌊+/charend=charbegins
        head←lead↓⍺
        begin←(¯1⌊lead)↑¯2↑default,lead↑⍺
        charend:head,tail,⍨⎕UCS(⎕UCS begin)∇ ⎕UCS end
        from step←-⍨\2↑begin,begin+×end-begin
        head,tail,⍨from+step×⍳0⌈1+⌊(end-from)÷step+step=0
    }
    t,←'⍙' '_MonadicDot'⋄ns._MonadicDot←{
        i←⍵ ⋄ o←⍳n←⊃⍴⍵
        m←1+↓⍉↑{1=⍵:,⊂,0 ⋄ (⊃,/)¨(⍳⍵)⌽¨⊂(⊂(!⍵-1)⍴⍵-1),⍨∇ ⍵-1}n
        ⍺⍺/(⍵⍵{⍺⍺/{i[⊃⍵;2⊃⍵]}¨o,¨⍵})¨m
    }
    h←{k v←↓⍉2(⊢⍴⍨÷⍨∘≢,⊣)⍺⋄{⍵∊k:⊃v[k⍳⍵] ⋄ ⍵}¨⍵}
    g←⍺⍺⋄c←↓⎕CR'g'
    s←{{⍵/⍨2∨/0,' '≠⍵}⍵/⍨~+\⍵='⍝'}¨c
    b←↑,/'⋄',⍨¨{⍵/⍨0≠{≢⍵}¨⍵}s
    f←{'}',⍨⍵/⍨1=+\1 ¯1 0['{}'⍳⍵]}b
    e←(∊' '(1↓∘,,⍤0){t h⍵}¨60⌶f)
    d←ns⍎e
    0=⎕nc'⍺':d⍵⋄⍺d⍵
}
