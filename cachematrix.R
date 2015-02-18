## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# This function return 4 functions
# * setMatrix   set the matrix
# * getMatrix   get the matrix
# * setCacheMatrix  set the cached matrix
# * getCacheMatrix  get the cached matrix


makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  setMatrix <- function(y) {
    x <<- y
    m <<- NULL
  }
  getMatrix <- function() x
  setCacheMatrix <- function(solve) m <<- solve
  getCacheMatrix <- function() m
  list(setMatrix = setMatrix, getMatrix = getMatrix,
       setCacheMatrix = setCacheMatrix,
       getCacheMatrix = getCacheMatrix)

}


## cacheSolve calculate the inverse of the matrix 
## using a  cache created with makeCacheMatrix


cacheSolve <- function(x=matrix(), ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getCacheMatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  matrix <- x$getMatrix()
  m <- solve(matrix, ...)
  x$setCacheMatrix(m)
  m
}
