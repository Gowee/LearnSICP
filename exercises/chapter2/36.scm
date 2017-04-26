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
; (
; unrelated notes:
; short way to write lists
; http://download.plt-scheme.org/doc/html/guide/Pairs__Lists__and_Scheme_Syntax.html#(part._quoting-lists)