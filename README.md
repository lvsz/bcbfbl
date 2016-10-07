## About BCBFBL
Business BrainFuck Based on Lisp lists is a brainfuck interpreter written in Common Lisp, and inspired by Krzysztof Gabis' [Business Card Brainfuck](https://github.com/kgabis/business-card-brainfuck).  
What's unique about it, is the way it interprets brainfuck commands, more specifically `[` and `]`. All brainfuck compilers and interpreters I've seen so far either backtrack or jump to the matching bracket. Instead, BCBFBL transforms brainfuck code to nested lists of lambdas, which recursively get mapped with `funcall`, this can make it slightly faster for certain programs – like [the Mandelbrot set](http://esoteric.sange.fi/brainfuck/utils/mandelbrot/mandelbrot.b) – than other non-optimizing interpreters.  
Another thing common in brainfuck interpreters, is that they limit both tape and cell sizes, which means they're actually finite state machines. BCBFBL on the other hand has unbounded cell sizes, making it a true Turing tarpit.

## Code
```Lisp
(defmacro !(&rest b)`(cons(lambda(),@b)(f)))
(let((b(make-array 30000))(f 0) ;; Levi Siuzdak - 2016
(~(open(cadr *posix-argv*))))(defun ?()(aref b f))(defun
b(f)(mapc #'(lambda(f)(typecase f(function(funcall f))
(cons(if(>(?)0)(b f)))))f)(if(>(?)0)(b f)))(defun f()
(case(read-char ~'())(#\<(!(decf f)))(#\>(!(incf f)))
(#\+(!(incf(aref b f))))(#\-(!(decf(aref b f))))(#\.
(!(princ(code-char(?)))(force-output)))(#\,(!(setf
(aref b f)(char-code(read-char'()'()#\U0)))))(#\[
(cons(f)(f)))(#\]'())('()`(,#'exit))(t(f))))(b(f)))
```
There are two other versions included that are semantically identical, but easier on the eyes. One just has sensible indentation, the other also has sensible variable names and no unhygienic macros.

## Usage
```
make
./bf tests/hello-world.b
./bf tests/cat.b < bf.lisp
```
This assumes you have [SBCL](http://www.sbcl.org) installed, and compiles to bytecode by default.  
Making BCBFBL work with a different Common Lisp implementation should be fairly straightforward, just replace `*posix-argv*` and `exit` with their equivalent.

To create a static standalone binary:  
```
make static
```
Though this isn't recommended, as the resulting executable will probably be around 50 MB in size due to including the entire SBCL runtime.

## Limitations
- BCBFBL should work for any brainfuck program that doesn't rely on cell wrap or negative tape indices.  
- Output happens through UTF-8 code points rather than bytes, i.e. to print a multibyte character like `€`, use `.` once on a value of 8364, instead of thrice on the values 226, 130, and 172. This has no effect on programs that only print ASCII characters.  
- The default stack size is 512 MB, this should be enough for any actual brainfuck file out there, but if it isn't, adjust the `STACK` variable in Makefile, and let me know I'm wrong.
