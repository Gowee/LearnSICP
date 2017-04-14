;; Normal-order evaluation:
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;; remainder count: 11
;
;; Applicative-order evaluation
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (gcd 40 6)
; (gcd 6 (remainder 40 6))
; (gcd 6 4)
; (gcd 6 (remainder 6 4))
; (gcd 6 2)
; (gcd 2 (remainder 6 2))
; (gcd 2 0)
;; remainder count: 4

