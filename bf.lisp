(defmacro !(&rest b)`(cons(lambda(),@b)(f)))
(let((b(make-array 30000))(f 0) ;; Levi Siuzdak - 2016
(~(open(cadr *posix-argv*))))(defun ?()(aref b f))(defun
b(f)(mapc #'(lambda(f)(typecase f(function f(funcall f))
(cons(if(>(?)0)(b f)))))f)(if(>(?)0)(b f)))(defun f()
(case(read-char ~'())(#\<(!(decf f)))(#\>(!(incf f)))
(#\+(!(incf(aref b f))))(#\-(!(decf(aref b f))))(#\.
(!(princ(code-char(?)))(force-output)))(#\,(!(setf
(aref b f)(char-code(read-char'()'()#\U0)))))(#\[
(cons(f)(f)))(#\]'())('()`(,#'exit))(t(f))))(b(f)))
