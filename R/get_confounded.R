#' I is identifying relation (I = "ABCD")
#' Returns all confounded variables as data.frame
#' @export
#' 
get_confounded <- function(I){
  
  
  I.split <- (strsplit(I, ""))[[1]]
  
  # total number of combinations is 2^n. 
  # Subtract one since don't care about n choose 0
  # Subtract another 1 since don't need n choose n
  N <- 2^(length(I.split)) - 2
  df <- data.frame(lower.confounded = rep("", N),
                   higher.confounded = rep("", N),
                   stringsAsFactors = F)
  
  ix <- 1
  for (i in 1:(length(I.split)-1)) {
    combos <- apply(t(combn(I.split, i)), 1, paste0, collapse = "")
    for (string in combos) {
      tmp <- c(string, multiply_effects(I, string))
      df[ix, ] <-  tmp[order(nchar(tmp), tmp)]
      
      ix <- ix + 1
    }
  }
  return(distinct(df))
}