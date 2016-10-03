bf: bf.lisp
	sbcl --eval '(compile-file #p"bf.lisp" :output-file (parse-native-namestring "bf"))' --quit
	mv bf.fasl bf
	chmod +x bf
