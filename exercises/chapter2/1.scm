#lang sicp
(define numer car)
(define denom cdr)
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (mak-rat n d)
  (let ((c (if (< d 0) -1 1)))
    (let ((g (gcd (* n c) (* d c))))
      (cons (/ (* n c) g) (/ (* d c) g)))))
;e(
(print-rat (mak-rat 3 4))
; 3/4
(print-rat (mak-rat -3 4))
; -3/4
(print-rat (mak-rat 3 -4))
; -3/4
(print-rat (mak-rat -3 -4))
; 3/4