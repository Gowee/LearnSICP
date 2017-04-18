#lang sicp
(define (average . ns) (/ (apply + ns) (length ns)))
; cuz Raket/SICP does not include average.
; http://stackoverflow.com/questions/3243035/define-average-in-lisp

(define (iterative-improve good-enough? improve-guess)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve-guess guess))))
  (lambda (guess) (iter guess)))

(define (square x) (* x x))

(define tolerance 0.00001)

(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) tolerance))
  ; SICP/sec1.1.7, modified
  ((iterative-improve good-enough? improve) 1.0))

(define (original-fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (fixed-point f first-guess)
  (define (improve guess)
    (f guess))
  (define (good-enough? guess)
    (< (abs (- guess (f guess))) tolerance))
  ((iterative-improve good-enough? improve) first-guess))
; duplicate (f guess)

(sqrt 2)
; 1.4142156862745097
(original-fixed-point (lambda (y) (/ (+ y (/ 2 y)) 2)) 1.0)
; 1.4142135623746899
(fixed-point (lambda (y) (/ (+ y (/ 2 y)) 2)) 1.0)
; average damp for calculating sqrt(2)
; 1.4142156862745097
; why is there a little discrepancy between the two above?
; guess: probably due to the concrete existence / storage of the value of (define next (f guess)) in a variable in first case (a.k.a. original-fixed-point)?(