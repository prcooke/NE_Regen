## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/YR9204.13ss.png", width = 720, height = 480)
## make the plot
ss.4 <- ss(G9204.13$time, G9204.13$dFF, nknots = 15, m = 2)
plot(G9204.13$time, G9204.13$dFF, type = "l", xlim = c(-8, 30), main = "Yes: 9204.13", 
     xlab = substitute(paste(bold('Time'))), ylab = substitute(paste(bold('dF/F'))))
lines(predict(ss.4, G9204.13$time), col = "green", lwd = 2)
abline(a = 0, b = 0, h = 0, v = 0, lwd = 1)
dev.off()