(define (modular modulus op)
  (lambda (a b)
   (modulo (op a b) modulus)))
(define (+mod a b n)
  ((modular n +)
   a
   b))
(define (-mod a b n)
  ((modular n -)
   a
   b))
(define (*mod a b n)
  ((modular n *)
   a
   b))
(define (/mod a b n)
  ((modular n /)
   a
   b))

(define (exptmod p)
  (let ((mod* (modular p *)))
    (define (square x)
      (mod* x x))
    (define (em base exponent)
      (cond
        ((= exponent 0) 1)
        ((even? exponent) (em (square base) (/ exponent 2)))
        (else (mod* base (em base (- exponent 1))))))
    em))

(define (random-k-digit-number k)
  (if (= k 0)
      0
      (+
       (* (random 10) (expt 10 (- k 1)))
       (random-k-digit-number (- k 1)))))
(define (count-digits n)
  (if (= n 0)
      0
      (+ 1 (count-digits (quotient n 10)))))
(define (big-random n)
  (let ((r (random-k-digit-number (count-digits n))))
    (if (< r n)
        r
        (big-random n))))

(define (square x)
  (* x x))
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
    (mrt (+ (big-random (- n 1)) 1) n))
(define (prime? n)
  (define (mrt n c)
	(cond
	  ((= c 0) #t)
	  (else
           (if (miller-rabin-test n)
               (mrt n (- c 1))
               #f))))
  (mrt n 100))

(define (random-k-digit-prime k)
  (let ((n (random-k-digit-number k)))
    (if (prime? n)
        n
        (random-k-digit-prime k))))

(define (ax+by=1 a b)
  (let ((r (remainder a b)) (q (quotient a b)))
    (if (= r 1)
        (cons 1 (- q))
        (let ((p (ax+by=1 b r)))
          (cons (cdr p) (- (car p) (* (cdr p) q)))))))
(define (inversemod n)
  (lambda (e)
    (if (= (gcd e n) 1)
        (car (ax+by=1 e n))
        (error "No inverse of e for n exists."))))


  