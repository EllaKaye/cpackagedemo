x <- c(1, 1, 3, 3, 3, 3, 2, 2, 2)
y <- c(1, 1, 3, 3, 3, 3, 2, 2, 4)
z <- c(rep(1.2, 3), rep(2.4, 2))

source("./inst/examples/csource.R")  # defines csource

csource("./inst/examples/c_rle.c")

c_rle(x)
c_rle(y)
c_rle(z)

