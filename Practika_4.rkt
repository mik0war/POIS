#lang racket

;23.Описать функцию, которая находила бы сумму
;всех числовых элементов списка с учетом наличия
;подсписков. Пример: для списка ‘(1 ((2 3) 4) 5 6)
;результатом будет 21.

(define (recursion_sum list) (if (empty? list)
                                 0
                                 (if (pair? list)
                                     (+  (if (list? (car list))
                                             (recursion_sum(car list))
                                             (car list)
                                             )
                                         (recursion_sum (cdr list))
                                         )
                                     list
                                     )
                                 )
  )

;36.Описать функцию, которая в заданном списке заменяет
;все элементы-списки значениями сумм входящих в них
;числовых элементов с учетом вложенных подсписков.


(define (recursion_sum_in_list list) (if (empty? list)
                                         '()
                                         (cons 
                                          (if (list? (car list))
                                              (recursion_sum (car list))
                                              (car list)
                                              )
                                          (recursion_sum_in_list (cdr list))
                                          )
                                         )
  )

;27.Реализовать функцию, которая выдавала бы
;элемент списка по заданному номеру с конца.

(define (recursion_search_normal list position depth) (if (or (= (length list) 1) (= position depth))
                                                 (car list)
                                                 (recursion_search_normal (cdr list) position (+ depth 1))))

(define (recursion_search_revers list number) (recursion_search_normal (reverse list) number 1))
