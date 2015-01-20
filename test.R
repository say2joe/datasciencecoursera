intro <- function(x) {
	y <- rnorm(100)
	mean(y)
}

another <- function(x) {
	x + rnorm(length(x))
}