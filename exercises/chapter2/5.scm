#lang sicp
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (logn b n)
  (/ (log n) (log b)))
(define (extract-iter n k)
  (let ((nn (/ n k)))
    (if (integer? nn)
        (extract-iter nn k)
        n)))
(define (car z)
  (logn 2 (extract-iter z 3)))
(define (cdr z)
  (logn 3 (extract-iter z 2)))

(car (cons 7 9))
(cdr (cons 7 9))
(car (cons 2 10))
(cdr (cons 88 11))
(car (cons 12219343 10))
; Problems:
; inefficient for big number;
; final result is not integer.

; Found a efficient version here below:
; https://github.com/jimweirich/sicp-study/blob/master/scheme/chapter2/ex2_05.scm
(define (factors n a)
  (define (loop i result)
    (if (= 0 (remainder i a))
        (loop (/ i a) (+ 1 result))
        result))
  (loop n 0))

(define (icons a b)
  (* (power 2 a) (power 3 b)))

(define (icar pair)
  (factors pair 2))

(define (icdr pair)
  (factors pair 3))