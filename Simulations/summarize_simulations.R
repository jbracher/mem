# summarize simulation results

setwd("/home/johannes/Documents/Ideas/mem/Simulations")
source("functions_simulations_mem.R")

# the range of number of seasons:
range_i.seasons <- 5:15

for(country in c("ch", "es", "fr", "us")){
  load(paste0("Results/results_", country, ".rda"))
  load(paste0("Results/results1_", country, ".rda"))
  load(paste0("Results/results_nolog_", country, ".rda"))
  load(paste0("Results/results1_nolog_", country, ".rda"))
}

# which uncertainty bands to compute?
interv <- c(0.05, 0.95)

# compute summaries using custom function

# Switzerland:
summary_thresholds_ch <- sim_summary(thresholds_ch_0.4, thresholds_ch_0.9, thresholds_ch_0.975,
                                     range_i.seasons, interval = interv)
summary_exceedance_ch <- sim_summary(exceedance_ch_0.4, exceedance_ch_0.9, exceedance_ch_0.975,
                                     range_i.seasons, interval = interv)
summary_thresholds1_ch <- sim_summary(thresholds1_ch_0.4, thresholds1_ch_0.9, thresholds1_ch_0.975,
                                      range_i.seasons, interval = interv)
summary_exceedance1_ch <- sim_summary(exceedance1_ch_0.4, exceedance1_ch_0.9, exceedance1_ch_0.975,
                                      range_i.seasons, interval = interv)
summary_thresholds_nolog_ch <- sim_summary(thresholds_nolog_ch_0.4, thresholds_nolog_ch_0.9, thresholds_ch_0.975,
                                           range_i.seasons, interval = interv)
summary_exceedance_nolog_ch <- sim_summary(exceedance_nolog_ch_0.4, exceedance_nolog_ch_0.9, exceedance_ch_0.975,
                                           range_i.seasons, interval = interv)
summary_thresholds1_nolog_ch <- sim_summary(thresholds1_nolog_ch_0.4, thresholds1_nolog_ch_0.9, thresholds1_nolog_ch_0.975,
                                            range_i.seasons, interval = interv)
summary_exceedance1_nolog_ch <- sim_summary(exceedance1_nolog_ch_0.4, exceedance1_nolog_ch_0.9, exceedance1_nolog_ch_0.975,
                                            range_i.seasons, interval = interv)

# France:
summary_thresholds_fr <- sim_summary(thresholds_fr_0.4, thresholds_fr_0.9, thresholds_fr_0.975,
                                     range_i.seasons, interval = interv)
summary_exceedance_fr <- sim_summary(exceedance_fr_0.4, exceedance_fr_0.9, exceedance_fr_0.975,
                                     range_i.seasons, interval = interv)
summary_thresholds1_fr <- sim_summary(thresholds1_fr_0.4, thresholds1_fr_0.9, thresholds1_fr_0.975,
                                      range_i.seasons, interval = interv)
summary_exceedance1_fr <- sim_summary(exceedance1_fr_0.4, exceedance1_fr_0.9, exceedance1_fr_0.975,
                                      range_i.seasons, interval = interv)
summary_thresholds_nolog_fr <- sim_summary(thresholds_nolog_fr_0.4, thresholds_nolog_fr_0.9, thresholds_fr_0.975,
                                           range_i.seasons, interval = interv)
summary_exceedance_nolog_fr <- sim_summary(exceedance_nolog_fr_0.4, exceedance_nolog_fr_0.9, exceedance_fr_0.975,
                                           range_i.seasons, interval = interv)
summary_thresholds1_nolog_fr <- sim_summary(thresholds1_nolog_fr_0.4, thresholds1_nolog_fr_0.9, thresholds1_nolog_fr_0.975,
                                            range_i.seasons, interval = interv)
summary_exceedance1_nolog_fr <- sim_summary(exceedance1_nolog_fr_0.4, exceedance1_nolog_fr_0.9, exceedance1_nolog_fr_0.975,
                                            range_i.seasons, interval = interv)

# Spain:
summary_thresholds_es <- sim_summary(thresholds_es_0.4, thresholds_es_0.9, thresholds_es_0.975,
                                     range_i.seasons, interval = interv)
summary_exceedance_es <- sim_summary(exceedance_es_0.4, exceedance_es_0.9, exceedance_es_0.975,
                                     range_i.seasons, interval = interv)
summary_thresholds1_es <- sim_summary(thresholds1_es_0.4, thresholds1_es_0.9, thresholds1_es_0.975,
                                      range_i.seasons, interval = interv)
summary_exceedance1_es <- sim_summary(exceedance1_es_0.4, exceedance1_es_0.9, exceedance1_es_0.975,
                                      range_i.seasons, interval = interv)
summary_thresholds_nolog_es <- sim_summary(thresholds_nolog_es_0.4, thresholds_nolog_es_0.9, thresholds_es_0.975,
                                           range_i.seasons, interval = interv)
summary_exceedance_nolog_es <- sim_summary(exceedance_nolog_es_0.4, exceedance_nolog_es_0.9, exceedance_es_0.975,
                                           range_i.seasons, interval = interv)
summary_thresholds1_nolog_es <- sim_summary(thresholds1_nolog_es_0.4, thresholds1_nolog_es_0.9, thresholds1_nolog_es_0.975,
                                            range_i.seasons, interval = interv)
summary_exceedance1_nolog_es <- sim_summary(exceedance1_nolog_es_0.4, exceedance1_nolog_es_0.9, exceedance1_nolog_es_0.975,
                                            range_i.seasons, interval = interv)

# US:
summary_thresholds_us <- sim_summary(thresholds_us_0.4, thresholds_us_0.9, thresholds_us_0.975,
                                     range_i.seasons, interval = interv)
summary_exceedance_us <- sim_summary(exceedance_us_0.4, exceedance_us_0.9, exceedance_us_0.975,
                                     range_i.seasons, interval = interv)
summary_thresholds1_us <- sim_summary(thresholds1_us_0.4, thresholds1_us_0.9, thresholds1_us_0.975,
                                      range_i.seasons, interval = interv)
summary_exceedance1_us <- sim_summary(exceedance1_us_0.4, exceedance1_us_0.9, exceedance1_us_0.975,
                                      range_i.seasons, interval = interv)
summary_thresholds_nolog_us <- sim_summary(thresholds_nolog_us_0.4, thresholds_nolog_us_0.9, thresholds_us_0.975,
                                           range_i.seasons, interval = interv)
summary_exceedance_nolog_us <- sim_summary(exceedance_nolog_us_0.4, exceedance_nolog_us_0.9, exceedance_us_0.975,
                                           range_i.seasons, interval = interv)
summary_thresholds1_nolog_us <- sim_summary(thresholds1_nolog_us_0.4, thresholds1_nolog_us_0.9, thresholds1_nolog_us_0.975,
                                            range_i.seasons, interval = interv)
summary_exceedance1_nolog_us <- sim_summary(exceedance1_nolog_us_0.4, exceedance1_nolog_us_0.9, exceedance1_nolog_us_0.975,
                                            range_i.seasons, interval = interv)


save(summary_thresholds_us, summary_thresholds1_us, summary_thresholds_nolog_us, summary_thresholds1_nolog_us,
     summary_exceedance_us, summary_exceedance1_us, summary_exceedance_nolog_us, summary_exceedance1_nolog_us,
     summary_thresholds_ch, summary_thresholds1_ch, summary_thresholds_nolog_ch, summary_thresholds1_nolog_ch,
     summary_exceedance_ch, summary_exceedance1_ch, summary_exceedance_nolog_ch, summary_exceedance1_nolog_ch,
     summary_thresholds_es, summary_thresholds1_es, summary_thresholds_nolog_es, summary_thresholds1_nolog_es,
     summary_exceedance_es, summary_exceedance1_es, summary_exceedance_nolog_es, summary_exceedance1_nolog_es,
     summary_thresholds_fr, summary_thresholds1_fr, summary_thresholds_nolog_fr, summary_thresholds1_nolog_fr,
     summary_exceedance_fr, summary_exceedance1_fr, summary_exceedance_nolog_fr, summary_exceedance1_nolog_fr,
     file = "Results/summaries_results.rda")

pdf("plot.pdf", width = 9, height = 9)
par(mfrow = c(4, 4), mar = c(4, 4, 3, 1), las = 1)

# Plot Switzerland:
# par(mfrow = c(2, 4), mar = c(4, 4, 3, 1))

plot_sim_summary(summary_thresholds_ch, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 800))
plot_exceedane_summary(summary_exceedance_ch, xlab = "# included seasons", ylab = "average share")
mtext("log-transformed, n = 30/# seasons", 3, at = 0, line = 0.35, cex = 0.7)

plot_sim_summary(summary_thresholds1_ch, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 800))
mtext("Switzerland", 3, at = -1, line = 1.2, cex = 1)
plot_exceedane_summary(summary_exceedance1_ch, xlab = "# included seasons", ylab = "average share")
mtext("log-transformed, n = 1", 3, at = 0, line = 0.35, cex = 0.7)


plot_sim_summary(summary_thresholds_nolog_ch, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 800))
plot_exceedane_summary(summary_exceedance_nolog_ch, xlab = "# included seasons", ylab = "average share")
mtext("natural scale, n = 30/# seasons", 3, at = 0, line = 0.35, cex = 0.7)


plot_sim_summary(summary_thresholds1_nolog_ch, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 800))
plot_exceedane_summary(summary_exceedance1_nolog_ch, xlab = "# included seasons", ylab = "average share")
mtext("natural scale, n = 1", 3, at = 0, line = 0.35, cex = 0.7)


# Plot France:
# par(mfrow = c(2, 4), mar = c(4, 4, 3, 1))

plot_sim_summary(summary_thresholds_fr, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 2500))
plot_exceedane_summary(summary_exceedance_fr, xlab = "# included seasons", ylab = "average share")
mtext("log-transformed, n = 30/# seasons", 3, at = 0, line = 0.35, cex = 0.7)

plot_sim_summary(summary_thresholds1_fr, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 2500))
mtext("France", 3, at = -1, line = 1.2, cex = 1)
plot_exceedane_summary(summary_exceedance1_fr, xlab = "# included seasons", ylab = "average share")
mtext("log-transformed, n = 1", 3, at = 0, line = 0.35, cex = 0.7)


plot_sim_summary(summary_thresholds_nolog_fr, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 2500))
plot_exceedane_summary(summary_exceedance_nolog_fr, xlab = "# included seasons", ylab = "average share")
mtext("natural scale, n = 30/# seasons", 3, at = 0, line = 0.35, cex = 0.7)


plot_sim_summary(summary_thresholds1_nolog_fr, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 2500))
plot_exceedane_summary(summary_exceedance1_nolog_fr, xlab = "# included seasons", ylab = "average share")
mtext("natural scale, n = 1", 3, at = 0, line = 0.35, cex = 0.7)


# Plot Spain:
# par(mfrow = c(2, 4), mar = c(4, 4, 3, 1))

plot_sim_summary(summary_thresholds_es, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 1200))
plot_exceedane_summary(summary_exceedance_es, xlab = "# included seasons", ylab = "average share")
mtext("log-transformed, n = 30/# seasons", 3, at = 0, line = 0.35, cex = 0.7)

plot_sim_summary(summary_thresholds1_es, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 1200))
mtext("Spain", 3, at = -1, line = 1.2, cex = 1)
plot_exceedane_summary(summary_exceedance1_es, xlab = "# included seasons", ylab = "average share")
mtext("log-transformed, n = 1", 3, at = 0, line = 0.35, cex = 0.7)


plot_sim_summary(summary_thresholds_nolog_es, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 1200))
plot_exceedane_summary(summary_exceedance_nolog_es, xlab = "# included seasons", ylab = "average share")
mtext("natural scale, n = 30/# seasons", 3, at = 0, line = 0.35, cex = 0.7)


plot_sim_summary(summary_thresholds1_nolog_es, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 1200))
plot_exceedane_summary(summary_exceedance1_nolog_es, xlab = "# included seasons", ylab = "average share")
mtext("natural scale, n = 1", 3, at = 0, line = 0.35, cex = 0.7)

# Plot US:
# par(mfrow = c(2, 4), mar = c(4, 4, 3, 1))

plot_sim_summary(summary_thresholds_us, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 0.12))
plot_exceedane_summary(summary_exceedance_us, xlab = "# included seasons", ylab = "average share")
mtext("log-transformed, n = 30/# seasons", 3, at = 0, line = 0.35, cex = 0.7)

plot_sim_summary(summary_thresholds1_us, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 0.12))
mtext("United States", 3, at = -1, line = 1.2, cex = 1)
plot_exceedane_summary(summary_exceedance1_us, xlab = "# included seasons", ylab = "average share")
mtext("log-transformed, n = 1", 3, at = 0, line = 0.35, cex = 0.7)


plot_sim_summary(summary_thresholds_nolog_us, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 0.12))
plot_exceedane_summary(summary_exceedance_nolog_us, xlab = "# included seasons", ylab = "average share")
mtext("natural scale, n = 30/# seasons", 3, at = 0, line = 0.35, cex = 0.7)


plot_sim_summary(summary_thresholds1_nolog_us, xlab = "# included seasons", ylab = "threshold", ylim = c(0, 0.12))
plot_exceedane_summary(summary_exceedance1_nolog_us, xlab = "# included seasons", ylab = "average share")
mtext("natural scale, n = 1", 3, at = 0, line = 0.35, cex = 0.7)

dev.off()
