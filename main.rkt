#lang racket

(require (for-syntax racket/format))

(begin-for-syntax
  (define (source-span stx)
    (define (source-location line column offset)
      (hasheq 'line line
              'column column
              'offset offset))

    (let ([line   (syntax-line stx)]
          [column (syntax-column stx)]
          [offset (syntax-position stx)]
          [span   (syntax-span stx)])
      (hasheq 'source (~a (syntax->datum stx))
              'start (source-location line column offset)
              'end   (source-location line (+ span column) (+ span offset))))))

(define (variable-declarator binding [init #false])
  (define ht (hasheq 'type "VariableDeclarator"
                     'binding binding))
  (if init
      (hash-set ht 'init init)
      ht))

(define (variable-declaration . declarators)
  (hasheq 'type "VariableDeclaration"
          'kind "var"
          'declarators declarators))

(define (attach-source ht loc)
  (hash-set ht 'loc loc))

(define-syntax (variable-declaration-x stx)
  (syntax-case stx ()
    [(_ declarator ...)
     (with-syntax ([loc (source-span stx)])
       #`(attach-source (variable-declaration declarator ...) loc))]))

(variable-declaration-x (variable-declarator "a" 0)
                        (variable-declarator "b"))
