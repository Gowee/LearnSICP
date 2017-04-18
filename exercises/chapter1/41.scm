#lang sicp
(define (double f)
  (lambda (x) (f (f x))))

((double inc) 1)
; 3
(((double (double double)) inc) 5)
; 21
(((double (lambda (x) (double (double x)))) inc) 5)
; 21
(((lambda (x) ((lambda (xx) (double (double xx))) ((lambda (xxx) (double (double xxx))) x))) inc) 5)
; 21
(((lambda (x) ((lambda (xx) (double (double xx))) (double (double x)))) inc) 5)
; 21
(((lambda (x) (double (double (double (double x))))) inc) 5)
; 21
((double (double (double (double inc)))) 5)
; 21
