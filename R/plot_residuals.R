#' plot_residuals
#' @export
plot_residuals <- function(model){

  p1 <- wiscR::qqplot(model$residuals)


  res.df <- data.frame("fitted.vals" <- as.vector(model$fitted.values),
                       "standardized" = rstandard(model))
  names(res.df)[1] <- "fitted.vals"


  p2 <- res.df %>%
    ggplot(aes(x = fitted.vals, y = standardized)) +
    geom_point() +
    theme_minimal()

  out <- list()

  out$qq <- p1
  out$stand <- p2

  return(out)
}
