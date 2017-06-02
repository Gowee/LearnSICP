#lang racket
(define f
  (let ((x 0))
    (lambda (y)
      (begin0 x
      (set! x y)))))