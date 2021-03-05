#' Adds a light theme to a ggplot object with sensible font sizes
#' and styles
#' @export
light_theme <- function(){
  require(tidyverse)

  theme_minimal() %+replace%
    theme(text = element_text(size = rel(4.5)),
          panel.grid.major = element_line(size = 0.2),
          panel.grid.minor = element_line(size = 0.5),
          strip.background = element_rect(size = 0),
          plot.background = element_rect(size = 2))
}
