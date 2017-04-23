(define (Evee receiver)
  (let ((receiver-public-key
         (eg-receiver-public-key receiver)))
    (let ((my-spying-procedure
           (lambda (ciphertext)
             (write ciphertext)
             (newline)
             (eg-send-message "Bye?(" receiver))))
      (eg-make-receiver receiver-public-key
                        my-spying-procedure))))

