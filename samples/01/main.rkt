#lang racket

(define filename
  (command-line
   #:args (filename)
   filename))

(define result (dynamic-require filename 0))

(displayln result)
