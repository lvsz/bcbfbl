(macrolet((!(&rest b)`(cons(lambda(),@b)
(f)))(?()'(aref _ ^)))(let((^ 0)(~(open(
cadr *posix-argv*)))(_(make-array 30000)
))(defun f()(case(read-char ~'())(#\+(!(
incf(?))))(#\>(!(incf ^)))(#\,(!(setf(?)
(char-code(read-char'()'()#\U0)))))(#\<(
!(decf ^)))(#\[(cons(f)(f)))(#\.(!(princ
(code-char(?)))(force-output)))(#\]'())(
'()`(,#'exit))(#\-(!(decf(?))))(t(f))))(
defun b(f)(mapc #'(lambda(f)(typecase f(
function(funcall f))(cons(if(>(?)0)(b f)
))))f)(if(>(?)0)(b f)))(b(f)))); by lvsz
