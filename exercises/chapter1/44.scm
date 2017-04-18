#lang sicp
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (recur result c)
    (if (= c n)
        result
        (recur (compose f result) (+ c 1))))
  (recur f 1))

(define (average . ns) (/ (apply + ns) (length ns)))
; cuz Raket/SICP does not include average.
; http://stackoverflow.com/questions/3243035/define-average-in-lisp

(define dx 0.1)
(define (smooth f)
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))
(define (n-fold-smooth f n)
  (repeated f n))

; dx = 0.001
((smooth (lambda (x) x)) 1)
; 1.0
((smooth (lambda (x) x)) 2)
; 2.0
((smooth (lambda (x) (* x x))) 3)
; 9.000000000000666
((smooth (lambda (x) (* x x))) 1)
; 9.000000000000666
((smooth (lambda (x) (* x x x))) 1)
; 1.0000019999999998
((smooth (lambda (x) (* x x x))) 0.1)
; 0.0010002000000000004
((n-fold-smooth (lambda (x) (* x x x)) 1) 0.1)
; 0.0010000000000000002

; dx = 0.1
#|
1.0
2.0
9.006666666666668
1.0066666666666668
1.0200000000000002
0.003000000000000001
0.0010000000000000002
|#