test_Dong_method <- function(effect, alpha) {
  
  effect <-  abs(effect)
  
  s <- 1.5 * median(effect)
  
  for (i in 1:2) {
    m <- sum(effect <= 2.5*s)
    
  }
  
}