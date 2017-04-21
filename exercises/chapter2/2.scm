#lang sicp
(define (make-segment start end)
  (cons start end))
(define start-segment car)
(define end-segment cdr)
(define (make-point x y)
  (cons x y))
(define x-point car)
(define y-point cdr)
(define (midpoint-segment segment)
  (let ((start (car segment)) (end (cdr segment)))
    (cons (/ (+ (car start) (car end)) 2)
          (/ (+ (cdr start) (cdr end)) 2))))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point (midpoint-segment (make-segment (make-point 0 1) (make-point 3 4))))
(print-point (midpoint-segment (make-segment (make-point 0 0) (make-point 4 4))))
(print-point (midpoint-segment (make-segment (make-point -2 -3) (make-point 2 3))))