\\   Hey, Emacs, this is a -*- Mode: Shen -*- file!
\\
\\   Lisp...not just beautiful, but strangely beautiful.
\\   -- Paul Graham
\\
\\   Name:               luhn.shen
\\
\\   Started:            Thu Dec 19 23:44:05 2024
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

(define valid?
  Input -> (let Trimmed (remove-if (fn whitespace?) (string->list Input))
                Cleaned (filter (fn digit?) Trimmed)
             (if (= Cleaned Trimmed)
                 (let Digits (mapcan (fn read-from-string) Cleaned)
                   (if (> (length Digits) 1)
                       (validate-digits Digits)
                       false))
                 false)))

(define validate-digits
  Digits -> (let Reversed-Digits (reverse Digits)
                 Transformed-Digits (transform-digits Reversed-Digits)
              (= 0 (mod (foldl (fn +) 0 Transformed-Digits) 10))))

(define transform-digits
  [] -> []
  [D|Ds] -> (transform-a D Ds))

(define transform
  D -> (let Q (div D 5)
            R (mod D 5)
         (+ (* 2 R) Q)))

(define transform-a
  D [] -> [D]
  D0 [D|Ds] -> [D0|(transform-b D Ds)])

(define transform-b
  D [] -> [(transform D)]
  D Ds -> [(transform D)|(transform-digits Ds)])

\\    Invalid
\* (valid? "1") *\
\* (valid? "0") *\
\* (valid? "055 444 286") *\
\* (valid? "8273 1232 7352 0569") *\
\* (valid? "1 2345 6789 1234 5678 9012") *\
\* (valid? "1 2345 6789 1234 5678 9013") *\
\* (valid? "059a") *\
\* (valid? "055-444-285") *\
\* (valid? "055# 444$ 285") *\
\* (valid? " 0") *\
\* (valid? "055b 444 285") *\
\* (valid? ":9") *\
\* (valid? "59%59") *\

\\    Valid
\* (valid? "059") *\
\* (valid? "59") *\
\* (valid? "055 444 285") *\
\* (valid? "095 245 88") *\
\* (valid? "234 567 891 234") *\
\* (valid? "0000 0") *\
\* (valid? "091") *\
\* (valid? "9999999999 9999999999 9999999999 9999999999") *\
\* (valid? "109") *\
