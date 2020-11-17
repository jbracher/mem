sim_summary <- function(results_0.4, results_0.9, results_0.975, range_i.seasons,
                        interval = c(0.025, 0.975)){
  if(length(interval) != 2) stop("interval needs to be of length 2.")
  interval <- sort(interval)

  ret <- list()

  ret$averages <- matrix(ncol = 3, nrow = length(range_i.seasons))

  ret$averages <- matrix(ncol = 3, nrow = length(range_i.seasons))
  colnames(ret$averages) <- c("medium_0.4", "high_0.9", "very_high_0.975")
  rownames(ret$averages) <- paste0("i.seasons_", range_i.seasons)

  ret$averages[, "medium_0.4"] <- colMeans(results_0.4, na.rm = TRUE)
  ret$averages[, "high_0.9"] <- colMeans(results_0.9, na.rm = TRUE)
  ret$averages[, "very_high_0.975"] <- colMeans(results_0.975, na.rm = TRUE)

  for(p in interval){
    ret[[paste0("q_", p)]] <- NA*ret$averages

    ret[[paste0("q_", p)]][, "medium_0.4"] <- apply(results_0.4, MARGIN = 2, FUN = quantile, na.rm = TRUE, p = p)
    ret[[paste0("q_", p)]][, "high_0.9"] <- apply(results_0.9, MARGIN = 2, FUN = quantile, na.rm = TRUE, p = p)
    ret[[paste0("q_", p)]][, "very_high_0.975"] <- apply(results_0.975, MARGIN = 2, FUN = quantile, na.rm = TRUE, p = p)
  }
  ret$range_i.seasons <- range_i.seasons
  return(ret)
}

# modify the alpha value of a given color (to generate transparent versions for prediction bands)
modify_alpha <- function(col, alpha){
  x <- col2rgb(col)/255
  rgb(x[1], x[2], x[3], alpha = alpha)
}

plot_sim_summary <- function(sim_summary, ylim = NULL, show_bands = TRUE, ...){
  ind_lower <- names(sim_summary)[grepl("q_", names(sim_summary))][1]
  ind_upper <- names(sim_summary)[grepl("q_", names(sim_summary))][2]

  if(is.null(ylim)){
    yl <- c(0, 1.5*max(sim_summary$averages[, "very_high_0.975"], na.rm = TRUE))
  }else{
    yl <- ylim
  }

  plot(sim_summary$range_i.seasons,
       sim_summary$averages[, "medium_0.4"], ylim = yl,
       col = "darkgoldenrod1", type = "b", pch = 15, ...)
  if(show_bands){
    polygon(c(sim_summary$range_i.seasons, rev(sim_summary$range_i.seasons)),
            c(sim_summary[[ind_lower]][, "medium_0.4"], rev(sim_summary[[ind_upper]][, "medium_0.4"])), border = NA,
            col = modify_alpha("darkgoldenrod1", 0.2))
  }


  lines(sim_summary$range_i.seasons, sim_summary$averages[, "high_0.9"], col = "darkorange", type = "b", pch = 15)
  if(show_bands){
    polygon(c(sim_summary$range_i.seasons, rev(sim_summary$range_i.seasons)),
            c(sim_summary[[ind_lower]][, "high_0.9"], rev(sim_summary[[ind_upper]][, "high_0.9"])), border = NA,
            col = modify_alpha("darkorange", 0.2))
  }


  lines(sim_summary$range_i.seasons, sim_summary$averages[, "very_high_0.975"], col = "red", type = "b", pch = 15)
  if(show_bands){
    polygon(c(sim_summary$range_i.seasons, rev(sim_summary$range_i.seasons)),
            c(sim_summary[[ind_lower]][, "very_high_0.975"], rev(sim_summary[[ind_upper]][, "very_high_0.975"])), border = NA,
            col = modify_alpha("red", 0.2))
  }
}

plot_exceedane_summary <- function(summary_exceedance, ...){
  summary_exceedance$averages
  range_i.seasons <- as.numeric(gsub("i.seasons_", "", rownames(summary_exceedance$averages), 1))
  plot(NULL, xlim = range(range_i.seasons), ylim = 0:1, ...)
  polygon(c(range_i.seasons, rev(range_i.seasons)),
          rep(0:1, each = length(range_i.seasons)), col = "red", border = NA)
  polygon(c(range_i.seasons, rev(range_i.seasons)),
          1 - c(summary_exceedance$averages[, "very_high_0.975"], rep(1, nrow(summary_exceedance$averages))),
          col = "darkorange", border = NA)
  polygon(c(range_i.seasons, rev(range_i.seasons)),
          1 - c(summary_exceedance$averages[, "high_0.9"], rep(1, nrow(summary_exceedance$averages))),
          col = "darkgoldenrod1", border = NA)
  polygon(c(range_i.seasons, rev(range_i.seasons)),
          1 - c(summary_exceedance$averages[, "medium_0.4"], rep(1, nrow(summary_exceedance$averages))),
          col = "chartreuse4", border = NA)

  abline(h = c(0.4, 0.9, 0.975), lty = 3)
}
