;;;; co.uk.sorack.mentalmath.lisp

(in-package #:co.uk.sorack.mentalmath)

(defparameter *total-answered* 0)

(defun make-question (types)
  (let ((type (pick-one-random types)))
  (ecase type
    (sum-two-by-two (list #'+ (random-two-digits) (random-two-digits)))
    (sum-three-by-three (list #'+ (random-three-digits) (random-three-digits)))
    (sub-two-by-two (list #'- (random-two-digits) (random-two-digits)))
    (sub-three-by-three (list #'- (random-three-digits) (random-three-digits)))
    (mult-two-by-one (list #'* (random-two-digits) (random-one-digit))))))

(defun print-question (list)
  (let* ((op-funct (write-to-string (first list)))
         (operator (first (cl-ppcre:all-matches-as-strings "[-+*/]" op-funct))))
    (format t "~d ~d ~d~%" (second list) operator (third list))))

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
