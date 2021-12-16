# longest Collatz sequence

# n -> n/2 (n is even)
# n -> 3n + 1 (n is odd)

# Which starting number, under one million, produces the longest chain?

library(microbenchmark)
library(ggplot2)

# Summation of collatz sequence (recursive)
sum_collatz <- function(n){
  if(n>1){
    
    if(n%%2==0){
      i <- n/2
    } else {
      i <- 3*n+1
    }
    
    return(n + sum_collatz(i))
    
  } else {
    return(1)
  }
}

sum_collatz(13)

# showing collatz sequence (recursive)
seq_collatz <- function(n){
  if(n>1){
    
    if(n%%2==0){
      i <- n/2
    } else {
      i <- 3*n+1
    }
    
    return(c(n, seq_collatz(i)))
    
  } else {
    return(1)
  }
}

seq_collatz(13)

# showing collatz sequence (while loop)
seq2_collatz <- function(n){
  
  s <- n
  
  while(n!=1){
    
    if(n%%2==0){
      n <- n/2
    } else {
      n <- 3*n+1
    }
    
    s<-c(s,n)
    
  }
  
  return(s)
  
}

seq2_collatz(13)

# Compare collatz sequence function using recursive vs while loop

recur <- microbenchmark(seq_collatz(10^9), times = 10000)

while_loop <- microbenchmark(seq2_collatz(10^9), times = 10000)

df <- data.frame(algo = c(rep("recursive", length(recur$time)), rep("while_loop", length(while_loop$time))), 
                 t = c(recur$time, while_loop$time))

# Histogram with kernel density
ggplot(df[df$t < 2*10^5,], aes(x = t, color = algo, fill = algo)) + 
  geom_histogram(aes(y = ..density..), fill = "white", color = "black") +
  geom_density(lwd = 1, alpha = 0.25)

# while loop is faster

cahin_length <-
  sapply(c(1:1000), function(x){
    length(seq2_collatz(x))
  })
