(define (double n)
  	(* n n))
(define (halve n)
	(= (remainder n 2) 0) (/ n 2))
(define (multiply a b)
  	(cond
	  ((= b 1) a)
	  ((integer? (halve b)) (multiply (+ a a) (halve b)))
	  (else (+ a (multiply a (- b 1))))))
