#' Adds a dark theme to a ggplot object with sensible font sizes
#' and styles

dark_theme <- function(){
  require(tidyverse)
  
  theme_minimal() %+replace% 
    theme(text = element_text(color="white", size = rel(4.5)),
          axis.text = element_text(color = "white"), 
          axis.ticks = element_line(colour = "white"), 
          legend.key = element_rect(colour = "black"), 
          panel.background = element_rect(fill = "black", colour = NA), 
          panel.border = element_rect(fill = NA, colour = "black"), 
          panel.grid.major = element_line(colour = "white", size = 0.2), 
          panel.grid.minor = element_line(colour = "grey10", size = 0.5), 
          strip.background = element_rect(fill = "black", colour = "white", size = 0),
          strip.text = element_text(color="white"),
          plot.background = element_rect(fill = "black", size = 2),
          legend.box.background = element_rect(fill = "black"),
          legend.background = element_rect(fill = "black"))
}