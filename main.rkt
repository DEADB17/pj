#lang racket

(module sample "script.rkt"
  (variable-declaration-statement
   (variable-declaration
    (variable-declarator
     (binding-identifier "a")
     (literal-numeric-expression 0))
    (variable-declarator
     (binding-identifier "b")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; write to file

(require json)
(require (rename-in 'sample [script sample]))

(call-with-output-file "sample-output.json" #:exists 'truncate
  (λ (out) (display (jsexpr->string sample) out)))

;; (display (jsexpr->string sample))
