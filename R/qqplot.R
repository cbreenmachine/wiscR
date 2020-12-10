#'qqplot
#'Returns a ggplot object that can be costomized using grammar of graphics 
#'instead of R's janky base graphics

qqplot <- function(x){
  
data.frame(x = model$residuals) %>%
  ggplot(aes(sample = x)) +
  stat_qq() + 
  stat_qq_line(color = "red") %>%
  return()
}