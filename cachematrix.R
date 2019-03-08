# Assignment Week 3 - Lexical Scoping 

# Purpose of assignment: lexical scoping - the mechanism within R that determines how R finds symbols to retrieve their values during the execution of an R script 

# Caching - way to store objects in memory to accelerate subsequence access to the same object; cache it in memory rather than repeatedly recalculating expensive computations 

# Learn and implement caching; temporarily storing data for use until no longer required - time saving function, especially with large datasets 

# Code provided 
    new_vector <- function(x = 1:1000) {
        m <- NULL
        set <- function(y) {  # set() assignment input argument to x and NULL to m 
            x <<- y # <<- is syntax used to assign values to R objects 
            m <<- NULL # initializes as object within makeVector() environment to be used by later code in the function
        }
        get <- function() x
        setmean <- function(mean) m <<- mean # setters (mutator)
        getmean <- function() m # getters (accessor)
        list(set = set, # names the set function 'set'
             get = get, # names the get function 'get'
             setmean = setmean, # names the setmean function 'setmean'
             getmean = getmean) # names the getmean function 'getmean'
    }
    
    cachemean <- function(x = 1:1000) {
        m <- x$getmean()
        if(!is.null(m)) {
            message("getting cached data")
            return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
    }
    
 
# Assignment  
    cacheSolve <- function(x = 1:1000) { # Produces a matrix that is the inverse of 'x'
        inverse_data <- x$getInverse() # inverse calculated here 
        if(!is.null(inv)) { # if it isn't null, then take the inverse 
            return(inv)
        }
        data2 <- x$get()
        inverse <- solve(inverse_matrix)
        x$setInverse(inverse_data)
        inverse_data   
    }
    
    # since x is an invtertible matrix, solve(x) should return its inverse 
    solve(x) 
    # it says that object x is not found 
 
    