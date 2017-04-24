(define (reverse list)
  (define (r list result)
    (if (null? list)
        result
        (r (cdr list) (cons (car list) result))))
  (r list ()))