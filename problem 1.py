
def factorial(n):
  if n==1:
    return 1
  else:
    return n * factorial(n-1)

factorial(3)


# If we list all the natural (integer that is greater than 0) numbers below 10 that are multiples of 3 or 5, 
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

sum(i for i in range(1,1000) if i%3==0 or i%5==0)
