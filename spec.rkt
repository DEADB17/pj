#lang racket

;; INFO: This specification is currently divided into the following sections:
;; * supporting types
;; * node classes
;; * functions
;; * object expressions
;; * literals
;; * other expressions
;; * other statements
;; * directives
;; * other nodes


;; supporting types

(define DOMString? string?)


(struct Id (id))


(struct Kind Id ())

(struct VariableDeclarationKind Kind ())
(define VAR (VariableDeclarationKind "var"))

(struct PropertyNameKind Kind ())
(define IDENTIFIER (PropertyNameKind "identifier"))
(define STRING (PropertyNameKind "string"))
(define NUMBER (PropertyNameKind "number"))


(struct Operator Id ())

(struct AssignmentOperator Operator ())
(define AOP:= (AssignmentOperator "="))
(define AOP:+= (AssignmentOperator "+="))
(define AOP:-= (AssignmentOperator "-="))
(define AOP:*= (AssignmentOperator "*="))
(define AOP:/= (AssignmentOperator "/="))
(define AOP:%= (AssignmentOperator "%="))
(define AOP:<<= (AssignmentOperator "<<="))
(define AOP:>>= (AssignmentOperator ">>="))
(define AOP:>>>= (AssignmentOperator ">>>="))
(define AOP:\\= (AssignmentOperator "|="))
(define AOP:^= (AssignmentOperator "^="))
(define AOP:&= (AssignmentOperator "&="))

(struct BinaryOperator Operator ())
(define BOP:== (BinaryOperator "=="))
(define BOP:!= (BinaryOperator "!="))
(define BOP:=== (BinaryOperator "==="))
(define BOP:!== (BinaryOperator "!=="))
(define BOP:< (BinaryOperator "<"))
(define BOP:<= (BinaryOperator "<="))
(define BOP:> (BinaryOperator ">"))
(define BOP:>= (BinaryOperator ">="))
(define BOP:in (BinaryOperator "in"))
(define BOP:instanceof (BinaryOperator "instanceof"))
(define BOP:<< (BinaryOperator "<<"))
(define BOP:>> (BinaryOperator ">>"))
(define BOP:>>> (BinaryOperator ">>>"))
(define BOP:+ (BinaryOperator "+"))
(define BOP:- (BinaryOperator "-"))
(define BOP:* (BinaryOperator "*"))
(define BOP:/ (BinaryOperator "/"))
(define BOP:% (BinaryOperator "%"))
(define BOP:\, (BinaryOperator ","))
(define BOP:\\\\ (BinaryOperator "||"))
(define BOP:&& (BinaryOperator "&&"))
(define BOP:\\ (BinaryOperator "|"))
(define BOP:^ (BinaryOperator "^"))
(define BOP:& (BinaryOperator "&"))

(struct PrefixOperator Operator ())
(define PRE:+ (PrefixOperator "+"))
(define PRE:- (PrefixOperator "-"))
(define PRE:! (PrefixOperator "!"))
(define PRE:~ (PrefixOperator "~"))
(define PRE:typeof (PrefixOperator "typeof"))
(define PRE:void (PrefixOperator "void"))
(define PRE:delete (PrefixOperator "delete"))
(define PRE:++ (PrefixOperator "++"))
(define PRE:-- (PrefixOperator "--"))

(struct PostfixOperator Operator ())
(define POST:++ (PostfixOperator "++"))
(define POST:-- (PostfixOperator "--"))
