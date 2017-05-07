#lang racket
(define (equal? a b)
  (if (and (list? a) (list? b))
      (or (and (null? a) (null? b))
          (and (equal? (car a) (car b))
               (equal? (cdr a) (cdr b))))
      (eq? a b)))

; The description text just mention lists and symbols without taking into consideration string, interger, etc.
; This implementation circumvent this issue by using eq? to compare all things other than list.
; However, I am not sure whether it works with exactly the same behaviour as the built-in one, because I am not familiar with the type & object concepts in scheme.