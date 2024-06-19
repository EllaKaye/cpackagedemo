x <- c(1, 1, 3, 3, 3, 3, 2, 2, 2)
y <- c(1, 1, 3, 3, 3, 3, 2, 2, 4)
rle(x)
rle_x <- rle(x)
rle_x$values
rle_x$lengths

# work towards something that can be translated to C code
my_rle <- function(x) {
	n <- length(x)
	values <- integer(n)
	lengths <- integer(n)
	
	index <- 1
	rl <- 1 # current run length
	
	for (i in 1:(n-1)) {
		# if run continues
		if (x[i] == x[i + 1]) {
			rl <- rl + 1
		}
		# if run ends
		else {
			## update output vectors
			lengths[index] <- rl
			values[index] <- x[i]
			
			## reset
			index <- index + 1
			rl <- 1
		}
	}
	
	## after loop, deal with final value
	if (x[n - 1] == x[n]) {
		# have already added 1 to rl in last loop iteration
		# and index has been updated too
		lengths[index] <- rl 
		values[index] <- x[n]
	} else {
		lengths[index] <- 1
		values[index] <- x[n]
	}
	
	return(list(lengths = lengths[1:index], values = values[1:index]))
}

rle(x)
my_rle(x)

rle(y)
my_rle(y)
