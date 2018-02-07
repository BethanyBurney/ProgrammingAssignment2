## Together these functions will take a matrix
## and find its inverse. Rather than recomputing 
## the inverse, it will cache the inverse and only
## recompute the inverse when the matrix has changed.

## This function will initialize the variable i
## to NUll and cache the value into get. 
## The function is a vector holding commands set,
## get, setinv, and getinv.

makeCacheMatrix <- function (x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinv <- function(inv) i <<- inv
  getinv <- function() i
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## This function finds the cached variable inv and checks 
## to see if it is not Null. If inv is Null, then the matrix 
## has not changed and the inv is pulled from the cache vector. 
## if inv is Null, the function gets the new data and computes 
## a new inverse using the solve funtion. 
## The new inv is then cached. 

cacheSolve <- function(x, ...) {
  i <- x$getinv()
  if(! is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinv(i)
  i
}
