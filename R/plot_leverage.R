#' @export plot_leverage
#'plot_leverage
#'Plots the leverage points with a horizontal line corresponding to a decision
#'boundary recommendation.

plot_leverage <- function(model){

  # How many observations (n) and predictors (p)
  p <- length(model$coefficients)
  n <- model$df.residual + p

  # Leverage
  hats <- hatvalues(model)

  # Rule of thumb cutoff for outliers
  lev_bound <- 2*p / n

  # Cobble data
  df <- data.frame(index = 1:length(hats), leverage = hats)

  # Which points are high leverage?
  high_lev.df <- df %>%
    filter(leverage > lev_bound)

  # Create plot
  p <-  df %>%
    ggplot(aes(x = index, y = leverage)) +
    geom_point() +
    ggtitle("Leverage points above 2p / n may be problematic") +
    geom_hline(yintercept = lev_bound, color = "red")

  output <- list()

  output$leverage_plot <- p
  output$high_lev.df <- high_lev.df

  return(output)
}
