#lang racket

(define (square x) (* x x))
(define (pow3 x) (* x x x))


(define (enter message) (display message)
                        (read))

(define (recursion_search list position depth) (if (or (= (length list) 1) (= position depth))
                                                 (car list)
                                                 (recursion_search (cdr list) position (+ depth 1))))


;5.     Написать функцию, которая для заданных координат X1,Y1 и X2,Y2
;       возвращает расстояние между ними. Координаты могут иметь отрицательные значение.

(define (task_5  list1 list2) (display "Расстояние: ")
                              (display (sqrt(+ (square (- (car list2) (car list1)))
                                               (square (- (car (cdr list2)) (car(cdr list1))) ))))
                              (newline))

(display "Задание 5:")
(newline)
(task_5 (list (enter "Введите X1: ") (enter "Введите Y1: "))
         (list (enter "Введите X2: ") (enter "Введите Y2: ")))

;11.	Есть два списка. Написать функцию, формирующую список из трех подсписков.
;       Первый подсписок содержит голову первого списка и третий элемент второго.
;       Второй подсписок содержит второй элемент второго списка и последний элемент первого.

(define (task_11 list1 list2) (cons (list (car list1)
                                          (recursion_search list2 3 1))
                              (cons (list (recursion_search list2 2 1)
                                          (recursion_search list1 (length list1) 1) )
                              ' ())))

(display "Задание 11:")
(newline)
(display (task_11 (list 1 2 3 4) (list -1 -2 -3 -4) ))

;12.	Есть списки, к примеру, '(1 2 3 4 5)' (7 6 5 7).
;       Если произведение первых элементов исходных списков есть положительное число,
;       то объединить в результирующий список последние элементы.
;       В противном случае построить список из последнего элемента первого списка и хвоста второго.

(define (task_12 list1 list2) (if (> (* (car list1) (car list2)) 0)
                                  (list (recursion_search list1 (length list1) 1) (recursion_search list2 (length list2) 1))
                                  (list (recursion_search list1 (length list1) 1) (cdr list2))))

(newline)
(display "Задание 12:")
(newline)
(display (task_12 (list 1 2 3 4 5) (list 7 6 5 7) ))
(newline)
(display (task_12 (list -1 2 3 4 5) (list 7 6 5 7) ))

;13.	Есть три числа. Построить список из кубов этих чисел,
;       если все три числа – нечетные, возвратить сумму чисел – иначе.

(define (task_13 list1) (if (and (= (remainder (car list1) 2) 0)
                                          (= (remainder (car (cdr list1)) 2) 0)
                                          (= (remainder (car (cdr (cdr list1))) 2) 0))
                                  (list (pow3(car list1)) (pow3(car (cdr list1))) (pow3(car (cdr (cdr list1)))))
                                  (+ (car list1) (car (cdr list1)) (car (cdr (cdr list1))))))
(newline)
(display "Задание 13:")
(newline)
(display (task_13 (list 2 4 6) ))
(newline)
(display (task_13 (list 1 3 6) ))
