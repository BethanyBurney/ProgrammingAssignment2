## Together these functions will take a matrix
## and find its inverse. Rather than recomputing 
## the inverse, it will cache the inverse and only
## recompute the inverse when the matrix has changed.

## This function will initialize the variable inv 
## to NUll and chache the value into getreverse. 
## The function is a vector holding commands set,
## get, setreverse, and getreverse.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
    
  }
  get <- function()x
  setreverse <- function(reverse) inv <<- reverse
  getreverse <- function() inv
  list(set = set, get = get, 
       setreverse = setreverse,
       getreverse = getreverse)
}


## This function finds the cached variable inv and checks 
## to see if it is not Null. If inv is Null, then the matrix 
## has not changed and the inv is pulled from the cache vector. 
## if inv is Null, the function gets the new data and computes 
## a new inverse using the solve funtion. 
## The new inv is then cached. 

cacheSolve <- function(x, ...) {
  inv <- x$getreverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(m)
    
  }
  data <- x$get()
  r <- nrow(x)
  c <- ncol(x)
  i <- diag(1, r, c)
  inv <- solve(data, i, ...)
  x$setreverse(m)
  m
}
