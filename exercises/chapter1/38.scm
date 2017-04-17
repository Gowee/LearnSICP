#lang sicp
(define (cont-frac n d k)
  (define (icf i result)
    (if (= i 0)
      result
      (icf (- i 1) (/ (n i) (+ (d i) result)))))
  (icf k 0))

(define (e k)
  (+ (cont-frac
      (lambda (x) 1)
      (lambda (x) (cond
                    ((= (remainder (+ x 1) 3) 0)
                     (* 2 (/ (+ x 1) 3)))
                    (else 1)))
      k)
     2))

(+ 0.0 (e 10000))
; approximated: 2.718281828459045
;
; actual: 2.718281828459045235360287471352662497757247093699959574966...