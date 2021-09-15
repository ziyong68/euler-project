library(microbenchmark)

microbenchmark(sum(seq(1,999)[seq(1,999) %% 3 == 0 | seq(1,999) %% 5 == 0]), times =1000)
