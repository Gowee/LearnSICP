#lang racket
; footnotes - 34
; Thus, we would type (quote a) instead of 'a, and we would type (quote (a b c)) instead of '(a b c). This is precisely how the interpreter works. The quotation mark is just a single-character abbreviation for wrapping the next complete expression with quote to form (quote <expression>).

; Equivalent expressions:
''abracadabra
'(quote abracadabra)
(quote (quote abracadabra))
(list 'quote 'abracadabra)

; also take a look at the rest part of footnotes - 34.