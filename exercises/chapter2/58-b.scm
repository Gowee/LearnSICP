#lang racket
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (addend s) (car s))

(define (augend s) (caddr s))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))

(define (multiplicand p) (caddr p))


(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        (else (list base '** exponent))))
(define base car)
(define exponent caddr)
(define (exponentiation? e)
  (and (pair? e) (eq? (cadr e) '**)))

(define (deriv exp var)
  (let ((exp (formalize exp)))
    ;(display exp)(newline)
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
           (error "unknown expression type -- DERIV" exp)))))

(define hp-op '**) ; operator with highest precedence
(define (precedenceof op)
  (case op
    ('HIGHEST 9)
    ('** 2)
    ('* 1)
    ('+ 0)
    (else -1)));(error "unknown operator -- " op))))
(define (lowest-precedence expr last-hp-op i) ; search the operator with highest precedence in this expression (without nesting into sub-expressions) and return its index in the list
  (if (null? (cdr expr)) ; not sub-expression (i.e. literal value or variable or parenthesized expression)
      i
      (let ((op (cadr expr)))
        (cond ((null? expr) i)
              ((eq? op hp-op)
               (+ i 2))
              ((< (precedenceof op) (precedenceof last-hp-op)) (lowest-precedence (cddr expr) op (+ i 2)))
              (else (lowest-precedence (cddr expr) last-hp-op i))))))
(define (formalize expr)
  (define (f expr opi) ; formalize a expr according to the highest precedence whose index is opi
    (let-values (((left _right) (split-at expr (- opi 1))))
      (let ((op (car _right)) (right (cdr _right)))
        (values (ft left) op (ft right)))))
  (define (ft t) ; if the term t (such as '(x)) is not sub-expression (i.e. literal value or variable or parenthesized expression), then it returns (car t), otherwise returns t per se.
    (if (null? (cdr t))
        (car t)
        t))
  (cond
    ((not (pair? expr)) ; basic term (i.e. literal value or variable or parenthesized expression (in the form '((some-expr))))
     expr)
    ((= (length expr) 4) ; formalized expression
     expr)
    (else (let-values (((left op right) (f expr (lowest-precedence expr 'HIGHEST 0))))
            (list (formalize left) op (formalize right))))))


  
; (deriv '(x ** 4) 'x)
; '(4 * (x ** 3))
; (deriv '((x + (x ** 2)) ** 4) 'x)
;'((4 * ((x + (x ** 2)) ** 3)) * (1 + (2 * x)))
#|
(formalize '(x + 3 * 1))
'(x + (3 * 1))
>  '(x + 3 * (x + y + 2))
'(x + 3 * (x + y + 2))
> (formalize '(x + 3 * (x + y + 2)))
'((x + 3) * (x + (y + 2)))
|#
; (deriv '((x + 3) + (x + (y + 2))) 'x) 
; 2
; (deriv  '(x + 3 * (x + y + 2)) 'x)
; 4
; (deriv  '(x + 3 * (x + y + 2)) 'y)
; 3

; Rationale: find the lowest operator in the expression and split the expression into two subexpressin, recursively
; Notes: to conform with the requirements in the text, `formailize` can be called in every constructor / selector of corresponding oprator instead of in deriv, but it is inefficient and I <del>cannot</del> have troubles in comeing up with other efficient algos that conforms with the text at lesat so far.
