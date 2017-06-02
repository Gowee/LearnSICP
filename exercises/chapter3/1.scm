#lang racket
(define (make-accumulator sum)
  (lambda (addend)
    (begin (set! sum (+ sum addend))
           sum)))