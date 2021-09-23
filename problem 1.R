library(microbenchmark)

microbenchmark({
  tt <- seq(1,999)
  sum(tt[tt %% 3 == 0 | tt %% 5 == 0])
  }, times =10000)

# R is significantly faster for problem 1
