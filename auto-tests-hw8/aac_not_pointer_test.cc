# ARGS
# RESULT 8
(seq
    (set 8 m1)
    (seq (set m1 m2)
         (seq (set 4 m1)
          m2)))


# m1 = 8
# m2 = m1
# m1 = 4
# return m2 ( should be 8 bc values not pointers )
