#lang racket
(define left-branch car)
(define right-branch cadr)
(define branch-length car)
(define branch-structure cadr)

(define (total-weight mobile)
  (if (number? mobile)
      mobile
      (+ (total-weight (branch-structure (left-branch mobile)))
         (total-weight (branch-structure (right-branch mobile))))))
      
(define (balanced? mobile)
  (define (balanced?-and-weight mobile)
    (if (number? mobile)
        (cons true 0)
        (let ((left-bw  (balanced?-and-weight (left-branch mobile)))
              (right-bw (balanced?-and-weight (left-branch mobile))))
          (let ((left-torque ((* (cdr left-bw) (branch-length left-branch))))
                (right-torque ((* (cdr right-bw) (branch-length right-branch)))))
            (cons (not (and (car left-bw) (car right-bw)) (= left-torque right-torque))
                  (+ (cdr left-bw) (cdr right-bw)))))))
  (car (balanced?-and-weight mobile)))
; Not tested/.

; How much do you need to change your programs to convert to the new representation?
; Just changing the selectors defined in the first few lines.