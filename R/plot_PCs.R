#' Plot principal components
#'
#' @param df  a dataframe with at least three columns--PC1, PC2, color_var
#' @param color_by_str a string specifying how to color the points
#' @return a ggplot object
#' @export
plot_PCs <- function(df, color_by_str){
  # gets the scatter plot
  p <- df %>%
    drop_na() %>%
    ggplot(aes_string(x = "PC1", y = "PC2", color = color_by_str)) +
    geom_point(size = 6, alpha = 0.8) +
    light_theme()

  # Heuristic to color points by
  if ((length(unique(df[[color_by_str]])) > 10) & (is.numeric(df[[color_by_str]]))) {
    p <- p + scale_color_viridis(option = "magma")
  } else {
    p <- p + scale_color_viridis(discrete=TRUE)
  }
}