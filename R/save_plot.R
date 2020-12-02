#' p is a plot (usually made by ggplot() call)
#' ofile is a string with relative path and name, must end in .png

save_plot <- function(p, ofile) {
  
  png(file = ofile, width = 1536, height = 864)
  print(p)
  dev.off()
}