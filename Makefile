FLAGS = --noinform --non-interactive
STACK = --control-stack-size 512

bf: bf.lisp
	sbcl $(FLAGS) --eval '(compile-file #p"$<" :output-file "$@")'
	head -1 $@.fasl | sed -E 's|^(#!/.+)--|\1$(STACK) --|' > $@
	sed 1d $@.fasl >> $@
	rm -f $@.fasl
	chmod +x $@

.PHONY: static
static: bf.lisp
	sbcl $(STACK) $(FLAGS) \
		 --eval "`echo '(defun main ()' && cat $< && echo ')'`" \
		 --eval "(save-lisp-and-die \"bf\" :toplevel 'main :executable t :save-runtime-options t)"

