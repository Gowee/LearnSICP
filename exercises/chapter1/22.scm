(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-prime a b)
  	(cond 
	  ((> a b) (newline) (display "search ends"))
	  ((even? a) (search-for-prime (+ a 1) b))
	  (else (timed-prime-test a) (search-for-prime (+ a 2) b))))

; 1009 1013 1019
; 10007 10009 10037
; 100003 100019 100043
; 1000003 1000033 1000037

