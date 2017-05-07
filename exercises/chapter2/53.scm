#lang racket
(list 'a 'b 'c)

(list (list 'george))
(cdr '((x1 x2) (y1 y2)))

(cadr '((x1 x2) (y1 y2)))
(pair? (car '(a short list)))
(memq 'red '((red shoes) (blue socks)))

(memq 'red '(red shoes blue socks))
#|
'(a b c)
'((george))
'((y1 y2))
'(y1 y2)
#f
#f
'(red shoes blue socks)
|#
; '(a b c) <=> (list 'a 'b 'c) != (list a b c)

; (copied from the text) Quote:
; Thus, the meaning of the single quote character is to quote the next object.
; Quotation also allows us to type in compound objects, using the conventional printed representation for lists: