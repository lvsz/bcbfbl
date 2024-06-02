FLAGS = --noinform --non-interactive
STACK = --control-stack-size 512
STATIC_OPTS = :toplevel '$@ :executable t :save-runtime-options t

bf: bf.lisp
	sbcl $(FLAGS) --eval '(compile-file #p"$<" :output-file "$@")'
	mv $@.fasl $@
	chmod +x $@

static: bf.lisp
	sbcl $(STACK) $(FLAGS) \
		 --eval "`echo '(defun $@ ()' && cat $< && echo ')'`" \
		 --eval "(save-lisp-and-die \"bf\" $(STATIC_OPTS))"

.PHONY: test

TEST_FILE = /tmp/_bf_test
test:
	test "`./bf tests/hello-world.b`" = "Goodbye, World!"
	./bf tests/cat.b < Makefile > $(TEST_FILE) && diff -q Makefile $(TEST_FILE)
	$(RM) $(TEST_FILE)
