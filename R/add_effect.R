#' add_effect
#' X is a matrix (likely made by generate_initial_design)
#' effect is an effect represented by string of letters (e.g. "AB" or "ADE")
#' OR effect is a an integer
#' @export
add_effect <- function(X, effect) {
  factors <- colnames(X)
  
  if (typeof(effect) == "double"){
    
    
    combos <- t(combn(factors, 2))
    all_effects <- apply(combos, 1, paste0, collapse = "")
  } else {
    all_effects <- effect
  }
  
  for (string in all_effects){
    v <- strsplit(string, split = "")[[1]]
    X <- cbind(X, apply(X[, v], 1, prod))
    colnames(X)[ncol(X)] <- string
  }
  return(X)
}
