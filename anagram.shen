\\   Hey, Emacs, this is a -*- Mode: Shen -*- file!
\\
\\   What I like about Lisp is that you can feel the bits between your toes.
\\   -- Drew McDermott
\\
\\   Name:               anagram.shen
\\
\\   Started:            Sat Dec 21 23:35:45 2024
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

\\ !!!!!!!!!!!!!!!!!!!!!!!!!!!!
\* (define anagram? *\
\*   Word Candidate -> (= (sort (fn string<?) (string->list (lowercase Word))) *\
\*                        (sort (fn string<?) (string->list (lowercase Candidate)))) ) *\

(define anagram?
  Word Candidate -> (= (sort (fn string<?) (string->list (string.map (fn lowercase) Word)))
                       (sort (fn string<?) (string->list (string.map (fn lowercase) Candidate)))) )

\* (define anagrams-for *\
\*   Subject Candidates -> (filter (/. Candidate (anagram? Subject Candidate)) *\
\*                                 (remove Subject Candidates))) *\

(define anagrams-for
  Subject Candidates -> (filter (/. Candidate (anagram? Subject Candidate))
                                (remove-if (/. Candidate (= (string.map (fn lowercase) Subject)
                                                            (string.map (fn lowercase) Candidate)))
                                           Candidates)))

\\ (test handles-case-of-greek-letters
\\   (is (equal '("ΒΓΑ" "γβα") (anagram:anagrams-for "ΑΒΓ" '("ΒΓΑ" "ΒΓΔ" "γβα" "αβγ")))))

\* (anagrams-for "diaper" ["hello" "world" "zombies" "pants"]) *\
\* (anagrams-for "solemn" ["lemons" "cherry" "melons"]) *\
\* (anagrams-for "good" ["dog" "goody"]) *\
\* (anagrams-for "listen" ["enlists" "google" "inlets" "banana"]) *\
\* (anagrams-for "allergy" ["gallery" "ballerina" "regally" "clergy" "largely" "leading"]) *\
\* (anagrams-for "nose" ["Eons" "ONES"]) *\
\* (anagrams-for "Orchestra" ["cashregister" "Carthorse" "radishes"]) *\
\* (anagrams-for "Orchestra" ["cashregister" "carthorse" "radishes"]) *\
\* (anagrams-for "orchestra" ["cashregister" "Carthorse" "radishes"]) *\
\* (anagrams-for "go" ["goGoGO"]) *\
\* (anagrams-for "tapper" ["patter"]) *\
\* (anagrams-for "BANANA" ["BANANA"]) *\
\* (anagrams-for "BANANA" ["Banana"]) *\
\* (anagrams-for "BANANA" ["banana"]) *\
\* (anagrams-for "LISTEN" ["LISTEN" "Silent"]) *\
\* (anagrams-for "ΑΒΓ" ["ΒΓΑ" "ΒΓΔ" "γβα" "αβγ"]) *\
\* (anagrams-for "a⬂" ["€a"]) *\
