(defmacro !(&rest b)`(cons(lambda(),@b)(f))) ; Levi Siuzdak - 2016
(let((~(open(cadr *posix-argv*)))(b(make-array 30000))(f 0))(defun
?()(aref b f))(defun b(f)(mapc #'(lambda(f)(typecase f(function
f(funcall f))(cons(if(>(?)0)(b f)))(null(exit))))f)(if(>(?)0)(b
f)))(defun f()(case(read-char ~'())(#\<(!(decf f)))(#\>(!(incf
f)))(#\+(!(incf(aref b f))))(#\-(!(decf(aref b f))))(#\,(!(setf
(aref b f)(char-code(read-char)))))(#\.(!(princ(code-char(?)))
(force-output)))(#\[(cons(f)(f)))(#\]'($))('()'(()))(t(f))))(b(f)))
