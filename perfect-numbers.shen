\\   Hey, Emacs, this is a -*- Mode: Shen -*- file!
\\
\\   Programming should be fun. Programs should be beautiful.
\\   -- Paul Graham
\\
\\   Name:               perfect-numbers.shen
\\
\\   Started:            Wed Dec 18 03:00:27 2024
\\   Modifications:
\\
\\   Purpose:
\\
\\
\\
\\   Calling Sequence:
\\
\\
\\   Inputs:
\\
\\   Outputs:
\\
\\   Example:
\\
\\   Notes:
\\
\\

(define divides?
  D N -> (= 0 (mod N D)))

(define make-range
  Start Stop -> (make-range-aux Start (+ (- Stop Start) 1) 1 []) where (> Stop Start)
  Start Stop -> (make-range-aux Start (+ (- Start Stop) 1) -1 []) where (> Start Stop))

(define make-range-aux
  _ 0 _ Result -> (reverse Result)
  I N Step Result -> (make-range-aux (+ I Step) (- N 1) Step (cons I Result)))
  
\* (define aliquot-factors *\
\*   N -> (filter (/. D (divides? D N)) (make-range 1 (div N 2)))) *\



(define classify
  N -> (examine N (sum (aliquot-factors N))) where (positive? N))

(define examine
  N N -> "perfect"
  N Sum -> "deficient" where (< Sum N)
  N _ -> "abundant")

\\
\\    Need to use `ceiling' here to simplify termination test in `factors'
\\    I.e., I = L => done
\\
(define aliquot-factors
  N -> (remove N (factors N 1 (ceiling (sqrt N)) [])))

(define perfect?
  N -> (= N (sum (aliquot-factors N))))

\* (define factors *\
\*   _ L L R -> R *\
\*   N I L R -> (if (= 0 (mod N I)) *\
\*                  (let J (/ N I) *\
\*                    (if (= I J) *\
\*                        (factors N (+ 1 I) L (cons I R)) *\
\*                        (factors N (+ 1 I) L (cons J (cons I R)))) ) *\
\*                  (factors N (+ 1 I) L R))) *\

\\
\\    Inputs M J I R
\\    If M = 0, then I is a factor. J is too, but only keep it if I != J.
\\    见 Common Lisp LOOP version
\\
(define add-factors
  0 I I R -> (cons I R)
  0 J I R -> (cons J (cons I R))
  _ _ _ R -> R)

(define factors
  _ L L R -> R
  N I L R -> (factors N (+ 1 I) L (add-factors (mod N I) (/ N I) I R)))
