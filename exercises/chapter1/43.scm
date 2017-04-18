#lang sicp
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (recur result c)
    (if (= c n)
        result
        (recur (compose f result) (+ c 1))))
  (recur f 1))
; may be impoved by taking similar strategies applied in exp, etc ?

(define (square x) (* x x))

((repeated square 2) 5)
;625