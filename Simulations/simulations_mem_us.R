############################################################
# Running permutation/simulation study for Spain
setwd("/home/johannes/Documents/Ideas/mem/Simulations")
library(mem)
library(HIDDA.forecasting)

source("functions_simulations_mem.R")

dat_for_mem <- read.csv("../Data/for_mem/ili_mem_us.csv")

plot(dat_for_mem[, 2])

# simulation settings:
range_i.seasons <- 5:15 # range to be explored for i.seasons
n_sim <- 500

#####################################################
### Run simulation using default settings of mem
#####################################################

# initialize matrices to store results (thresholds and exceedance proportions)
thresholds_us_0.4 <- matrix(NA, nrow = n_sim, ncol = length(range_i.seasons))
colnames(thresholds_us_0.4) <- paste0("i.seasons_", range_i.seasons)
thresholds_us_0.9 <- thresholds_us_0.975 <-
  exceedance_us_0.4 <- exceedance_us_0.9 <- exceedance_us_0.975 <-
  thresholds_us_0.4

# run simulation:
for(k in 1:n_sim){
  set.seed(k)

  # run through different numbers of past seasons used:
  for(a in seq_along(range_i.seasons)){

    # split into training and test:
    inds_train <- sample(1:ncol(dat_for_mem), size = range_i.seasons[a], replace = TRUE)
    dat_train <- dat_for_mem[, inds_train]
    dat_test <- dat_for_mem # [, -inds_train]
    # compute peaks of test seasons:
    peaks_test <- apply(dat_test, 2, max)

    # run memmodel:
    memmodel_temp <- memmodel(dat_train, i.seasons = range_i.seasons[a],
                              i.level.intensity = c(0.4, 0.9, 0.975))

    # store thresholds:
    thresholds_us_0.4[k, a] <- memmodel_temp$intensity.thresholds[1]
    thresholds_us_0.9[k, a] <- memmodel_temp$intensity.thresholds[2]
    thresholds_us_0.975[k, a] <- memmodel_temp$intensity.thresholds[3]

    # compute and store exceedance proportions:
    exceedance_us_0.4[k, a] <- mean(peaks_test > thresholds_us_0.4[k, a])
    exceedance_us_0.9[k, a] <- mean(peaks_test > thresholds_us_0.9[k, a])
    exceedance_us_0.975[k, a] <- mean(peaks_test > thresholds_us_0.975[k, a])
  }
  print(k)
}

# save results
save(thresholds_us_0.4, thresholds_us_0.9, thresholds_us_0.975,
     exceedance_us_0.4, exceedance_us_0.9, exceedance_us_0.975,
     file = "Results/results_us.rda")
load("Results/results_us.rda")

# compute summaries using custom function
summary_thresholds <- sim_summary(thresholds_us_0.4, thresholds_us_0.9, thresholds_us_0.975, range_i.seasons, interval = c(0.1, 0.9))
summary_exceedance <- sim_summary(exceedance_us_0.4, exceedance_us_0.9, exceedance_us_0.975, range_i.seasons, interval = c(0.1, 0.9))

# plot
par(mfrow = 1:2)
plot_sim_summary(summary_thresholds, xlab = "# included seasons", ylab = "threshold")
plot_exceedane_summary(summary_exceedance, xlab = "# included seasons", ylab = "exceedance proportion")


##############################################
### Using one observation per season
##############################################

# initialize matrices to store results (thresholds and exceedance proportions)
thresholds1_us_0.4 <- matrix(NA, nrow = n_sim, ncol = length(range_i.seasons))
colnames(thresholds1_us_0.4) <- paste0("i.seasons_", range_i.seasons)
thresholds1_us_0.9 <- thresholds1_us_0.975 <- thresholds1_us_0.4

thresholds1_us_0.4 <- matrix(NA, nrow = n_sim, ncol = length(range_i.seasons))
colnames(thresholds1_us_0.4) <- paste0("i.seasons_", range_i.seasons)
thresholds1_us_0.9 <- thresholds1_us_0.975 <-
  exceedance1_us_0.4 <- exceedance1_us_0.9 <- exceedance1_us_0.975 <-
  thresholds1_us_0.4

for(k in 1:n_sim){

  set.seed(k)

  # run through different numbers of past seasons used:
  for(a in seq_along(range_i.seasons)){
    # split into training and test data:
    inds_train <- sample(1:ncol(dat_for_mem), size = range_i.seasons[a], replace = TRUE)
    dat_train <- dat_for_mem[, inds_train]
    dat_test <- dat_for_mem #[, -inds_train]
    # compute peaks of test seasons:
    peaks_test <- apply(dat_test, 2, max)

    # run memmodel
    memmodel_temp <- memmodel(dat_train, i.seasons = range_i.seasons[a],
                              i.level.intensity = c(0.4, 0.9, 0.975),
                              i.n.max = 1)

    # store thresholds:
    thresholds1_us_0.4[k, a] <- memmodel_temp$intensity.thresholds[1]
    thresholds1_us_0.9[k, a] <- memmodel_temp$intensity.thresholds[2]
    thresholds1_us_0.975[k, a] <- memmodel_temp$intensity.thresholds[3]

    # compute and store exceedance proportions:
    exceedance1_us_0.4[k, a] <- mean(peaks_test > thresholds1_us_0.4[k, a])
    exceedance1_us_0.9[k, a] <- mean(peaks_test > thresholds1_us_0.9[k, a])
    exceedance1_us_0.975[k, a] <- mean(peaks_test > thresholds1_us_0.975[k, a])
  }
  print(k)
}

# save results:
save(thresholds1_us_0.4, thresholds1_us_0.9, thresholds1_us_0.975,
     exceedance1_us_0.4, exceedance1_us_0.9, exceedance1_us_0.975,
     file = "Results/results1_us.rda")
load("Results/results1_us.rda")

# compute summaries using custom function
summary_thresholds1 <- sim_summary(thresholds1_us_0.4, thresholds1_us_0.9, thresholds1_us_0.975, range_i.seasons, interval = c(0.1, 0.9))
summary_exceedance1 <- sim_summary(exceedance1_us_0.4, exceedance1_us_0.9, exceedance1_us_0.975, range_i.seasons, interval = c(0.1, 0.9))

# plot:
par(mfrow = 1:2)
plot_sim_summary(summary_thresholds1, xlab = "# included seasons", ylab = "threshold")
plot_exceedane_summary(summary_exceedance1, xlab = "# included seasons", ylab = "exceedance proportion")



#####################################################
### Using default settings of mem, but without log trafo
#####################################################


# initialize matrices to store results (thresholds and exceedance proportions)
thresholds_nolog_us_0.4 <- matrix(NA, nrow = n_sim, ncol = length(range_i.seasons))
colnames(thresholds_nolog_us_0.4) <- paste0("i.seasons_", range_i.seasons)
thresholds_nolog_us_0.9 <- thresholds_nolog_us_0.975 <-
  exceedance_nolog_us_0.4 <- exceedance_nolog_us_0.9 <- exceedance_nolog_us_0.975 <-
  thresholds_nolog_us_0.4

# run simulation:
for(k in 1:n_sim){
  set.seed(k)

  # run through different numbers of past seasons used:
  for(a in seq_along(range_i.seasons)){

    # split into training and test:
    inds_train <- sample(1:ncol(dat_for_mem), size = range_i.seasons[a], replace = TRUE)
    dat_train <- dat_for_mem[, inds_train]
    dat_test <- dat_for_mem # [, -inds_train]
    # compute peaks of test seasons:
    peaks_test <- apply(dat_test, 2, max)

    # run memmodel:
    memmodel_temp <- memmodel(dat_train, i.seasons = range_i.seasons[a],
                              i.level.intensity = c(0.4, 0.9, 0.975),
                              i.type.intensity = 5)

    # store thresholds:
    thresholds_nolog_us_0.4[k, a] <- memmodel_temp$intensity.thresholds[1]
    thresholds_nolog_us_0.9[k, a] <- memmodel_temp$intensity.thresholds[2]
    thresholds_nolog_us_0.975[k, a] <- memmodel_temp$intensity.thresholds[3]

    # compute and store exceedance proportions:
    exceedance_nolog_us_0.4[k, a] <- mean(peaks_test > thresholds_nolog_us_0.4[k, a])
    exceedance_nolog_us_0.9[k, a] <- mean(peaks_test > thresholds_nolog_us_0.9[k, a])
    exceedance_nolog_us_0.975[k, a] <- mean(peaks_test > thresholds_nolog_us_0.975[k, a])
  }
  print(k)
}

# save results
save(thresholds_nolog_us_0.4, thresholds_nolog_us_0.9, thresholds_nolog_us_0.975,
     exceedance_nolog_us_0.4, exceedance_nolog_us_0.9, exceedance_nolog_us_0.975,
     file = "Results/results_nolog_us.rda")
load("Results/results_nolog_us.rda")

# compute summaries using custom function
summary_thresholds_nolog <- sim_summary(thresholds_nolog_us_0.4, thresholds_nolog_us_0.9, thresholds_nolog_us_0.975, range_i.seasons, interval = c(0.1, 0.9))
summary_exceedance_nolog <- sim_summary(exceedance_nolog_us_0.4, exceedance_nolog_us_0.9, exceedance_nolog_us_0.975, range_i.seasons, interval = c(0.1, 0.9))

# plot
par(mfrow = 1:2)
plot_sim_summary(summary_thresholds_nolog, xlab = "# included seasons", ylab = "threshold")
plot_exceedane_summary(summary_exceedance_nolog, xlab = "# included seasons", ylab = "exceedance proportion")




##############################################
### Using one observation per season and without log trafo
##############################################

# initialize matrices to store results (thresholds and exceedance proportions)
thresholds1_nolog_us_0.4 <- matrix(NA, nrow = n_sim, ncol = length(range_i.seasons))
colnames(thresholds1_nolog_us_0.4) <- paste0("i.seasons_", range_i.seasons)
thresholds1_nolog_us_0.9 <- thresholds1_nolog_us_0.975 <- thresholds1_nolog_us_0.4

thresholds1_nolog_us_0.4 <- matrix(NA, nrow = n_sim, ncol = length(range_i.seasons))
colnames(thresholds1_nolog_us_0.4) <- paste0("i.seasons_", range_i.seasons)
thresholds1_nolog_us_0.9 <- thresholds1_nolog_us_0.975 <-
  exceedance1_nolog_us_0.4 <- exceedance1_nolog_us_0.9 <- exceedance1_nolog_us_0.975 <-
  thresholds1_nolog_us_0.4

for(k in 1:n_sim){

  set.seed(k)

  # run through different numbers of past seasons used:
  for(a in seq_along(range_i.seasons)){
    # split into training and test data:
    inds_train <- sample(1:ncol(dat_for_mem), size = range_i.seasons[a], replace = TRUE)
    dat_train <- dat_for_mem[, inds_train]
    dat_test <- dat_for_mem #[, -inds_train]
    # compute peaks of test seasons:
    peaks_test <- apply(dat_test, 2, max)

    # run memmodel
    memmodel_temp <- memmodel(dat_train, i.seasons = range_i.seasons[a],
                              i.level.intensity = c(0.4, 0.9, 0.975),
                              i.n.max = 1, i.type.intensity = 5)

    # store thresholds:
    thresholds1_nolog_us_0.4[k, a] <- memmodel_temp$intensity.thresholds[1]
    thresholds1_nolog_us_0.9[k, a] <- memmodel_temp$intensity.thresholds[2]
    thresholds1_nolog_us_0.975[k, a] <- memmodel_temp$intensity.thresholds[3]

    # compute and store exceedance proportions:
    exceedance1_nolog_us_0.4[k, a] <- mean(peaks_test > thresholds1_nolog_us_0.4[k, a])
    exceedance1_nolog_us_0.9[k, a] <- mean(peaks_test > thresholds1_nolog_us_0.9[k, a])
    exceedance1_nolog_us_0.975[k, a] <- mean(peaks_test > thresholds1_nolog_us_0.975[k, a])
  }
  print(k)
}

# save results:
save(thresholds1_nolog_us_0.4, thresholds1_nolog_us_0.9, thresholds1_nolog_us_0.975,
     exceedance1_nolog_us_0.4, exceedance1_nolog_us_0.9, exceedance1_nolog_us_0.975,
     file = "Results/results1_nolog_us.rda")
load("Results/results1_nolog_us.rda")

# compute summaries using custom function
summary_thresholds1_nolog_us <- sim_summary(thresholds1_nolog_us_0.4, thresholds1_nolog_us_0.9, thresholds1_nolog_us_0.975, range_i.seasons, interval = c(0.1, 0.9))
summary_exceedance1_nolog_us <- sim_summary(exceedance1_nolog_us_0.4, exceedance1_nolog_us_0.9, exceedance1_nolog_us_0.975, range_i.seasons, interval = c(0.1, 0.9))

# plot:
par(mfrow = 1:2)
plot_sim_summary(summary_thresholds1_nolog_us, xlab = "# included seasons", ylab = "threshold")
plot_exceedane_summary(summary_exceedance1_nolog_us, xlab = "# included seasons", ylab = "exceedance proportion")


par(mfrow = c(2, 2))

plot_sim_summary(summary_thresholds, xlab = "# included seasons", ylab = "threshold")
# plot_sim_summary(summary_exceedance, xlab = "# included seasons", ylab = "exceedance proportion",
#                  ylim = 0:1, show_bands = FALSE)
plot_exceedane_summary(summary_exceedance, xlab = "# included seasons", ylab = "av. proportion per category")

plot_sim_summary(summary_thresholds1, xlab = "# included seasons", ylab = "threshold")
# plot_sim_summary(summary_exceedance1, xlab = "# included seasons", ylab = "exceedance proportion",
#                  ylim = 0:1, show_bands = FALSE)
plot_exceedane_summary(summary_exceedance1, xlab = "# included seasons", ylab = "av. proportion per category")

