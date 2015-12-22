#lang racket

(provide out)

(define hello "hello")

(define world "world")

(define out (string-join (list hello world)))
