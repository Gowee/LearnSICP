#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define nil '())

(define (count-leaves t)
  (accumulate
   (lambda (x y)
     (+ (cond #|((null? x) 0) ; uncessary cuz (car sequence) can't be nil|#
              ((not (pair? x)) 1)
              (else (count-leaves x)))
        y))
   0
   t))
; Does not follow exactly the code given in the text, however.

; Another solution complying with the text requirements can be found here:
; http://wiki.drewhess.com/wiki/SICP_exercise_2.35;
; which use `map` to count leaves of every direct child tree in t (treated as
; sequence), within which `count-leaves` recursively call it self, and finally
; use `accumulate` to sum them up.
