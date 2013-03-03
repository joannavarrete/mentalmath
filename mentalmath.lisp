;;;; co.uk.sorack.mentalmath.lisp

(in-package #:mentalmath)

(defparameter *total-answered* 0)

(defun practice (types)
  (let ((question (make-question types)))
    (print-question question)
    (loop 
       do (print "enter your answer ")
       until (equal (read) (reduce (car question) (cdr question))))
    (incf *total-answered*)
    (print "another one?")
    (if (equal (read) 'no) 
        (format t "answered ~d~% " *total-answered*)
        (practice types))))

(defun make-question (types)
  (ecase (pick-one-random types)
    (sum-two-by-two (list #'+ (random-two-digits) (random-two-digits)))
    (sum-three-by-three (list #'+ (random-three-digits) (random-three-digits)))
    (sub-two-by-two (list #'- (random-two-digits) (random-two-digits)))
    (sub-three-by-three (list #'- (random-three-digits) (random-three-digits)))
    (mult-two-by-one (list #'* (random-two-digits) (random-one-digit)))))

(defun get-op-from-funct (function)
  (first (cl-ppcre:all-matches-as-strings "[-+*/]" (write-to-string function))))

(defun print-question (list)
    (format t "~d ~d ~d~%" (second list) (get-op-from-funct (first list)) (third list)))

(defun pick-one-random (list)
  (nth (random-between 0 (1- (length list))) list))

(defun random-between (min max)
 (round (+ min (* (random 1.0) (- max min)))))

(defun random-one-digit()
  (random-between 1 9))

(defun random-two-digits()
  (random-between 10 99))

(defun random-three-digits()
  (random-between 100 999))

(defun random-four-digits()
  (random-between 1000 9999))
