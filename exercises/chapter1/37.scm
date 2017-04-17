#lang sicp
(define (cont-frac-recur n d k)
  (define (icf i)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (icf (+ i 1))))))
  (icf 1))

(define (cont-frac-iter n d k)
  (define (icf i result)
    (if (= i 0)
      result
      (icf (- i 1) (/ (n i) (+ (d i) result)))))
  (icf k 0))

(define cont-frac cont-frac-iter)

(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           12)

(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           12)

; k=12
; 0.6180257510729613
; 4 decimal places