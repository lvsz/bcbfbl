(let((+(open(cadr *posix-argv*)))($; Written
(make-array 30000))(^ 0))(macrolet(; by Levi
(!(&rest b)`(cons(lambda(),@b)(f))); Siuzdak
(?()'(aref $ ^)))(defun b(f)(mapc #'(lambda(
f)(if(consp f)(if(>(?)0)(b f))(funcall f)))f
)(if(< 0(?))(b f)))(defun f()(case(read-char
+'())(#\[(cons(f)(f)))(#\.(!(princ(code-char
(?)))))(#\>(!(incf ^)))(#\+(!(incf(?))))(#\-
(!(decf(?))))('nil`(,#'exit))(#\]'())(#\,(!(
force-output)(setf(?)(char-code(read-char'()
'()#\U0)))))(#\<(!(decf ^)))(t(f))))(b(f))))
