## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/NR9203.53.png", width = 480, height = 960)
## make the plot
par(mfrow = c(4, 1))
## Butterworth Filter
plot(G9203.53$time, G9203.53$dFF, type = "l", main = "Butterworth Filter", xlab = "Time", ylab = "dF/F")
z2 <- filtfilt(stable, G9203.53$dFF)
lines(G9203.53$time, z2, col = "green", lwd = 2)
# Chebyshev I Filter
plot(G9203.53$time, G9203.53$dFF, type = "l",  main = "Chebyshev I Filter", xlab = "Time", ylab = "dF/F")
z2 <- filtfilt(stable, G9203.53$dFF)
lines(G9203.53$time, z2, col = "green", lwd = 2)
# smooth.spline LPF
lowpass.spline.2 <- smooth.spline(G9203.53$time, G9203.53$dFF, spar = .8)
plot(G9203.53$time, G9203.53$dFF, type = "l", main = "smooth.spline LPF", xlab = "Time", ylab = "dF/F")
lines(predict(lowpass.spline.2, G9203.53$time), col = "green", lwd = 2)
# ss LPF
ss.2 <- ss(G9203.53$time, G9203.53$dFF, nknots = 15, m = 2)
plot(G9203.53$time, G9203.53$dFF, type = "l", main = "No Response: 9203.53")
lines(predict(ss.2, G9203.53$time), col = "green", lwd = 2)
dev.off()