#lang sicp
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display "guessing ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)

(fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 2.0)
#|
guessing 2.0
guessing 9.965784284662087
guessing 3.004472209841214
guessing 6.279195757507157
guessing 3.759850702401539
guessing 5.215843784925895
guessing 4.182207192401397
guessing 4.8277650983445906
guessing 4.387593384662677
guessing 4.671250085763899
guessing 4.481403616895052
guessing 4.6053657460929
guessing 4.5230849678718865
guessing 4.577114682047341
guessing 4.541382480151454
guessing 4.564903245230833
guessing 4.549372679303342
guessing 4.559606491913287
guessing 4.552853875788271
guessing 4.557305529748263
guessing 4.554369064436181
guessing 4.556305311532999
guessing 4.555028263573554
guessing 4.555870396702851
guessing 4.555315001192079
guessing 4.5556812635433275
guessing 4.555439715736846
guessing 4.555599009998291
guessing 4.555493957531389
guessing 4.555563237292884
guessing 4.555517548417651
guessing 4.555547679306398
guessing 4.555527808516254
guessing 4.555540912917957
4.555532270803653
guessing 2.0
guessing 5.9828921423310435
guessing 4.922168721308343
guessing 4.628224318195455
guessing 4.568346513136242
guessing 4.5577305909237005
guessing 4.555909809045131
guessing 4.555599411610624
guessing 4.5555465521473675
4.555537551999825
|#