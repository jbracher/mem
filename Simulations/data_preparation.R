# Preparing the different data sets for use of mem

setwd("/home/johannes/Documents/Ideas/mem/Simulations")

# France:

# get data:
dat_fr0 <- read.csv("../Data/raw/ili_fr.csv")

# bring in format for mem:
dat_fr <- data.frame(value = dat_fr0$inc)
dat_fr$week <- dat_fr0$week %% 100
dat_fr$year <- (dat_fr0$week - dat_fr$week)/100
dat_fr$season[dat_fr$week <= 40] <- paste0(dat_fr$year[dat_fr$week <= 40] - 1, "/", dat_fr$year[dat_fr$week <= 40])
dat_fr$season[dat_fr$week > 40] <- paste0(dat_fr$year[dat_fr$week > 40], "/", dat_fr$year[dat_fr$week > 40] + 1)
dat_fr <- dat_fr[order(dat_fr$year, dat_fr$week), ]
for(i in 1:nrow(dat_fr)) dat_fr$week_in_season[i] <- sum(dat_fr$season[1:i] == dat_fr$season[i])

plot(dat_fr$year + dat_fr$week/52, dat_fr$value, type = "l")

# add population:
pop_fr <- read.csv("../Data/raw/population_fr.csv")
pop_fr$season <- paste0(pop_fr$year - 1, "/", pop_fr$year)
pop_fr$year <- NULL

dat_fr <- merge(dat_fr, pop_fr, by = "season")
dat_fr$inc <- dat_fr$value*100000/dat_fr$population

plot(dat_fr$year + dat_fr$week/52, dat_fr$inc, type = "l")

# remove half-seasons at the ends and pandemic season:
dat_fr <- subset(dat_fr, !(season %in% c("1984/1985", "2009/2010", "2020/2021")))
dat_fr <- subset(dat_fr, week_in_season <= 30)
dat_fr <- dat_fr[, c("week_in_season", "season", "inc")]
dat_fr_wide <- reshape(dat_fr, direction = "wide", idvar = "week_in_season", timevar = "season", v.names = "inc")

dat_for_mem_fr <- (dat_fr_wide[, grepl(pattern = "/", colnames(dat_fr_wide), fixed = TRUE)])
plot(dat_for_mem_fr[, 1])
colnames(dat_for_mem_fr) <- gsub("/", ".", gsub("inc.", "season.", colnames(dat_for_mem_fr)))

write.csv(dat_for_mem_fr, file = "../Data/for_mem/ili_mem_fr.csv", row.names = FALSE)



# Switzerland:

library(HIDDA.forecasting)

# get data:
data("CHILI")
# bring in format for mem:
dat_ch <- data.frame(date = index(CHILI), value = as.vector(CHILI))
dat_ch$week <- MMWRweek::MMWRweek(dat_ch$date)$MMWRweek
dat_ch$year <- MMWRweek::MMWRweek(dat_ch$date)$MMWRyear
dat_ch$season[dat_ch$week <= 40] <- paste0(dat_ch$year[dat_ch$week <= 40] - 1, "/", dat_ch$year[dat_ch$week <= 40])
dat_ch$season[dat_ch$week > 40] <- paste0(dat_ch$year[dat_ch$week > 40], "/", dat_ch$year[dat_ch$week > 40] + 1)
for(i in 1:nrow(dat_ch)) dat_ch$week_in_season[i] <- sum(dat_ch$season[1:i] == dat_ch$season[i])

# add population:
pop_ch <- read.csv("../Data/raw/population_ch.csv")
pop_ch$season <- paste0(pop_ch$year - 1, "/", pop_ch$year)
pop_ch$year <- NULL
dat_ch <- merge(dat_ch, pop_ch, by = "season")

dat_ch$inc <- dat_ch$value*100000/dat_ch$population

# remove half-seasons at the ends and pandemic season:
dat_ch <- subset(dat_ch, !(season %in% c("1999/2000", "2009/2010", "2016/2017")))
dat_ch <- subset(dat_ch, week_in_season <= 30)
dat_ch <- dat_ch[, c("week_in_season", "season", "inc")]
dat_ch_wide <- reshape(dat_ch, direction = "wide", idvar = "week_in_season", timevar = "season", v.names = "inc")

dat_for_mem_ch <- (dat_ch_wide[, grepl(pattern = "/", colnames(dat_ch_wide), fixed = TRUE)])
colnames(dat_for_mem_ch) <- gsub("/", ".", gsub("inc.", "season.", colnames(dat_for_mem_ch)))

write.csv(dat_for_mem_ch, file = "../Data/for_mem/ili_mem_ch.csv", row.names = FALSE)

# Spain:
# get data:
dat_es <- read.csv("../Data/raw/ili_es.csv", stringsAsFactors = FALSE)

# remove pandemic season:
dat_es <- subset(dat_es, season != "2009/2010")

available_seasons <- unique(dat_es$season)

dat_for_mem_es <- data.frame(head(subset(dat_es, season == available_seasons[1])$inc_per_100000, 30))


for(i in 2:length(available_seasons)){
  dat_for_mem_es[, i] <- head(subset(dat_es, season == available_seasons[i])$inc_per_100000, 30)
}
colnames(dat_for_mem_es) <- paste0("season.", gsub("/", ".", available_seasons))

write.csv(dat_for_mem_es, file = "../Data/for_mem/ili_mem_es.csv", row.names = FALSE)

# US:
# get data:
dat_us <- read.csv("../Data/raw/ili_us.csv", stringsAsFactors = FALSE)

# remove pandemic season:
dat_us <- subset(dat_us, year != "epiyear_2009")

seasons <- unique(dat_us$year)
dat_for_mem_us <- matrix(ncol = length(seasons), nrow = 35)
colnames(dat_for_mem_us) <- seasons
for(i in seq_along(unique(dat_us$year))){
  dat_for_mem_us[, i] <- subset(dat_us, year == seasons[i])$weighted_ili
}
dat_for_mem_us <- as.data.frame(dat_for_mem_us)

included_seasons <- as.numeric(gsub("epiyear_", "", colnames(dat_for_mem_us)))
colnames(dat_for_mem_us) <- paste0("season.", included_seasons, ".", included_seasons + 1)

write.csv(dat_for_mem_us, file = "../Data/for_mem/ili_mem_us.csv", row.names = FALSE)
