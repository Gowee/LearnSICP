#lang sicp
(define (cont-frac n d k)
  (define (icf i result)
    (if (= i 0)
      result
      (icf (- i 1) (/ (n i) (+ (d i) result)))))
  (icf k 0))

(define (square x) (* x x))
; square is not included in Racket/SICP

(define (tan-cf x k)
  (cont-frac
   (lambda (n) (if (= n 1) x (- (square x))))
   (lambda (x) (- (* x 2) 1))
   100))

(+ 0.0 (tan-cf 1 100000))
; calculated (approximated): 1.5574077246549023
;
; actual & accurate:
; tan(1) = 1.557407724654902230506974807458360173087250772381520038383...