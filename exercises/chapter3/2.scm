#lang racket
(define (make-monitored f)
  (let ((count 0))
    (lambda args
      (if (and (not (null? args)) (eq? (car args) 'how-many-calls?))
          count
          (begin (set! count (+ count 1))
                 (apply f args))))))
