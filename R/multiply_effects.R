multiply_effects <- function(str1, str2) {
  # helper function, multiply letter strings
  # E.g. multiply_effects("ABC", "CDE") --> "ABDE"
  
  counts <- table(strsplit(paste0(str1,str2), ""))
  # If the number of occurrences is odd, that letter stays (was not canceled)
  reduced <- paste0(names(counts[counts %% 2 == 1]), collapse="")
  return(reduced)
}