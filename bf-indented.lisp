(defmacro ! (&rest b)
  `(cons (lambda () ,@b) (f)))

(defmacro ? ()
  '(aref _ ^))

; by Levi Siuzdak
(let ((_ (make-array 30000))
      (^ 0)
      (~ (open (cadr *posix-argv*))))
  (defun b (f)
    (mapc #'(lambda(f)
              (typecase f
                (function
                  (funcall f))
                (cons
                  (if (> (?) 0)
                    (b f)))))
          f)
    (if (> (?) 0)
      (b f)))
  (defun f ()
    (case (read-char ~ '())
      (#\> (! (incf ^)))
      (#\. (! (princ (code-char (?)))
              (force-output)))
      (#\, (! (setf (?) (char-code (read-char '() '() #\U0)))))
      (#\+ (! (incf (?))))
      (#\< (! (decf ^)))
      (#\[ (cons (f) (f)))
      (#\] '())
      ('() `(,#'exit))
      (#\- (! (decf (?))))
      (t (f))))
  (b (f)))

