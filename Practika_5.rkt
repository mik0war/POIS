#lang racket

(define (bubble-inner-sort list)
  (if (> (length list) 1)
      (if (< (car list) (cadr list))
          (cons (car list) (bubble-inner-sort (cdr list)))
          (cons (cadr list) (bubble-inner-sort (cons (car list) (cddr list)))))
      list
  )
)

(define (bubble-sort list count)
    (if (< count (length list))
      (bubble-inner-sort (bubble-sort list (+ count 1)))
      list
  )
)


(define (quick-sort qlist)
  (if (> (length qlist) 1)
      (append
       (quick-sort (filter (lambda (x) (< x (car qlist))) (cdr qlist)))
       (list (car qlist))
       (quick-sort (filter (lambda (x) (>= x (car qlist))) (cdr qlist)))
       )
      qlist
      )
  )

(require parser-tools/lex)
(require (prefix-in : parser-tools/lex-sre))

(define custom-lexer
  (lexer

   [#\(
    (cons '(LPAR)
          (custom-lexer input-port))]

   [#\)
    (cons '(RPAR)
          (custom-lexer input-port))]

   [(:: "function")
    (cons `(FUNCTION_NAME ,(string->symbol lexeme))
          (custom-lexer input-port))]
   
   [(:: "int")
    (cons `(INT ,(string->symbol lexeme))
          (custom-lexer input-port))]

   [(:+ (:or (char-range #\a #\z) (char-range #\A #\Z) (char-range #\0 #\9)))
    (cons `(ID ,(string->symbol lexeme))
          (custom-lexer input-port))]

   [(:: ",")
    (cons `(COMMA ,(string->symbol lexeme))
          (custom-lexer input-port))]

   [whitespace
    (custom-lexer input-port)]

   [(eof)
    '()]))

(define (my-lexer value)
    (let ([input (open-input-string value)]) (custom-lexer input))
)
