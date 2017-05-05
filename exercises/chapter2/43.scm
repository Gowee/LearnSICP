#lang racket
; For every new row, the implementation calls itself with the same argument `(- k 1)` for `board-size` times.
; So there will be board-size^board-size calls to `queen-cols` totally for a call to `queens`.

; Assume the time complexity of `safe` can be described as `O(1)`,
; then the complexity of the "normal" implementation of `queens` should be O(board-size^2), 
; Louis Reasoner's implementation of `queens` should be O(board-size^board-size).
; And it is also easy to find out that the time consumed of the former can be expected to be k*board-size^2,
; of the latter can be expected to be k*board-size^board-size (k is expected to be a constant value, same with the both).
; Assuming that the program in exercise 2.42 solves the puzzle in time `T`,
; estimation on how long it will take Louis's program to solve the eight-queens puzzle is `board-size^(board-size-2)*T`.