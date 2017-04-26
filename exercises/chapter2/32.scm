#|#lang racket
(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map subsets rest)))))

(define (subsets s)|#
; Not implemented yet.
; Referring solution:
; http://wiki.drewhess.com/wiki/SICP_exercise_2.32