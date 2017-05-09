#lang racket
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum . a)
  (define (recur as)
    (cond
      ((null? as) as)
      ((=number? (car as) 0) (recur (cdr as)))
      (else (cons (car as) (recur (cdr as))))))
  (let ((r (recur a)))
    (if (null? (cdr r)) #| length of r can be 1, for example when (make-sum 0 'x) |#
        (car r)
        (cons '+ r))))
; TO IMP: does not sum all numbers together into one term

(define (make-product . m)
  (define foo '(foo)) #| works unconditional if the implementation evaluates (eq? foo foo) to true while false for (eq? '(foo) '(foo)) |#
  #| reference (for the above): http://stackoverflow.com/questions/16299246/what-is-the-difference-between-eq-eqv-equal-and-in-scheme |#
  (define (ccons x y)
    (if (eq? y foo)
        foo #| propagate this object indicating 0 existence back in call stack |#
        (cons x y)))
  (define (recur ms)
    (cond ((null? ms) ms)
          ((=number? (car ms) 1) (recur (cdr ms)))
          ((=number? (car ms) 0) foo)
          (else (ccons (car ms) (recur (cdr ms))))))
  (let ((r (recur m)))
    (cond ((eq? r foo) 0)
          ((null? (cdr r)) (car r)) #| length of r can be 1, for example when (make-product 1 'x) |#
          (else (ccons '* r)))))
; TO IMP: does not multiply all numbers together into one term

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s)
  (if (> (length s) 3) #| O(n) can be reduced to O(1), for simplicity here |#
      (cons '+ (cddr s))
      (caddr s)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p)
    (if (> (length p) 3) #| O(n) can be reduced to O(1), for simplicity here |#
        (cons '* (cddr p))
        (caddr p)))

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        (else (list '** base exponent))))
(define base cadr)
(define exponent caddr)
(define (exponentiation? e)
  (and (pair? e) (eq? (car e) '**)))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponentiation? exp)
         (make-product (make-product (exponent exp)
                       (make-exponentiation
                        (base exp) (- (exponent exp) 1)))
                       (deriv (base exp)
                              var)))
        (else
         (error "unknown expression type -- DERIV" exp))))
; (deriv '(* x y (+ x 3)) 'x)
; '(+ (* x y) (* y (+ x 3)))
; (make-sum 1 1 1 )
; '(+ 1 1 1)