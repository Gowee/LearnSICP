#lang racket
(define (deep-reverse list)
  (define (iter list result)
    (if (null? list)
        result
        (iter
         (cdr list)
         (cons
          (if (pair? (car list))
              (deep-reverse (car list))
              (car list))
          result))))
  (iter list '()))