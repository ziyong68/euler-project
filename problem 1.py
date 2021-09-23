# Recursive algorithm
def factorial(n):
  if n==1:
    return 1
  else:
    return n * factorial(n-1)

factorial(3)

# Question
# If we list all the natural (integer that is greater than 0) numbers below 10 that are multiples of 3 or 5, 
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

import timeit
import numpy as np

# list comprehension
sum(i for i in range(1,1000) if i%3==0 or i%5==0)

timeit.timeit('sum(i for i in range(1,1000) if i%3==0 or i%5==0)', number = 10000)/10000


# Vectorization in python through numpy array
arr = np.array(range(1,1000))
np.sum(arr[(arr%3==0)|(arr%5==0)])

setup_code = '''import numpy as np'''
main_code = '''arr = np.array(range(1,1000))
np.sum(arr[(arr%3==0)|(arr%5==0)])'''

timeit.timeit(setup = setup_code, stmt = main_code, number = 10000)/10000

# R is faster for number 1
