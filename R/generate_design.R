#' generate_initial_deign
#'  # Creates an X matrix with p columns. Each column is composed of 1s and -1s.
#' The patterns of + and - are different in each column. For example:
#' Col 1: + - + - + -...
#' Col 2: + + - - + +...
#' p is the number of factors and is only required (accepted) input.
#' @export
generate_initial_design <- function(p){
  runs <- 2^p
  X <- matrix(rep(0, runs*p), nrow = runs)
  colnames(X) <- LETTERS[seq( from = 1, to = p )] # assign column names from alphabet
  
  for (jj in 1:p){
    pattern_multiplier <- 2^(jj - 1)
    string_multiplier <- 2^(p-jj)
    
    ix <- c(rep(1, pattern_multiplier), rep(-1, pattern_multiplier))
    X[,jj] <- rep(ix, string_multiplier)
  }  
  
  return(X)
}