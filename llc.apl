cvt←{
    prop←⍺
    ⍝ pick a random element from a vector
    rE←?∘≢⊃⊢
    ⍝ concatenate elements with '+' in-between
    cp←(⊣,'+',⊢)/
    ⍝ Encode a number.
    eN←{
        ⍝ initialise the result vector; if the number to convert
        ⍝ is zero, return it.
        ⍺←⍬ ⋄ ⍵=0:⍺
        ⍝ pick a list of tuples from keys which second element is the
        ⍝ maximum value smaller or equal to the number to convert.
        ⍝ pick a random tuple from this list.
        x y←rE prop.keys/⍨prop.ord=2⊃⊃prop.keys/⍨⍵≥prop.ord
        ⍝ append the results, subtract from the input
        ⍝ number and recurse.
        (⍺,⊂x)∇ ⍵-y
    }
    ⍝ Convert an encoded number into a text form.
    cvts←{'(',(prop.quot ⍺),'-',(prop.quot ⍵),')'}/
    cvte←{
        emit←{
            ⍝ if a factor occurs more than 5 times, it'd be better
            ⍝ to turn repeated addition into multiplication.
            5≤2⊃⍵:'(',(cvts⊃⍵),'*(',(cvte 2⊃⍵),'))'
            ⍝ otherwise, emit it as-is.
            x y←⍵ ⋄ cp↑y⍴⊂cvts x
        }
        ⍝ take the amount of occurencies of each encoded
        ⍝ number in the output, process them with emit, then
        ⍝ add everything together and enlist it.
        ⍵≠0:∊cp emit¨↓,∘≢⌸eN ⍵
        ⊃cvts 2⍴rE prop.cs
    }
    cvte ⍵
}

transcode←{
    ⍝ alias for cvt
    cf←cvtp∘cvt
    ⍝ convert a hexadecimal number to decimal.
    dec←{
        0=≢⍵:0 ⋄ 11::'Hexadecimal number too big'⎕SIGNAL 11
        16⊥16|1-⍨'0123456789abcdef0123456789ABCDEF'⍳¯1↓⍵
    }
    ⍝ replace all occurences in code and alter it.
    ra←{code∘←((↑⍵[2])⎕R(↑⍵[1]))code}
    ⍝ replace the APL code.
    code←('\$[^\$]+\$'⎕R{⍕#⍎1↓¯1↓⍵.Match})⍵
    ⍝ replace numbers.
    code←('\b[0-9][0-9A-Fa-f]*h\b'⎕R{cf dec ⍵.Match})code
    code←('\b[0-9]+\b'⎕R{cf⍎⍵.Match})code
    ⍝ define pairs.
    pairs←⍺{⍵ ⍺}¨'_'⍴¨⍨⍳≢⍺
    ⍝ define code.
    defc←{∊'#define '(⍵[1])' '(⍵[2])}¨pairs
    ⍝ replace defined stuff
    _←ra¨pairs
    ⍝ find replaceable text
    fr←∪('[A-Z]+'⎕S{⍵.Match})code
    ⍝ available id-s
    ids←{⍵{⍺<≢⍵:⍺⍴⍵⋄⍵}{⍵/⍨1≠≢∘∪¨⍵}{'$_'[1+2⊥⍣¯1⊢⍵]}¨⍳{⍵+1+⌈2⍟⍵}⍵}≢fr
    ⍝ replace variables
    _←ra¨ids{⍺ ⍵}¨fr
    defc,⊂code
}

setup←{
    ⍝ the cvt namespace with precomputed data for
    ⍝ the initial character set.
    ns←⎕NS ⍬
    ⍝ non-alphanumeric character set.
    ns.cs←(⎕UCS∘(32∘+)⍳93)~∊⎕A ⎕D(⎕C ⎕A)'''' '\'
    ⍝ --> quote a string.
    ns.quot←{'''',⍵,''''}
    ⍝ sort a vector of tuples based on the second element.
    sortk←{⌽⍵[⍋2∘⊃¨⍵]}
    ⍝ --> vector of tuples of character pairs that yield
    ⍝     a given result when subtracted as ASCII codepoints.
    ns.keys←sortk{⍵/⍨{0≤2⊃⍵}¨⍵},{⍵,⍥⊂¨-/¨⎕UCS¨⍵}∘.,⍨ns.cs
    ⍝ every second element extracted from the tuples.
    ns.ord←2∘⊃¨ns.keys
    ns
}

⍝ initialise conversion data, read the input.
cvtp←setup⍬⋄d←⍞⋄c←⍞

⍝ compile the code.
{⍞←⍵⋄⍞←⎕ucs 10}¨(' '(≠⊆⊢)d) transcode c
