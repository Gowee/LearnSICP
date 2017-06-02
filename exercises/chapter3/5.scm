#lang racket
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))
(define (random-fraction-in-range low high)
  (let ((range (- high low)))
    (+ low (* (random) range))))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (abs (* (- x2 x1) (- y2 y1)
          (monte-carlo trials
                       (lambda ()
                           (P (random-fraction-in-range x1 x2) (random-fraction-in-range y1 y2)))))))

(+ (estimate-integral
    (lambda (x y)
      (<= (+ (* x x) (* y y)) 1))
    1 -1 1 -1
    1000000)
   .0)