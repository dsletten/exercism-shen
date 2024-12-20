\\   Hey, Emacs, this is a -*- Mode: Shen -*- file!
\\
\\   Programming should be fun. Programs should be beautiful.
\\   -- Paul Graham
\\
\\   Name:               pythagorean-triplet.shen
\\
\\   Started:            Thu Dec 19 23:10:56 2024
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

(define right-isoceles-perimeter-ratio
  -> (+ 1 1 (sqrt2)))

(define triplets-with-sum
  N -> (collect-triplets N 1 (floor (/ N (right-isoceles-perimeter-ratio))) []))

(define collect-triplets
  _ A L R -> R where (> A L)
  N A L R -> (let Numerator (+ (expt A 2) (expt (- N A) 2))
                  Denominator (* 2 (- N A))
                  C (div Numerator Denominator)
               (collect-triplets N (+ A 1) L (if (= 0 (mod Numerator Denominator))
                                                 (cons [A (- (- N A) C) C] R)
                                                 R))))

\* (123-) (triplets-with-sum 12) *\
\* [[3 4 5]] *\

\* (124-) (triplets-with-sum 108) *\
\* [[27 36 45]] *\

\* (125-) (triplets-with-sum 1000) *\
\* [[200 375 425]] *\

\* (126-) (triplets-with-sum 1001) *\
\* [] *\

\* (127-) (triplets-with-sum 90) *\
\* [[15 36 39] [9 40 41]] *\

\* (128-) (triplets-with-sum 840) *\
\* [[240 252 348] [210 280 350] [168 315 357] [140 336 364] [120 350 370] [105 360 375] [56 390 394] [40 399 401]] *\

\* (129-) (triplets-with-sum 30000) *\
\* [[7500 10000 12500] [6000 11250 12750] [5000 12000 13000] [1875 14000 14125] [1200 14375 14425]] *\
