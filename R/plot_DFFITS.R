#'plot_DFBETAS
#'DFBETAS to come
#' @export
plot_DFFITS <- function(model){

  # How many observations (n) and predictors (p)
  p <- length(model$coefficients)
  n <- model$df.residual + p

  # Here, 100 is considered the cutoff for a "large" dataset
  cutoff <- ifelse(n > 100, 1, 2 * sqrt(p / n))

  # DFFITS
  DFFITS <- dffits(model)

  df <- data.frame(index = 1:length(DFFITS), DFFITS = DFFITS)

  # Which points are high leverage?
  DFFITS.df <- df %>%
    filter(DFFITS > cutoff)

  # Create plot
  p <-  df %>%
    ggplot(aes(x = index, y = DFFITS)) +
    geom_point() +
    ggtitle("DFFITS above or below cutoff be problematic") +
    geom_hline(yintercept = cutoff, color = "red") +
    geom_hline(yintercept = -cutoff, color = "red")

  output <- list()

  output$plot <- p
  output$df <- DFFITS.df

  return(output)
}
