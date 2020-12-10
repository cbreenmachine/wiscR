#' @export plot_DFBETAS
#'plot_DFBETAS
#'DFBETAS to come

plot_DFBETAS <- function(model){

  # How many observations (n) and predictors (p)
  p <- length(model$coefficients)
  n <- model$df.residual + p

  # Here, 100 is considered the cutoff for a "large" dataset
  cutoff <- ifelse(n > 100, 1, 2 / sqrt(n))

  # DF Betas
  DFBETAS.df <- dfbetas(model) %>%
    as.data.frame() %>%
    mutate(index = 1:nrow(.)) %>%
    pivot_longer(!index, names_to = "Beta",
                 values_to = "DFBETA")

  # Which points are high leverage?
  out.df <- DFBETAS.df %>%
    filter(DFBETA > cutoff)

  p <- DFBETAS.df %>%
    ggplot(aes(x = index, y = DFBETA, color = Beta)) +
    geom_point() +
    geom_hline(yintercept = cutoff) +
    geom_hline(yintercept = -cutoff) +
    ggtitle("DFBETAS above/below cutoff may be problematic")

  output <- list()

  output$plot <- p
  output$df <- out.df

  return(output)
}
