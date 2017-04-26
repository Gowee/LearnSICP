#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define nil '())
(define (accumulate-n op init seqs)
  (define (first-of-all seqs)
    (if (null? seqs)
        nil
        (cons (car (car seqs)) (first-of-all (cdr seqs)))))
  (define (except-first seqs)
    (if (null? seqs)
        nil
        (cons (cdr (car seqs)) (except-first (cdr seqs)))))
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (first-of-all seqs))
            (accumulate-n op init (except-first seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (vv) (dot-product vv v)) m))
(define (transpose mat)
  (accumulate-n cons '() mat))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (v) (matrix-*-vector cols v)) m)))
; Reference (partially): http://wiki.drewhess.com/wiki/SICP_exercise_2.37