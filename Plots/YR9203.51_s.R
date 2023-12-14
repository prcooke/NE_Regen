## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/ER9203.51ss.png", width = 720, height = 480)
## make the plot
ss.10 <- ss(G9203.51$time, G9203.51$dFF, nknots = 15, m = 2)
plot(G9203.51$time, G9203.51$dFF, type = "l", xlim = c(-8, 30), main = "Yes Response: 9203.51", 
     xlab = substitute(paste(bold('Time'))), ylab = substitute(paste(bold('dF/F'))))
lines(predict(ss.10, G9203.51$time), col = "green", lwd = 2)
abline(a = 0, b = 0, h = 0, v = 0, lwd = 1)
dev.off()