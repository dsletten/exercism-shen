\\   Hey, Emacs, this is a -*- Mode: Shen -*- file!
\\
\\   APL is like a perfect diamond: if you add anything to it, it becomes flawed. In contrast, Lisp is like a bean bag--you can sit on a bean bag and squash it, but it will always rise again.
\\   -- Joel Moses (attributed)
\\
\\   Name:               all-your-base.shen
\\
\\   Started:            Fri Dec 20 22:28:23 2024
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

(define valid-digits?
  Digits Base -> (every? (/. Digit (and (<= 0 Digit) (< Digit Base)))
                         Digits))

(define rebase
  _ In _ -> [] where (< In 2)
  _ _ Out -> [] where (< Out 2)
  Digits In Out -> (convert (evaluate Digits In) Out) where (valid-digits? Digits In)
  _ _ _ -> [])

(define convert
  N Base -> (convert-base N Base []) where (>= N 0))

(define convert-base
  N Base Result -> [N|Result] where (< N Base)
  N Base Result -> (let Q (div N Base)
                        R (mod N Base)
                     (convert-base Q Base [R|Result])))

(define evaluate
  Digits Base -> (foldl (/. Sum Digit (+ (* Sum Base) Digit)) 0 Digits))

\* (217-) (rebase [1] 2 10) *\
\* [1] *\

\* (218-) (rebase [1 0 1] 2 10) *\
\* [5] *\

\* (219-) (rebase [5] 10 2) *\
\* [1 0 1] *\

\* (220-) (rebase [1 0 1 0 1 0] 2 10) *\
\* [4 2] *\

\* (221-) (rebase [4 2] 10 2) *\
\* [1 0 1 0 1 0] *\

\* (222-) (rebase [1 1 2 0] 3 16) *\
\* [2 10] *\

\* (223-) (rebase [2 10] 16 3) *\
\* [1 1 2 0] *\

\* (224-) (rebase [3 46 60] 97 73) *\
\* [6 10 45] *\

\* (225-) (rebase [0] 10 2) *\
\* [0] *\

\* (226-) (rebase [0 0 0] 10 2) *\
\* [0] *\

\* (227-) (rebase [0 6 0] 7 10) *\
\* [4 2] *\

\* (228-) (rebase [0] 1 10) *\
\* [] *\

\* (229-) (rebase [] 2 10) *\
\* [0] *\

\* (230-) (rebase [] 0 10) *\
\* [] *\

\* (231-) (rebase [1] -2 10) *\
\* [] *\

\* (232-) (rebase [1 -1 1 0 1 0] 2 10) *\
\* [] *\

\* (233-) (rebase [1 2 1 0 1 0] 2 10) *\
\* [] *\

\* (234-) (rebase [1 0 1 0 1 0] 2 1) *\
\* [] *\

\* (235-) (rebase [7] 10 0) *\
\* [] *\

\* (236-) (rebase [1] 2 -7) *\
\* [] *\

\* (237-) (rebase [1] -2 -7) *\
\* [] *\

