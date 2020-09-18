#lang racket

(define (enter message) (display message)
                        (read))

(define (start_3 cost count cost_2 count_2) (display "Стоимость покупки: ")
                                          (display (+ (* cost count) (* cost_2 count_2)))
                                          (display " руб.")
                                          (newline)
                                          (newline))

(define (start_4 r1 r2) (display "Сопротивление цепи: ")
                        (display (/ 1 (+ (/ 1 r1) (/ 1 r2))))
                        (display " Ом.")
                        (newline)
                        (newline))

(define (start_2 r h) (display "Объем цилиндра ")
                      (display (* 3.1415 r r h))
                      (display "см. куб."))

(fprintf (current-output-port) "Вычисление стоимости покупки.~nВведите исходные данные:~n")
(start_3 (enter "Цена тетради(руб.) = ")
        (enter "Количество тетрадей = ")
        (enter "Цена карандаша(руб.) = ")
        (enter "Количество карандашей = "))

(fprintf (current-output-port) "Вычисление сопротивления электрической цепи.~nВведите исходные данные:~n")
(start_4 (enter "Величина первого сопротивления (Ом) =")
         (enter "Величина второго сопротивления (Ом) ="))

(fprintf (current-output-port) "Вычисление объема цилиндра.~nВведите исходные данные:~n")
(start_2 (enter "радиус основания (см) =")
         (enter "высота цилиндра (см) ="))



