#lang racket/base

(provide (all-defined-out))

(define (top type directives statements)
  (hasheq 'type type
          'directives directives
          'statements statements))

(define no-directives null)

(define (script directives . statements)
  (top "Script" directives statements))

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
