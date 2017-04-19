#lang sicp
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
; Not equivalent to:
;(define (add-1 n)
;  (lambda (f) (lambda (x) (f ((n f) x)))))

(add-1 zero)
(lambda (f) (lambda (x) (f ((zero f) x))))
(lambda (f) (lambda (x) (f ((lambda (xx) xx) x))))
(lambda (f) (lambda (x) (f x)))

(define one
  (lambda (f) (lambda (x) (f x))))

(add-1 (add-1 zero))
(lambda (f) (lambda (x) (f (((lambda (ff) (lambda (xx) (ff xx))) f) x))))
(lambda (f) (lambda (x) (f ((lambda (xx) (f xx)) x))))
(lambda (f) (lambda (x) (f (f x))))
;;((lambda (f) (lambda (x) (f ((n f) x)))) (lambda (f) (lambda (x) x)))
;;((lambda (x) ((lambda (f) (lambda (x) x)) ((zero (lambda (f) (lambda (x) x))) x)

(define two (lambda (f) (lambda (x) (f (f x)))))

(define three (lambda (f) (lambda (x) (f (f (f x))))))

(define (mult a b)
  (lambda (f) (lambda (x) ((b (a f)) x))))

(define (add a b)
  (lambda (f) (lambda (x) ((b f) ((a f) x)))))


(define (inc n) (+ n 1))

(((add three three) inc) 1)
(((mult two three) inc) 1)
; 7
(((add one two) inc) 1)
(((mult one three) inc) 1)
(((add-1 (add-1 (add-1 zero))) inc) 1)
; 4
(((add (add three three) three) inc) 1)
(((mult three three) inc) 1)
; 10