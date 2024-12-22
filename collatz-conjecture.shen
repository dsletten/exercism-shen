\\   Hey, Emacs, this is a -*- Mode: Shen -*- file!
\\
\\   LISP has been jokingly described as "the most intelligent way to misuse a computer".
\\   -- Edsger W. Dijkstra
\\
\\   Name:               collatz-conjecture.shen
\\
\\   Started:            Sun Dec 22 12:02:00 2024
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


(define collatz
  N -> nil where (< N 1)
  N -> (collatz-length N 0))

(define collatz-length
  1 L -> L
  N L -> (collatz-length (/ N 2) (+ L 1)) where (even? N)
  N L -> (collatz-length (+ (* 3 N) 1) (+ L 1)))

\* (collatz 1) *\
\* 0 *\
\* (collatz 16) *\
\* 4 *\
\* (collatz 12) *\
\* 9 *\
\* (collatz 1000000) *\
\* 152 *\
\* (collatz 0) *\
\* nil *\
\* (collatz -15) *\
\* nil *\
