#lang racket
(define random-init 123)
(define (rand-update x) ; just a demo update function
  (modulo (+ (* x 1232342) 70120394) 10293012)) 
(define rand
  (let ((x random-init))
    (lambda (m)
      (define (generate)
          (set! x (rand-update x))
          x)
      (define (reset new-value)
          (set! x new-value)
          x)
      (cond ((eq? m 'generate) (generate))
            ((eq? m 'reset) reset)
            (error "Unknown request -- RAND"
                   m)))))
