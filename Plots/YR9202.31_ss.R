## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/YR9202.31ss.png", width = 720, height = 480)
## make the plot
ss.3 <- ss(G9202.31$time, G9202.31$dFF, nknots = 15, m = 2)
plot(G9202.31$time, G9202.31$dFF, type = "l", xlim = c(-8, 30), main = "Yes: 9202.31", 
     xlab = substitute(paste(bold('Time'))), ylab = substitute(paste(bold('dF/F'))))
lines(predict(ss.3, G9202.31$time), col = "green", lwd = 2)
abline(a = 0, b = 0, h = 0, v = 0, lwd = 1)
dev.off()