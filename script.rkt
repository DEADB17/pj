#lang racket/base

(require "gen-hasheq.rkt")
(provide (except-out (all-from-out racket/base)
                     #%module-begin)
         (rename-out [module-begin #%module-begin])
         (all-from-out "gen-hasheq.rkt"))

(define-syntax-rule (module-begin expr ...)
  (#%module-begin
   (provide (rename-out [*out* script]))
   (define *out* (script no-directives expr ...))))
