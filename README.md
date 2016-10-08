## About BCBFBL
Business BrainFuck Based on Lisp lists is a 492 byte brainfuck interpreter written in Common Lisp, and inspired by Krzysztof Gabis' [Business Card Brainfuck](https://github.com/kgabis/business-card-brainfuck).  
Its most unusual feature is the way it handles brainfuck's `[` and `]` commands. Every brainfuck compiler or interpreter I've seen so far either backtracks or jumps to the matching bracket. Instead, BCBFBL uses these to transform brainfuck code to nested lists of lambdas, which recursively get mapped with `funcall`. This method can make it slightly faster for certain programs – e.g. [the Mandelbrot set](http://esoteric.sange.fi/brainfuck/utils/mandelbrot/mandelbrot.b) – than other non-optimizing interpreters written C, despite using arbitrary precision arithmetic – though this could be disabled with some extra code.

## Code
```Lisp
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
- Output happens through UTF-8 code points rather than bytes, i.e. to print a multibyte character like `€`, use `.` on its UTF-8 code point (8364), instead of its individual bytes (226, 130, and 172). This has no effect on programs that only print ASCII characters.  
- The default stack size is 512 MB, this should be enough for any actual brainfuck file out there, but if it isn't, adjust the `STACK` variable in the make file, and let me know I'm wrong.
