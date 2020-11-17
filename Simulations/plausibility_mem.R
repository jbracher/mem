# checking that the mam function does what I think it does:

setwd("/home/johannes/Documents/Ideas/mem/Simulations")
library(mem)
library(HIDDA.forecasting)

# get Swiss data:
data("CHILI")
# bring in format for mem:
dat_ch <- data.frame(date = index(CHILI), value = as.vector(CHILI))
dat_ch$week <- MMWRweek::MMWRweek(dat_ch$date)$MMWRweek
dat_ch$year <- MMWRweek::MMWRweek(dat_ch$date)$MMWRyear
dat_ch$season[dat_ch$week <= 40] <- paste0(dat_ch$year[dat_ch$week <= 40] - 1, "/", dat_ch$year[dat_ch$week <= 40])
dat_ch$season[dat_ch$week > 40] <- paste0(dat_ch$year[dat_ch$week > 40], "/", dat_ch$year[dat_ch$week > 40] + 1)
for(i in 1:nrow(dat_ch)) dat_ch$week_in_season[i] <- sum(dat_ch$season[1:i] == dat_ch$season[i])

# add population:
pop_ch <- read.csv("../Data/population_ch.csv")
pop_ch$season <- paste0(pop_ch$year - 1, "/", pop_ch$year)
pop_ch$year <- NULL
dat_ch <- merge(dat_ch, pop_ch, by = "season")

dat_ch$inc <- dat_ch$value*100000/dat_ch$population

dat_ch <- subset(dat_ch, !(season %in% c("1999/2000", "2009/2010", "2016/2017")))
dat_ch <- subset(dat_ch, week_in_season <= 30)
dat_ch <- dat_ch[, c("week_in_season", "season", "inc")]
dat_ch_wide <- reshape(dat_ch, direction = "wide", idvar = "week_in_season", timevar = "season", v.names = "inc")

dat_for_mem <- (dat_ch_wide[, grepl(pattern = "/", colnames(dat_ch_wide), fixed = TRUE)])


# run mem models with and without log
memmod <- memmodel(dat_for_mem, i.seasons = 10,
                   i.level.intensity = c(0.4, 0.9, 0.975),
                   i.n.max = 1)
memmod$intensity.thresholds

memmod_nolog <- memmodel(dat_for_mem, i.seasons = 10,
                   i.level.intensity = c(0.4, 0.9, 0.975),
                   i.n.max = 1, i.type.intensity = 5)
memmod_nolog$intensity.thresholds

pks <- tail(apply(dat_for_mem, 2, max), 10)
log_pks <- log(pks)

exp(mean(log_pks) + 1.96*sd(log_pks))
mean(pks) + 1.96*sd(pks)

