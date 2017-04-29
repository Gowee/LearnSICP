#lang racket
(define (square x) (* x x))
(define (miller-rabin-test n)
  	(define (_expmod base exp m)
		(define (_square nn)
		  	(define (nontrivial-sqrt? nnn) 
			  	(and
				  (not
				    (or
				      (= nnn 1)
				      (= nnn (- m 1))))
				  (= (remainder (square nnn) m) 1)))
		  	(if (nontrivial-sqrt? nn) 0 (square nn)))
		(cond ((= exp 0) 1)
		      ((even? exp)
		       (remainder (_square (_expmod base (/ exp 2) m))
				  m))
		      (else
			(remainder (* base (_expmod base (- exp 1) m))
				   m))))
	(define (mrt a nn)
	  	(define (_t nnn)
		  	(and (not (= nnn 0)) (= nnn 1)))
		(_t (_expmod a (- nn 1) nn)))
	(mrt (+ (random (- n 1)) 1) n))
(define (prime? n)
  (define (mrt n c)
	(cond
	  ((= c 0) true)
	  (else
           (if (miller-rabin-test n)
               (mrt n (- c 1))
               false))))
  (mrt n 20))
  
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define nil '())

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))


(define (unique-pairs n)
  (flatmap
   (lambda (n)
     (map
      (lambda (nn)
        (list n nn))
      (enumerate-interval 1 (- n 1))))
   (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))