## About BCBFBL
Business BrainFuck Based on Lisp lists is a 495 byte brainfuck interpreter written in Common Lisp, and inspired by Krzysztof Gabis' [Business Card Brainfuck](https://github.com/kgabis/business-card-brainfuck).  
Its most unique feature is the way it handles brainfuck's `[` and `]` commands. Every brainfuck compiler or interpreter I've seen so far either backtracks or jumps to the matching bracket. Instead, BCBFBL uses these to transform brainfuck code to nested lists of lambdas, which recursively get mapped with `funcall`. This method can make it slightly faster for certain programs – e.g. [the Mandelbrot set](http://esoteric.sange.fi/brainfuck/utils/mandelbrot/mandelbrot.b) – than other non-optimizing interpreters written C and the like, despite using arbitrary precision arithmetic – though this could be disabled with some extra code.

## Code
```Lisp
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
```
Aside from being a brainfuck implementation in Lisp, this is also valid brainfuck code that will return the same output it is given (like `cat`).

## Usage
```
make
./bf tests/hello-world.b
./bf bf.lisp < bf.lisp
```
This assumes you have [SBCL](http://www.sbcl.org) installed, and compiles to bytecode by default.  
Making BCBFBL work with a different Common Lisp implementation should be fairly straightforward, just replace `*posix-argv*` and `exit` with their equivalent.

To create a static standalone binary:  
```
make static
```
Though this isn't recommended, as the resulting executable will probably be around 50 MB in size due to including the entire SBCL runtime.

## Limitations
* BCBFBL should work for any brainfuck program that doesn't rely on cell wrap or negative tape indices.
* Any non-positive cell value will count as a zero when evaluating `[` and `]`.
* Output happens through UTF-8 code points rather than bytes, i.e. to print a multibyte character like `€` (U+20AC, 8364 in decimal), use a `.` on its UTF-8 code point (8364), instead of its individual bytes (226, 130, and 172). This has no effect on programs that only print ASCII characters.
* The default stack size is 512 MB, this should be enough for any actual brainfuck file out there, but if it isn't, adjust the `STACK` variable in the make file, and let me know I'm wrong.
