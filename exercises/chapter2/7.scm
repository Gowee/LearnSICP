#lang sicp
(define (make-interval a b) (cons a b))

(define lower-bound car)
(define upper-bound cdr)

(let ((i (make-interval 1.0 3.0)))
  (display (lower-bound i))
  (display ", ")
  (display (upper-bound i))
  (newline))