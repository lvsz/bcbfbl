FLAGS = --noinform --quit
STACK = --control-stack-size 512 # in megabytes

bf: bf.lisp
	sbcl $(FLAGS) --eval '(compile-file #p"$<" :output-file "$@")'
	mv $@.fasl $@
	perl -i -pe 's/(--script)/$(STACK) \1/' $@
	chmod +x $@

.PHONY: core
core: bf.lisp
	sbcl $(STACK) $(FLAGS)\
		 --eval "`echo '(defun main ()' && perl -pe 's/def(macro)([^;]+)/\1let((\2)/' bf.lisp && echo '))'`"\
		 --eval "(save-lisp-and-die \"bf\" :toplevel 'main :executable t :save-runtime-options t)"

