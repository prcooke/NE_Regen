## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/ER9203.51.png", width = 480, height = 960)
## make the plot
par(mfrow = c(4, 1))
## Butterworth Filter
stable <- butter(3, 1/30, "low", output = "Sos")
plot(G9203.51$time, G9203.51$dFF, type = "l", main = "Butterworth Filter", xlab = "Time", ylab = "dF/F")
z10 <- filtfilt(stable, G9203.51$dFF)
lines(G9203.51$time, z10, col = "green", lwd = 2)
# Chebyshev I Filter
stable <- cheby1(6, 0.1, 1/25, "low", output = "Sos")
plot(G9203.51$time, G9203.51$dFF, type = "l", main = "Butterworth Filter", xlab = "Time", ylab = "dF/F")
z10 <- filtfilt(stable, G9203.51$dFF)
lines(G9203.51$time, z10, col = "green", lwd = 2)
# smooth.spline LPF
lowpass.spline.10 <- smooth.spline(G9203.51$time, G9203.51$dFF, spar = .8)
plot(G9203.51$time, G9203.51$dFF, type = "l", main = "smooth.spline LPF", xlab = "Time", ylab = "dF/F")
lines(predict(lowpass.spline.10, G9203.51$time), col = "green", lwd = 2)
# ss LPF
ss.10 <- ss(G9203.51$time, G9203.51$dFF, nknots = 15, m = 2)
plot(G9203.51$time, G9203.51$dFF, type = "l", main = "ss LPF", xlab = "Time", ylab = "dF/F")
lines(predict(ss.10, G9203.51$time), col = "green", lwd = 2)
dev.off()