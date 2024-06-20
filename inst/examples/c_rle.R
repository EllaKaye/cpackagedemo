x <- c(1, 1, 3, 3, 3, 3, 2, 2, 2)
y <- c(1, 1, 3, 3, 3, 3, 2, 2, 4)
z <- c(rep(1.2, 3), rep(2.4, 2))

source("./inst/examples/csource.R")  # defines csource

csource("./inst/examples/c_rle1.c") # only returns one vector
csource("./inst/examples/c_rle2.c") # returns list, R post-processing
# Ideally, would do a version that handles NAs
# Could try a pure C version, then a wrapper with the API?
# But the C function would need to return a struct and not sure how to deal with those.
csource("./inst/examples/c_rle.c") # returns list, R post-processing

# does this csource function work with scripts from base R?

c_rle(x)
c_rle(y)
c_rle(z)

identical(rle(x), c_rle(x))
identical(rle(y), c_rle(y))
identical(rle(z), c_rle(z))

# would be nice to use testthat