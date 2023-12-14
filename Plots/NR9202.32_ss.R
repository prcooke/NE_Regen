## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/NR9202.32ss.png", width = 720, height = 480)
## make the plot
ss.1 <- ss(G9202.32$time, G9202.32$dFF, nknots = 15, m = 2)
plot(G9202.32$time, G9202.32$dFF, type = "l", xlim = c(-8, 30), main = "No Response: 9202.32", 
     xlab = substitute(paste(bold('Time'))), ylab = substitute(paste(bold('dF/F'))))
lines(predict(ss.1, G9202.32$time), col = "green", lwd = 2)
abline(a = 0, b = 0, h = 0, v = 0, lwd = 1)
dev.off()