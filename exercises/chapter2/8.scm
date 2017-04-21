#lang sicp
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (make-interval a b) (cons a b))
(define lower-bound car)
(define upper-bound cdr)

(define (negate-interval v)
  (make-interval (- (upper-bound v)) (- (lower-bound v))))

(define (sub-interval a b)
 (add-interval a (negate-interval b)))

(define (print-interval v)
  (display (lower-bound v))
  (display ", ")
  (display (upper-bound v))
  (newline))

(print-interval (sub-interval (make-interval 1.0 3.0) (make-interval 7.0 13.0)))
(print-interval (sub-interval (make-interval 3.0 6.0) (make-interval 1.2 2.0)))
(print-interval (sub-interval (make-interval -3.0 6.0) (make-interval -1.2 2.0)))