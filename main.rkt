#lang racket

(define (script . statements)
  (hasheq 'type "Script"
          'directives null
          'statements statements))

(define (variable-declaration-statement declaration)
  (hasheq 'type "VariableDeclarationStatement"
          'declaration declaration))

(define (variable-declaration . declarators)
  (hasheq 'type "VariableDeclaration"
          'kind "var"
          'declarators declarators))

(define (variable-declarator binding [init 'null])
  (hasheq 'type "VariableDeclarator"
          'binding binding
          'init init))

(define (binding-identifier name)
  (hasheq 'type "BindingIdentifier"
          'name name))

(define (literal-numeric-expression value)
  (hasheq 'type "LiteralNumericExpression"
          'value value))


(define sample
  (script
   (variable-declaration-statement
    (variable-declaration
     (variable-declarator
      (binding-identifier "a")
      (literal-numeric-expression 0))
     (variable-declarator
      (binding-identifier "b"))))))

(require json)

(call-with-output-file "sample-output.json" #:exists 'truncate
  (λ (out)
    (display (jsexpr->string sample) out)))
