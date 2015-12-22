#lang racket

(require (for-syntax racket/format))

(begin-for-syntax
  (define (range stx)
    (list (syntax-position stx) (syntax-span stx))))

(define (variable-declarator-x id [init 'null])
  (hasheq 'type "VariableDeclarator"
          'id id
          'init init))

(define (variable-declaration-x . declarations)
  (hasheq 'type "VariableDeclaration"
          'kind "var"
          'declarations declarations))

(define (identifier name)
  (hasheq 'type "Identifier"
          'name name))

(define (literal value)
  (hasheq 'type "Literal"
          'value value))

(define (attach-source ht loc)
  (hash-set ht 'range loc))

(define-syntax (variable-declaration stx)
  (syntax-case stx ()
    [(_ declarator ...)
     (with-syntax ([loc (range stx)])
       #`(attach-source (variable-declaration-x declarator ...) 'loc))]))

(define-syntax (variable-declarator stx)
  (syntax-case stx ()
    [(_ binding init ...)
     (with-syntax ([loc (range stx)])
       #`(attach-source (variable-declarator-x binding init ...) 'loc))]))

(define test
  (variable-declaration (variable-declarator (identifier "a") (literal 0))
                        (variable-declarator (identifier "b"))))

(require json)

(call-with-output-file "js.json" #:exists 'truncate
  (λ (out)
    (display (jsexpr->string test) out)))
