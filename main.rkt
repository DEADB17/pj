#lang racket

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
            'end   (source-location line (+ span column) (+ span offset)))))

(define (variable-declarator stx binding init)
  (hasheq 'type "VariableDeclarator"
          'binding binding
          'init init
          'loc (source-span stx)))

(define (variable-declaration stx . declarators)
  (hasheq 'type "VariableDeclaration"
          'kind "var"
          'declarators declarators
          'loc (source-span stx)))


(define mt-stx #'"")

(variable-declaration mt-stx
                      (variable-declarator mt-stx "a" 0)
                      (variable-declarator mt-stx "b" 1))
