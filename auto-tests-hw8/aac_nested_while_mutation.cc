# ARGS
# RESULT 0
(seq (set 1 m0)
     (while (!= m0 0)
            (set (while false 3) m0)))


#returns 0 because second while fails, making m0 zero
