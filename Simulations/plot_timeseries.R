library(here)

dat_ch <- read.csv("../Data/for_mem/ili_mem_ch.csv")
dat_es <- read.csv("../Data/for_mem/ili_mem_es.csv")
dat_fr <- read.csv("../Data/for_mem/ili_mem_fr.csv")
dat_us <- read.csv("../Data/for_mem/ili_mem_us.csv")

dim(dat_us)

plot(dat_us[, 5])

matr <- dat_ch
xlim <- c(1990, 2020)

plot_mem_ts <- function(matr, xlim, ylab = "inc / 100,000", fact_ylim = 1.2, ...){
  years <- as.numeric(substr(colnames(matr), start = 13, stop = 16)) - 1
  labels_years <- gsub(".", "/", substr(colnames(matr), start = 8, stop = 16), fixed = TRUE)
  
  plot(NULL, xlim = xlim, ylim = c(0, fact_ylim*max(matr)), xlab = "", ylab = ylab, axes = FALSE,...)
  axis(1, at = years + 0.5, labels = labels_years)
  axis(2)
  box()
  
  abline(v = seq(from = floor(xlim[1]), to = ceiling(xlim[2])), col = "grey")

  weeks_per_seas <- nrow(matr)
  for(i in 1:ncol(matr)){
    x <- years[i] + (1:weeks_per_seas)/weeks_per_seas
    lines(x, matr[, i])
  }
}

bplot_ranks <- function(matr, ylab = ""){
  plot(NULL, xlim = c(0.5, 6.5), ylim = c(0, 1.1*max(matr)), xlab = "", ylab = ylab)
  mtext("rank in season", 1, line = 1.8, cex = 0.6)
  get_nth <- function(vect, n) sort(vect, decreasing = TRUE)[n]
  for(i in 1:6) boxplot(apply(matr, 2, get_nth, n = i), at = i, add = TRUE, axes = FALSE)
}

pdf("../Draft/figure/plot_data.pdf", width = 9, height = 5.5)

par(las = 1, mar = c(3, 4, 0.5, 1))
layout(matrix(1:8, ncol = 2, byrow = TRUE), widths = c(8, 2))
plot_mem_ts(dat_fr, xlim = c(1985.5, 2019.5), fact_ylim = 1.1)
legend("top", legend = " France  ", bty = "o", cex = 1.2, bg = "white")
bplot_ranks(dat_fr)

plot_mem_ts(dat_es, xlim = c(1998.5, 2019.5))
legend("top", legend = " Spain  ", bty = "o", cex = 1.2, bg = "white")
bplot_ranks(dat_es)

plot_mem_ts(dat_ch, xlim = c(2000.5, 2015.5), fact_ylim = 1.55);
legend("top", legend = " Switzerland  ", bty = "o", cex = 1.2, bg = "white")
bplot_ranks(dat_ch)

plot_mem_ts(dat_us, xlim = c(1998.5, 2017.5), ylab = "wILI", fact_ylim = 1.25)
legend("top", legend = " United States  ", bty = "o", cex = 1.2, bg = "white")
bplot_ranks(dat_us)
dev.off()

