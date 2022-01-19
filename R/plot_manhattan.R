#' Plot principal components
#'
#' @param df  a dataframe with at least three columns--PC1, PC2, color_var
#' @param color_by_str a string specifying how to color the points
#' @return a ggplot object
#' @export
#'
# Thanks to https://danielroelfs.com/blog/how-i-create-manhattan-plots-using-ggplot/
# .pad_chrom <- function(s="chr1"){
#   # helper function to add leading zero to chromosome string
#   # allows proper ordering
#   t <- str_remove(s, "chr") %>%
#        str_pad(width = 2, pad = "0")
#   paste0("chr", t) %>% return()
# }
#
# .filter_df <- function(df, p_name) {
#
#   cut <- 0.15 # may make this a parameter one day
#
#   # All of the significant (or close to) points should show in scatter
#   sig.df <- df %>% dplyr::filter(p_name < 0.15)
#   # Thin the non-significant so plot renders in reasonable time
#   nonsig.df <- df %>% dplyr::filter(aLIS > 0.15) %>% dplyr::slice_sample(prop = 0.2)
#
#   sub.df <- rbind(sig.df, nonsig.df) %>%
#     mutate(chrom_padded = pad_chrom(chr)) %>%
#     dplyr::select(c(chrom_padded, pos, p_name))
#
#   #
# }
#
#
#
# data_cum <- sub.df %>%
#   group_by(chrom) %>%
#   summarise(max_bp = max(pos)) %>%
#   mutate(bp_add = lag(cumsum(as.numeric(max_bp)), default = 0)) %>%
#   dplyr::select(chrom, bp_add)
#
# sub.df <- sub.df %>%
#   inner_join(data_cum, by = "chrom") %>%
#   mutate(bp_cum = pos + bp_add)
#
# axis_set <- sub.df %>%
#   group_by(chrom) %>%
#   summarize(center = mean(bp_cum))
#
#
# p <- sub.df %>%
#   ggplot(aes(x = bp_cum, color = as.factor(chrom), y = -log10(aLIS) * sign(bmi))) +
#   geom_point(alpha = 0.9, size = 3.5) +
#   scale_x_continuous(label = axis_set$chrom, breaks = axis_set$center) +
#   wiscR::light_theme() +
#   xlab("") +
#   ylab("-log10(aLIS) * Direction of Effect") +
#   theme(
#     legend.position = "none",
#     panel.border = element_blank(),
#     panel.grid.major.x = element_blank(),
#     panel.grid.minor.x = element_blank(),
#     axis.text.x = element_text(angle = 45, size = 20, vjust = 0.5)) +
#   geom_hline(yintercept = -log10(.05), size = 1, color = "black") +
#   geom_hline(yintercept = log10(.05),  size = 1, color = "black") +
#   geom_hline(yintercept = 0,  size = 1, color = "grey") +
#   ylim(c(-5.1, 5.1)) +
#   theme(plot.caption = element_text(hjust = 0, face= "italic", size = 20),
#         panel.background = element_rect(colour = NA),
#         plot.background = element_rect(colour = NA)) +
#   scale_color_manual(values = rep(c("grey", "#0072B2"), 12))
#
# ab1 = 6e8
# ab2 = 6e8
# arh = log10(1e-4)
# sz = 7
#
# p1 <- p + annotate("segment", x = ab1, xend = ab1,  y = -log10(0.05),
#                    yend = -arh, colour = "red", size=4, alpha=0.7, arrow=arrow()) +
#   annotate("text", x = ab1, y = -arh+0.5, label = "Loci positively\nassociated w/ BMI", size = sz, color = "red") +
#   annotate("segment", x = ab2, xend = ab2,  y = log10(0.05),
#            yend = arh, colour = "black", size=4, alpha=0.7, arrow=arrow()) +
#   annotate("text", x = ab2, y = arh-0.5, label = "Loci negatively\nassociated w/ BMI", size = sz) +
#   annotate("text", x = 3e4, y = -log10(0.02), label = "Significant at\naLIS < 0.05", size = sz, color = "black")
#

plot_manhattan(df){
  require(tidyverse)
  return(NULL)
}
