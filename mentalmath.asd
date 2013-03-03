;;;; co.uk.sorack.mentalmath.asd

(asdf:defsystem #:mentalmath
    :serial t
    :description "Describe co.uk.sorack.mentalmath here"
    :author "Your Name <your.name@example.com>"
    :license "Specify license here"
    :depends-on (:cl-ppcre)
    :components ((:file "package")
                 (:file "mentalmath")))

