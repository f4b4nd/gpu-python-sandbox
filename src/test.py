#from numba import jit, cuda
import numpy as np

from timeit import default_timer as timer   
  
SAMPLE_SIZE = 100_000_000

# normal function to run on cpu
def func(a):                                
    for i in range(SAMPLE_SIZE):
        a[i]+= 1      
  
# function optimized to run on gpu 
#@jit(target_backend='cuda')                         
def gpu_func(a):
    for i in range(SAMPLE_SIZE):
        a[i]+= 1

if __name__=="__main__":
    n = SAMPLE_SIZE                            
    a = np.ones(n, dtype = np.float64)

    start = timer()
    func(a)
    print("without GPU:", timer()-start)    
      
    #start = timer()
    #gpu_func(a)
    #print("with GPU:", timer()-start)

