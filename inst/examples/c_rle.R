x <- c(1, 1, 3, 3, 3, 3, 2, 2, 2)
y <- c(1, 1, 3, 3, 3, 3, 2, 2, 4)

source("./inst/examples/csource.R")  # defines csource

csource("./inst/examples/c_rle.c")

c_rle(x)
c_rle(y)
