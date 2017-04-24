#lang racket
(define (cc amount coin-values)
  (cond (( = amount 0) 1)
        (( or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+
          (cc amount
              (except-first-denomination coin-values))
          (cc (- amount
                 (first-denomination coin-values))
              coin-values)))))
(define us-coins (list 50 25 10 5 1)) (define uk-coins (list 100 50 20 10 5 2 1 0.5))
; Abelson and Sussman. Structure and Interpretation of Computer Programs (Kindle Locations 2354-2360). The MIT Press.

(define (first-denomination coins)
  (car coins))
(define (except-first-denomination coins)
  (cdr coins))
(define no-more? null?)

; The order of the list coin-values does not affect the answer produced by cc.
; The principles of this implementation and its underlying algorithms does not depend on the order of coins-values. 
