## These functions demonstrate lexical scoping



## Creates a special container matrix and lists 4 functions that
## set the matrix, get the matrix, solve the matrix (create the inverse)
## and get the solved matrix
makeCacheMatrix <- function(x = numeric()) {
        
	m <- NULL
        
	set <- function(y) {
                
		x <<- y
                
		m <<- NULL
        
		}
        
	get <- function() x
        
		setsolve <- function(solve) m <<- solve
        
		getsolve <- function() m
        
		list(set = set, 
		get = get,
             
		setsolve = setsolve,
             
		getsolve = getsolve)

}


## Determine if the matrix has already been solved in cache
cacheSolve <- function(x,...){
	m <- x$getsolve()
	if(!is.null(m)){
	message("getting cached data")
	return(m)
	}
	data <- x$get()
	m <- solve(data,...)
	x$setsolve(m)
	m
## Return a matrix that is the inverse of 'x'
}