FLAGS = --noinform --quit --eval

bf: bf.lisp
	sbcl $(FLAGS) '(compile-file #p"$^" :output-file "$@")'
	mv $@.fasl $@
	chmod +x $@
