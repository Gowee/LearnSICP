#lang racket
(define a (list 1 3 (list 5 7) 9))
a
(car (cdr (car (cdr (cdr a)))))
;(cadaddr a)

(define b (list (list 7)))
b
(caar b)

(define c (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
c
(cadr (cadr (cadr (cadr (cadr (cadr c))))))

