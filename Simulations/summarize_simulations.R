# summarize simulation results

library(here) # set working directory to current
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
summary_thresholds_nolog_ch <- sim_summary(thresholds_nolog_ch_0.4, thresholds_nolog_ch_0.9, thresholds_nolog_ch_0.975,
                                           range_i.seasons, interval = interv)
summary_exceedance_nolog_ch <- sim_summary(exceedance_nolog_ch_0.4, exceedance_nolog_ch_0.9, exceedance_nolog_ch_0.975,
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
summary_thresholds_nolog_fr <- sim_summary(thresholds_nolog_fr_0.4, thresholds_nolog_fr_0.9, thresholds_nolog_fr_0.975,
                                           range_i.seasons, interval = interv)
summary_exceedance_nolog_fr <- sim_summary(exceedance_nolog_fr_0.4, exceedance_nolog_fr_0.9, exceedance_nolog_fr_0.975,
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
summary_thresholds_nolog_es <- sim_summary(thresholds_nolog_es_0.4, thresholds_nolog_es_0.9, thresholds_nolog_es_0.975,
                                           range_i.seasons, interval = interv)
summary_exceedance_nolog_es <- sim_summary(exceedance_nolog_es_0.4, exceedance_nolog_es_0.9, exceedance_nolog_es_0.975,
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
summary_thresholds_nolog_us <- sim_summary(thresholds_nolog_us_0.4, thresholds_nolog_us_0.9, thresholds_nolog_us_0.975,
                                           range_i.seasons, interval = interv)
summary_exceedance_nolog_us <- sim_summary(exceedance_nolog_us_0.4, exceedance_nolog_us_0.9, exceedance_nolog_us_0.975,
                                           range_i.seasons, interval = interv)
summary_thresholds1_nolog_us <- sim_summary(thresholds1_nolog_us_0.4, thresholds1_nolog_us_0.9, thresholds1_nolog_us_0.975,
                                            range_i.seasons, interval = interv)
summary_exceedance1_nolog_us <- sim_summary(exceedance1_nolog_us_0.4, exceedance1_nolog_us_0.9, exceedance1_nolog_us_0.975,
                                            range_i.seasons, interval = interv)

# compute probabilities of increasing:
table(thresholds_fr_0.4[, "i.seasons_5"] < thresholds_fr_0.4[, "i.seasons_10"])
table(thresholds_es_0.4[, "i.seasons_5"] < thresholds_es_0.4[, "i.seasons_10"])
table(thresholds_ch_0.4[, "i.seasons_5"] < thresholds_ch_0.4[, "i.seasons_10"])
table(thresholds_us_0.4[, "i.seasons_5"] < thresholds_us_0.4[, "i.seasons_10"])

table(thresholds_fr_0.9[, "i.seasons_5"] < thresholds_fr_0.9[, "i.seasons_10"])
table(thresholds_es_0.9[, "i.seasons_5"] < thresholds_es_0.9[, "i.seasons_10"])
table(thresholds_ch_0.9[, "i.seasons_5"] < thresholds_ch_0.9[, "i.seasons_10"])
table(thresholds_us_0.9[, "i.seasons_5"] < thresholds_us_0.9[, "i.seasons_10"])

table(thresholds_fr_0.975[, "i.seasons_5"] < thresholds_fr_0.975[, "i.seasons_10"])
table(thresholds_es_0.975[, "i.seasons_5"] < thresholds_es_0.975[, "i.seasons_10"])
table(thresholds_ch_0.975[, "i.seasons_5"] < thresholds_ch_0.975[, "i.seasons_10"])
table(thresholds_us_0.975[, "i.seasons_5"] < thresholds_us_0.975[, "i.seasons_10"])


save(summary_thresholds_us, summary_thresholds1_us, summary_thresholds_nolog_us, summary_thresholds1_nolog_us,
     summary_exceedance_us, summary_exceedance1_us, summary_exceedance_nolog_us, summary_exceedance1_nolog_us,
     summary_thresholds_ch, summary_thresholds1_ch, summary_thresholds_nolog_ch, summary_thresholds1_nolog_ch,
     summary_exceedance_ch, summary_exceedance1_ch, summary_exceedance_nolog_ch, summary_exceedance1_nolog_ch,
     summary_thresholds_es, summary_thresholds1_es, summary_thresholds_nolog_es, summary_thresholds1_nolog_es,
     summary_exceedance_es, summary_exceedance1_es, summary_exceedance_nolog_es, summary_exceedance1_nolog_es,
     summary_thresholds_fr, summary_thresholds1_fr, summary_thresholds_nolog_fr, summary_thresholds1_nolog_fr,
     summary_exceedance_fr, summary_exceedance1_fr, summary_exceedance_nolog_fr, summary_exceedance1_nolog_fr,
     file = "Results/summaries_results.rda")


load("Results/approx_expectations.rda")


pdf("../Draft/figure/plot_results.pdf", width = 9, height = 11)
par(mfrow = c(4, 4), mar = c(4, 4, 3, 1), las = 1)
layout(matrix(c(1:16, rep(17, 4)), ncol = 4, byrow = TRUE), heights = c(rep(1, 4), 0.7))

lin <- 0.35
ce <- 0.8


# Plot France:
# par(mfrow = c(2, 4), mar = c(4, 4, 3, 1))

plot_sim_summary(summary_thresholds_fr, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 2500))
lines_approx_expectations(approx_expectations_fr)
plot_exceedance_summary(summary_exceedance_fr, xlab = "# included seasons m", ylab = "average share")
mtext("log-transformed, n = 30 / m", 3, at = 0, line = lin, cex = ce)

plot_sim_summary(summary_thresholds_nolog_fr, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 2500))
lines_approx_expectations(approx_expectations_nolog_fr)
mtext("France", 3, at = -1, line = 1.2, cex = 1, font = 2)
plot_exceedance_summary(summary_exceedance_nolog_fr, xlab = "# included seasons m", ylab = "average share")
mtext("natural scale, n = 30 / m", 3, at = 0, line = lin, cex = ce)

plot_sim_summary(summary_thresholds1_fr, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 2500))
lines_approx_expectations(approx_expectations1_fr)
plot_exceedance_summary(summary_exceedance1_fr, xlab = "# included seasons m", ylab = "average share")
mtext("log-transformed, n = 1", 3, at = 0, line = lin, cex = ce)

plot_sim_summary(summary_thresholds1_nolog_fr, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 2500))
lines_approx_expectations(approx_expectations1_nolog_fr)
plot_exceedance_summary(summary_exceedance1_nolog_fr, xlab = "# included seasons m", ylab = "average share")
mtext("natural scale, n = 1", 3, at = 0, line = lin, cex = ce)



# Plot Spain:
# par(mfrow = c(2, 4), mar = c(4, 4, 3, 1))

plot_sim_summary(summary_thresholds_es, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 1200))
lines_approx_expectations(approx_expectations_es)
plot_exceedance_summary(summary_exceedance_es, xlab = "# included seasons m", ylab = "average share")
mtext("log-transformed, n = 30 / m", 3, at = 0, line = lin, cex = ce)

plot_sim_summary(summary_thresholds_nolog_es, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 1200))
lines_approx_expectations(approx_expectations_nolog_es)
mtext("Spain", 3, at = -1, line = 1.2, cex = 1, font = 2)
plot_exceedance_summary(summary_exceedance_nolog_es, xlab = "# included seasons m", ylab = "average share")
mtext("natural scale, n = 30 / m", 3, at = 0, line = lin, cex = ce)

plot_sim_summary(summary_thresholds1_es, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 1200))
lines_approx_expectations(approx_expectations1_es)
plot_exceedance_summary(summary_exceedance1_es, xlab = "# included seasons m", ylab = "average share")
mtext("log-transformed, n = 1", 3, at = 0, line = lin, cex = ce)

plot_sim_summary(summary_thresholds1_nolog_es, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 1200))
lines_approx_expectations(approx_expectations1_nolog_es)
plot_exceedance_summary(summary_exceedance1_nolog_es, xlab = "# included seasons m", ylab = "average share")
mtext("natural scale, n = 1", 3, at = 0, line = lin, cex = ce)


legend_summary() # legend defined in separate function

# Plot Switzerland:
# par(mfrow = c(2, 4), mar = c(4, 4, 3, 1))

plot_sim_summary(summary_thresholds_ch, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 800))
lines_approx_expectations(approx_expectations_ch)
plot_exceedance_summary(summary_exceedance_ch, xlab = "# included seasons m", ylab = "average share")
mtext("log-transformed, n = 30 / m", 3, at = 0, line = lin, cex = ce)

plot_sim_summary(summary_thresholds_nolog_ch, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 800))
lines_approx_expectations(approx_expectations_nolog_ch)
mtext("Switzerland", 3, at = -1, line = 1.2, cex = 1, font = 2)
plot_exceedance_summary(summary_exceedance_nolog_ch, xlab = "# included seasons m", ylab = "average share")
mtext("natural scale, n = 30 / m", 3, at = 0, line = lin, cex = ce)

plot_sim_summary(summary_thresholds1_ch, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 800))
lines_approx_expectations(approx_expectations1_ch)
plot_exceedance_summary(summary_exceedance1_ch, xlab = "# included seasons m", ylab = "average share")
mtext("log-transformed, n = 1", 3, at = 0, line = lin, cex = ce)

plot_sim_summary(summary_thresholds1_nolog_ch, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 800))
lines_approx_expectations(approx_expectations1_nolog_ch)
plot_exceedance_summary(summary_exceedance1_nolog_ch, xlab = "# included seasons m", ylab = "average share")
mtext("natural scale, n = 1", 3, at = 0, line = lin, cex = ce)


# Plot US:
# par(mfrow = c(2, 4), mar = c(4, 4, 3, 1))

plot_sim_summary(summary_thresholds_us, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 0.12))
lines_approx_expectations(approx_expectations_us)
plot_exceedance_summary(summary_exceedance_us, xlab = "# included seasons m", ylab = "average share")
mtext("log-transformed, n = 30 / m", 3, at = 0, line = lin, cex = ce)

plot_sim_summary(summary_thresholds_nolog_us, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 0.12))
lines_approx_expectations(approx_expectations_nolog_us)
mtext("United States", 3, at = -1, line = 1.2, cex = 1, font = 2)
plot_exceedance_summary(summary_exceedance_nolog_us, xlab = "# included seasons m", ylab = "average share")
mtext("natural scale, n = 30 / m", 3, at = 0, line = lin, cex = ce)

plot_sim_summary(summary_thresholds1_us, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 0.12))
lines_approx_expectations(approx_expectations1_us)
plot_exceedance_summary(summary_exceedance1_us, xlab = "# included seasons m", ylab = "average share")
mtext("log-transformed, n = 1", 3, at = 0, line = lin, cex = ce)

plot_sim_summary(summary_thresholds1_nolog_us, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 0.12))
lines_approx_expectations(approx_expectations1_nolog_us)
plot_exceedance_summary(summary_exceedance1_nolog_us, xlab = "# included seasons m", ylab = "average share")
mtext("natural scale, n = 1", 3, at = 0, line = lin, cex = ce)

legend_summary() # legend defined in separate function

dev.off()

# Additional plot for France using CIs:

# load additional French results using confidence intervals:
load(paste0("Results/results_ci_fr.rda"))
load(paste0("Results/results1_ci_fr.rda"))
load(paste0("Results/results_ci_nolog_fr.rda"))
load(paste0("Results/results1_ci_nolog_fr.rda"))


# France:
summary_thresholds_ci_fr <- sim_summary(thresholds_ci_fr_0.4, thresholds_ci_fr_0.9, thresholds_ci_fr_0.975,
                                     range_i.seasons, interval = interv)
summary_exceedance_ci_fr <- sim_summary(exceedance_ci_fr_0.4, exceedance_ci_fr_0.9, exceedance_ci_fr_0.975,
                                     range_i.seasons, interval = interv)
summary_thresholds1_ci_fr <- sim_summary(thresholds1_ci_fr_0.4, thresholds1_ci_fr_0.9, thresholds1_ci_fr_0.975,
                                      range_i.seasons, interval = interv)
summary_exceedance1_ci_fr <- sim_summary(exceedance1_ci_fr_0.4, exceedance1_ci_fr_0.9, exceedance1_ci_fr_0.975,
                                      range_i.seasons, interval = interv)
summary_thresholds_ci_nolog_fr <- sim_summary(thresholds_ci_nolog_fr_0.4, thresholds_ci_nolog_fr_0.9, thresholds_ci_nolog_fr_0.975,
                                           range_i.seasons, interval = interv)
summary_exceedance_ci_nolog_fr <- sim_summary(exceedance_ci_nolog_fr_0.4, exceedance_ci_nolog_fr_0.9, exceedance_ci_nolog_fr_0.975,
                                           range_i.seasons, interval = interv)
summary_thresholds1_ci_nolog_fr <- sim_summary(thresholds1_ci_nolog_fr_0.4, thresholds1_ci_nolog_fr_0.9, thresholds1_ci_nolog_fr_0.975,
                                            range_i.seasons, interval = interv)
summary_exceedance1_ci_nolog_fr <- sim_summary(exceedance1_ci_nolog_fr_0.4, exceedance1_ci_nolog_fr_0.9, exceedance1_ci_nolog_fr_0.975,
                                            range_i.seasons, interval = interv)


pdf("../Draft/figure/plot_results_ci.pdf", width = 9, height = 5.5)
par(mfrow = c(2, 4), mar = c(4, 4, 3, 1), las = 1)

plot_sim_summary(summary_thresholds_ci_fr, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 2500))
plot_exceedance_summary(summary_exceedance_ci_fr, xlab = "# included seasons m", ylab = "average share")
mtext("log-transformed, n = 30 / m", 3, at = 0, line = lin, cex = ce)

plot_sim_summary(summary_thresholds_ci_nolog_fr, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 2500))
mtext("France, using confidence intervals", 3, at = 1, line = 1.2, cex = 1, font = 2)
plot_exceedance_summary(summary_exceedance_ci_nolog_fr, xlab = "# included seasons m", ylab = "average share")
mtext("natural scale, n = 30 / m", 3, at = 0, line = lin, cex = ce)

plot_sim_summary(summary_thresholds1_ci_fr, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 2500))
plot_exceedance_summary(summary_exceedance1_ci_fr, xlab = "# included seasons m", ylab = "average share")
mtext("log-transformed, n = 1", 3, at = 0, line = lin, cex = ce)

plot_sim_summary(summary_thresholds1_ci_nolog_fr, xlab = "# included seasons m", ylab = "threshold", ylim = c(0, 2500))
plot_exceedance_summary(summary_exceedance1_ci_nolog_fr, xlab = "# included seasons m", ylab = "average share")
mtext("natural scale, n = 1", 3, at = 0, line = lin, cex = ce)
dev.off()
