; Proof:
; Assume that p', q' exist s.t. the case in question is satisfied.
; Let (a1, b1), (a2, b2), (a3, b3) be the (a, b) params in 3 consecutive transmission.
; a2 := b1*q + a1*q + a1*p, b2 := b1*p + a1*q
; a3 := b2*q + a2*q + a2*p = 2*b1*p*q + 2*a1*q^2 + b1*q^2 + 2*a1*p*q + a1*p^2
;			   = b1*(2pq+q^2) + a1*(2pq+q^2) + a1*(p^2+q^2)
; b3 := b2*p + a2*q = b1*p^2 + 2a1*pq + b1*q^2+ a1*q^2 = b1*(p^2+q^2) + a1*(2pq+q^2)
; Therefore, p' = p^2 + q^2, q' = 2pq + q^2.

(define (fib n)
  	(fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  	(cond ((= count 0) b)
	      ((even? count)
	       (fib-iter a
			 b
			 (+ (square p) (square q))
			 (+ (* 2 p q) (square q))
			 (/ count 2)))
	      (else (fib-iter (+ (* b q) (* a q) (* a p))
			      (+ (* b p) (* a q))
			      p
			      q
			      (- count 1)))))
; Abelson and Sussman. Structure and Interpretation of Computer Programs (Kindle Locations 1185-1188). The MIT Press.

	
			    
