;;;; example.scm - libsoc gpio library example
;;
;; Copyright (c) 2015 Chad Albers  All rights reserved.
;; BSD-style license: See COPYING file

;; This example infinitely and randomly toggles the gpio-level of the
;; gpios (50, 51, and 52)

(import (chibi)
	(srfi 1)
	(srfi 27)
	(srfi 18)
	(chibi match)
	(libsoc gpio))

;; returns a random gpio level
(define (randomize-gpio-level)
  (match
    (random-integer 2)
    (0 gpio-level/low)
    (1 gpio-level/high)
    (_ gpio-level/low)))

;; returns a lambda that can toggle the levels of a gpio
(define (gpio-toggle-make gpio-id)
  (let ((gpio (gpio-request gpio-id gpio-mode/weak)))
    (gpio-direction-set! gpio gpio-direction/output)
    (lambda ()
      (gpio-level-set! gpio (randomize-gpio-level)))))

;; Create 3 gpio toggles, for pin 50, 51, and 22
(define gpios
  (map (lambda (id) (gpio-toggle-make id))
       '(50 51 22)))

;; Randomly toggle the gpios, and paused after all
;; have been toggled
(let run ((toggles gpios))
  (if (null? toggles)
      (begin
	(thread-sleep! .3)
	(run gpios))
      (begin
	((car toggles))
	(run (cdr toggles)))))
