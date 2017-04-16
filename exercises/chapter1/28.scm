(define (miller-rabin-test n)
  	(define (_expmod base exp m)
		(define (_square nn)
		  	(define (nontrivial-sqrt? nnn) 
			  	(and
				  (not
				    (or
				      (= nnn 1)
				      (= nnn (- m 1))))
				  (= (remainder (square nnn) m) 1)))
		  	(if (nontrivial-sqrt? nn) 0 (square nn)))
		(cond ((= exp 0) 1)
		      ((even? exp)
		       (remainder (_square (_expmod base (/ exp 2) m))
				  m))
		      (else
			(remainder (* base (_expmod base (- exp 1) m))
				   m))))
	(define (mrt a nn)
	  	(define (_t nnn)
		  	(and (not (= nnn 0)) (= nnn 1)))
		(_t (_expmod a (- nn 1) nn)))
	(mrt (+ (random (- n 1)) 1) n))

; Just following the steps described in SICP chapter 1 exercise 28 as far as I
; am understanding, not sure whether it is correct or not.
; Tested with some numbers, seemingly working well.

; According to the text in SICP, this seems to be probabilistic, but able to become deterministic if enough (more than half of n-1) distinct testing numbers a < n is tested, if I have got the point described there.

(define (mrt n c)
	(cond
	  ((= c 0) (display "end"))
	  (else (display n) (display "\t") (display (miller-rabin-test n)) (newline) (mrt n (- c 1)))))
