## Compute and cache the inverse of a matrix

## Create a matrix object that can cache its inverse

makeCacheMatrix <- function(x = numeric()) {
    m <- NULL
    set <- function(y) {
    	x <<- y
    	m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
    setinverse = setinverse,
    getinverse = getinverse)
}


## Computes the inverse of the matrix returned from makeCacheMatrix

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
	m <- x$getinverse()
    if(!is.null(m)){
        message("getting cached data")
        return (m)
    }
    data <- x$get()
    #m <- solve(data, ...) %*% x
    m <- solve(data)
    x$setinverse(m)
    m
}
