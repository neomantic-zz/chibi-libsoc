;;;; gpio.sld - libsoc gpio library
;;
;; Copyright (c) 2015 Chad Albers  All rights reserved.
;; BSD-style license: See COPYING file

(define-library (libsoc gpio)
  (export gpio-request
	  gpio-free
	  gpio-direction-get
	  gpio-direction-set!
	  gpio-level-set!
	  gpio-level-get
	  gpio-level/high
	  gpio-level/low
	  gpio-level/error
	  gpio-mode/shared
	  gpio-mode/greedy
	  gpio-mode/weak
	  gpio-direction/output
	  gpio-direction/input
	  gpio-direction/error)
  (include-shared "gpio"))
