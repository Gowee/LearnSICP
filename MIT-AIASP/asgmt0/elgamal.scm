;#lang racket/load
(load "primitives.scm")
(load "p0utils.scm")

(define (eg-send-message message receiver)
  (let ((receiver-public-key
         (eg-receiver-public-key receiver))
        (receiver-decryption-procedure
         (eg-receiver-decryption-procedure receiver)))
    (let ((dh-system
           (eg-public-key-system receiver-public-key))
          (advertised-number
           (eg-public-key-number receiver-public-key)))
      (let ((k (dh-system-size dh-system))
            (p (dh-system-prime dh-system))
            (root (dh-system-primitive-root dh-system)))
        (let ((my-secret (random-k-digit-number k))
              (mod-expt (exptmod p))
              (mod-* (modular p *)))
          (receiver-decryption-procedure
           (eg-make-ciphertext
            (mod-expt root my-secret)
            (mod-* (string->integer message)
                   (mod-expt advertised-number my-secret)))))))))