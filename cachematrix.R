## Put comments here that give an overall description of what your
## functions do

## Usage: matrixCacheMatrix(x) -> y.  cacheSolve(y)

## return vector containing list of functions for getting solve(x) or cached
## version of solve(x)

matrixCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
                }
        get <- function() x
        getinverse <- function() m
        setinverse <- function(solve) m <<- solve
        list(set = set, get = get, getinverse = getinverse, setinverse = setinverse)
}

## main function - assuming matrixCacheMatrix has created list of functions
## for x, return solve(x) or cached solve(x) if exists
cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        } else {
                message("is null")
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}

