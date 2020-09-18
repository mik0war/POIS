#lang racket

(define (enter message) (display message)
                        (read))

(define (start_1 r1 r2) (if (> r1 r2) ( begin
                                       (display "Площадь кольца ")
                                       (display (- (* 3.1415 r1 r1) (* 3.1415 r2 r2)))
                                       (display " см. кв."))
                            (display "Ошибка! Радиус отверстия не может быть больше радиуса кольца.")))

(define (start_3 year) (if ( and (= (remainder year 4) 0) (or (not (= (remainder year 100) 0)) (= (remainder year 400) 0)))
                           (display "Год високосный")
                           (display "Год не високосный") ) )

(define (start_9 mounth) (if (or (and (> mounth 0) (< mounth 3)) (= mounth 12))
                                 (display "Зима")
                                 (if (or (and (> mounth 2) (< mounth 6)))
                                     (display "Весна")
                                     (if (or (and (> mounth 5) (< mounth 9)))
                                          (display "Лето")
                                          (if (or (and (> mounth 8) (< mounth 12)))
                                              (display "Осень")
                                              (display "Ошибка ввода!"))))))

(fprintf (current-output-port) "Вычисление площади кольца.~nВведите исходные данные:~n")

(start_1 (enter "Радиус кольца (см) => ")
         (enter "Радиус отверстия (см) => "))

(newline)
(newline)

(start_3 (enter "Введите год => "))

(newline)
(newline)

(start_9 (enter "Введите номер месяца (число от 1 до 12) "))




