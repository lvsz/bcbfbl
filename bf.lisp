(macrolet((!(&rest b)`(; by Levi Siuzdak - 2016
cons(lambda(),@b)(f)))(?()'(aref _ ^)))(let((~(
open(cadr *posix-argv*)))(_(make-array 30000))(
^ 0))(defun f()(case(read-char ~'())(#\+(!(incf
(?))))(#\>(!(incf ^)))(#\,(!(setf(?)(char-code(
read-char'()'()#\U0)))))(#\.(!(princ(code-char(
?)))(force-output)))(#\<(!(decf ^)))(#\[(cons(f
)(f)))(#\]'())('()`(,#'exit))(#\-(!(decf(?))))(
t(f))))(defun b(f)(mapc #'(lambda(f)(typecase f
(function(funcall f))(cons(if(>(?)0)(b f)))))f)
(if(>(?)0)(b f)))(b(f))))
