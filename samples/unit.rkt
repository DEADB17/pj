#lang racket

(define-signature sig^
  (make-something))

(define-unit unit1@
  (import)
  (export sig^)

  (define (make-something)
    "something"))

(define-unit unit2@
  (import)
  (export sig^)

  (define (make-something)
    "something else"))

(define unit3@
  (unit
    (import)
    (export sig^)

    (define (make-something)
      "another something")))

(define-values/invoke-unit/infer (export (prefix k1- sig^)) unit1@)
(define-values/invoke-unit unit2@
  (import)
  (export (prefix k2- sig^)))

(displayln (k1-make-something))
(displayln (k2-make-something))
