## Put comments here that give an overall description of what your
## functions do

# Overall the understanding of the functions are pretty self explanatory, 
# since both work the same as makevVector() and cachemean() 
# just insted of "mean", "solve" is used and the answer 
# is store in the object named "s" 

## Write a short comment describing this function

# This function creates an object that contains 4 functions and 
# two groups of data, the result is a list, first the object
# "s" is emptied, a function "set" is generated that allows you to
# change the matrix without having to run the function again,
# the get function will save the data, setinv will assign
# a value "inv" if it exists, getinv will give us the solution 
# if it exists.

makeCacheMatrix <- function(x = matrix){
        s <- NULL
        set <- function(y){
                x <<- y
                s <<- NULL
        }
        get <- function() x
        setinv <- function(inv) s <<- inv
        getinv <- function() s
        list( set = set,
              get = get,
              setinv = setinv,
              getinv = getinv)
}


## Write a short comment describing this function

# It takes an object of type "makeCacheMatrix" it checks its
# elements and acts according to what it finds, if it finds
# an object "s" it prints it, if not, it calculates it 
# using the functions inside the object makeCacheMatrix

cacheSolve <- function(x, ...){
        s <- x$getinv()
        if (!is.null(s)) {
                message("getting cache data")
                return(s)
        }
        data <- x$get()
        s <- solve(data, ...)
        x$setinv(s)
        s
}


# La cucaramacara títere fue

