(define (double n)
  	(* n n))
(define (halve n)
	(= (remainder n 2) 0) (/ n 2))
(define (multiply a b)
	(multiply-iter a b 0))
; invariant quantity: a*b+x=a*b(original)
(define (multiply-iter a b x)
  	(cond
	  ((= b 0) x)
	  ((integer? (halve b)) (multiply-iter (+ a a) (/ b 2) x))
	  (else (multiply-iter a (- b 1) (+ a x)))))
