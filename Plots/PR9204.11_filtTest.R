## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/MR9204.11.png", width = 480, height = 960)
## make the plot
par(mfrow = c(4, 1))
## Butterworth Filter
stable <- butter(3, 1/30, "low", output = "Sos")
plot(G9204.11$time, G9204.11$dFF, type = "l", main = "Butterworth Filter", xlab = "Time", ylab = "dF/F")
z5 <- filtfilt(stable, G9204.11$dFF)
lines(G9204.11$time, z5, col = "green", lwd = 2)
# Chebyshev I Filter
stable <- cheby1(6, 0.1, 1/25, "low", output = "Sos")
plot(G9204.11$time, G9204.11$dFF, type = "l", main = "Chebyshev I Filter", xlab = "Time", ylab = "dF/F")
z5 <- filtfilt(stable, G9204.11$dFF)
lines(G9204.11$time, z5, col = "green", lwd = 2)
# smooth.spline LPF
lowpass.spline.5 <- smooth.spline(G9204.11$time, G9204.11$dFF, spar = .8)
plot(G9204.11$time, G9204.11$dFF, type = "l", main = "smooth.spline LPF", xlab = "Time", ylab = "dF/F")
lines(predict(lowpass.spline.5, G9204.11$time), col = "green", lwd = 2)
#ss LPF
ss.5 <- ss(G9204.11$time, G9204.11$dFF, nknots = 15, m = 2)
plot(G9204.11$time, G9204.11$dFF, type = "l", main = "ss LPF", xlab = "Time", ylab = "dF/F")
lines(predict(ss.5, G9204.11$time), col = "green", lwd = 2)
dev.off()