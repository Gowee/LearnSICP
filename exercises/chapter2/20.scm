#lang racket
(define (same-parity . numbers)
  (define (sp? number)
    (equal? (even? (car numbers)) (even? number))) 
  (define (iter list result)
    (cond
      ((null? list) result)
      ((sp? (car list))
       (iter (cdr list) (cons (car list) result)))
      (else
       (iter (cdr list) result))))
  (reverse (iter numbers '())))
        