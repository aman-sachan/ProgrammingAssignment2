# See README.md for instructions on running the code and output from it

# makeCacheMatrix is a function that returns a list of functions
# Its puspose is to store a martix and a cached value of the inverse of the 
# matrix. Contains the following functions:
# setMatrix      set the value of a matrix
# getMatrix      get the value of a matrix
# cacheInverse   get the cached value (inverse of the matrix)
# getInverse     get the cached value (inverse of the matrix)

makeCacheMatrix <- function(x = numeric()) {
  
#holds the cached value
#intializing the variable "cached" to NULL which will store the cached value
cached <- NULL
  
# store a matrix
setMatrix <- function(newValue) {
x <<- newValue
#Matrix is being assigned a new value
#Reassign cache as NULL
cached <<- NULL
  }
  
#returns the value of the stored matrix
getMatrix <- function() {
x
}
  
# cache the given argument 
cacheInverse <- function(solve) {
    cached <<- solve
  }
  
  # get the cached value
  getInverse <- function() {
    cached
  }
  
  # return a list. Each named element of the list is a function
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


# The following function calculates the inverse of a "special" matrix created with makeCacheMatrix
cacheSolve <- function(y, ...) {
  # get the cached value
  inverse <- y$getInverse()
  # if a cached value exists return it
  if(!is.null(inverse)) {
    message("Extracting Cached Data")
    return(inverse)
  }
  # otherwise get the matrix, caclulate the inverse and store it in
  # the cache
  data <- y$getMatrix()
  inverse <- solve(data)
  y$cacheInverse(inverse)
  
  # return the inverse
  inverse
}
