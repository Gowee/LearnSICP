#lang racket
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

(define (queens board-size)
  (define (adjoin-position new-row k rest-of-queens)
    (append rest-of-queens (list new-row)))
  (define empty-board nil)
  (define (safe? new-row positions)
    (define (safe-iter rest-of-positions row)
      (if (= (length rest-of-positions) 1)
          true
          (let ((new-row-column (list-ref positions (- new-row 1))))
            (let ((slope (/ (- new-row-column (car rest-of-positions)) (- new-row row))))
              #|(display positions)
              (display slope)
              (newline)|#
              (if (or (= slope 0) (= (abs slope) 1))
                  false
                  (safe-iter (cdr rest-of-positions) (+ row 1)))))))
    (safe-iter positions 1))
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

; The representation for sets of board positions:
; '(r1 r2 r3 .. rN)
; rn represents the r-th row, in which to place the queen in the n-th column.

(length (queens 8))
  