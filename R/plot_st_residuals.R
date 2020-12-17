#' plot_st_residuals
#' Plots standardized and studentized residuals on one plot.
#' @export
plot_st_residuals <- function(model){
  
  res.df <- data.frame("fitted.vals" <- as.vector(model$fitted.values),
                       "standardized" = rstandard(model),
                       "studentized" = rstudent(model))
  names(res.df)[1] <- "fitted.vals"
  
  
  res.df %>%
    pivot_longer(cols = starts_with("s"), 
                 names_to = "type", values_to = "residuals") %>%
    group_by(type) %>%
    ggplot(aes(x = fitted.vals, y = residuals, color = type)) +
    geom_point() +
    facet_wrap(.~type)
}