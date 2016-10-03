FLAGS = --noinform --quit
STACK = --control-stack-size 512 # in megabytes

bf: bf.lisp
	sbcl $(FLAGS) --eval '(compile-file #p"$^" :output-file "$@")'
	mv $@.fasl $@
	perl -i -pe 's/(--script)/$(STACK) \1/' $@
	chmod +x $@
