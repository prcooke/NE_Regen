## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/ER9025.72ss.png", width = 720, height = 480)
## make the plot
ss <- ss(G9025.72$time, G9025.72$dFF, nknots = 15, m = 2)
plot(G9025.72$time, G9025.72$dFF, type = "l", xlim = c(-8, 30), main = "Early: 9025.72", 
     xlab = substitute(paste(bold('Time'))), ylab = substitute(paste(bold('dF/F'))))
lines(predict(ss, G9025.72$time), col = "green", lwd = 2)
abline(a = 0, b = 0, h = 0, v = 0, lwd = 1)
dev.off()