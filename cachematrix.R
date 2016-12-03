## Put comments here that give an overall description of what your
## functions do
## Overall the function checks if the inverse of the matrix is stored previously
## in the cached data. If the matrix of which the inverse is quried for is the
## the same, then the inverse from the cached data will be returned rather than
## recomputating the same since the matrix inversion is a costly function.
## So, the two fucntions do following things:
## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve 
## the inverse from the cache.


## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
       inv <- NULL
       set <- function (y) { 
               x <<- y
               inv <<- NULL  ## Storing into the cache
               
       }
       get <-function() x  ## getting/reading the matrix
       setinv <- function (invert) inv <<- invert 
       getinv <- funvtion () inv
       list (set = set, get = get, setinv = setinv, getinv = getinv) ##function list

}


## Write a short comment describing this function
## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve 
## the inverse from the cache.
## Now this function will check whether the matrix queried for is unchanged from
## the previoius one. If yes, it will get the inverse which is previously calculated
## & stored in the cache memory.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
       inv <- x$getinv()
       if(!is.null(inv)) {
               message("getting cached data")
               return(inv)
       }
       data <- x$get()
       inv <- solve(data, ...)
       x$setinv(inv)
       inv
}
