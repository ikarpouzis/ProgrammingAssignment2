## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

rm(list = ls())
#making list which stores the inversed matrix
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x<<-y
    m<<-NULL
  }
  get <- function() x
  setsolve <- function(solve) m<<-solve 
  getsolve <- function() m
  list(set=set, get = get, setsolve = setsolve, getsolve=getsolve)
}
## making a function, which takes argument, returned by makeCacheMatrix and 
## and retrieves the previousely inversed matrix from cache

cacheSolve <- function(x, ...) {
  m <- x$getsolve() # inversed matrix, if already done
  if (!is.null(m)){ # checking if there exists inversed matrix in cache
    print("getting cached data")
    return(m)
  }
  data <- x$get() # if not previously done, 
  m <- solve(data,...) #inversing the matrix
  x$setsolve(m) # assigning inversed matrix to m
  m #returning m
}

