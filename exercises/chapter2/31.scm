#lang racket
(define (square-tree tree)
  (tree-map square tree)
  )
(define (square x) (* x x))
;(

(define (tree-map proc tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map proc sub-tree)
             (proc sub-tree)
             ))
       tree))