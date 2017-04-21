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

(define x (make-interval 1.0 3.0))
(define y (make-interval 0.0 4.0))
; Sum
; for sum, 2*width =
(- (+ (upper-bound x) (upper-bound y)) (+ (lower-bound x) (lower-bound y)))

; 2*widthx =
(- (upper-bound x) (lower-bound x))

; 2*widthy =
(- (upper-bound y) (lower-bound y))

(define width-x (/ (- (upper-bound x) (lower-bound x)) 2))

(define width-y (/ (- (upper-bound y) (lower-bound y)) 2))

(define width-1 (/ (- (+ (upper-bound x) (upper-bound y)) (+ (lower-bound x) (lower-bound y))) 2))
(define width-2 (/ (+ (- (upper-bound x) (lower-bound x)) (- (upper-bound y) (lower-bound y))) 2))
(define width-3 (+ width-x width-y))

(newline)
width-x
width-y
(newline)
width-1
width-2
width-3

; Not yet shown "that this is not true for multiplication or division".