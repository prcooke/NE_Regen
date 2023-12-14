## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/NR9202.32.png", width = 480, height = 960)
## make the plot
par(mfrow = c(4, 1))
## Butterworth Filter
plot(G9202.32$time, G9202.32$dFF, type = "l", main = "Butterworth Filter", xlab = "Time", ylab = "dF/F")
z1 <- filtfilt(stable, G9202.32$dFF)
lines(G9202.32$time, z1, col = "green", lwd = 2)
# Chebyshev I Filter
plot(G9202.32$time, G9202.32$dFF, type = "l", main = "Chebyshev I Filter", xlab = "Time", ylab = "dF/F")
z1 <- filtfilt(stable, G9202.32$dFF)
lines(G9202.32$time, z1, col = "green", lwd = 2)
# smooth.spline LPF
lowpass.spline.1 <- smooth.spline(G9202.32$time, G9202.32$dFF, spar = .8)
plot(G9202.32$time, G9202.32$dFF, type = "l", main = "smooth.spline LPF", xlab = "Time", ylab = "dF/F")
lines(predict(lowpass.spline.1, G9202.32$time), col = "green", lwd = 2)
# ss LPF
ss.1 <- ss(G9202.32$time, G9202.32$dFF, nknots = 15, m = 2)
plot(G9202.32$time, G9202.32$dFF, type = "l", main = "smooth.spline LPF", xlab = "Time", ylab = "dF/F")
lines(predict(ss.1, G9202.32$time), col = "green", lwd = 2)
dev.off()