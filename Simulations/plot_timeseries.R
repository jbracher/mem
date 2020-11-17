setwd("/home/johannes/Documents/Ideas/mem/Simulations")

dat_ch <- read.csv("../Data/for_mem/ili_mem_ch.csv")
dat_es <- read.csv("../Data/for_mem/ili_mem_es.csv")
dat_fr <- read.csv("../Data/for_mem/ili_mem_fr.csv")
dat_us <- read.csv("../Data/for_mem/ili_mem_us.csv")

dim(dat_us)

plot(dat_us[, 5])

matr <- dat_ch
xlim <- c(1990, 2020)
plot_mem_ts <- function(matr, xlim, ylab = "inc / 100,000", ...){
  years <- as.numeric(substr(colnames(matr), start = 13, stop = 16)) - 1
  plot(NULL, xlim = xlim, ylim = c(0, 1.1*max(matr)), xlab = "", ylab = ylab, ...)
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

par(las = 1, mar = c(3, 4, 0.5, 1))
layout(matrix(1:8, ncol = 2, byrow = TRUE), widths = c(8, 2))
plot_mem_ts(dat_fr, xlim = c(1986, 2019)); legend("topleft", legend = "France", bty = "n", cex = 1.2)
bplot_ranks(dat_fr)

plot_mem_ts(dat_es, xlim = c(1986, 2019)); legend("topleft", legend = "Spain", bty = "n", cex = 1.2)
bplot_ranks(dat_es)

plot_mem_ts(dat_ch, xlim = c(1986, 2019)); legend("topleft", legend = "Switzerland", bty = "n", cex = 1.2)
bplot_ranks(dat_ch)

plot_mem_ts(dat_us, xlim = c(1986, 2019), ylab = "wILI %"); legend("topleft", legend = "United States", bty = "n", cex = 1.2)
bplot_ranks(dat_us)

