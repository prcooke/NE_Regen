## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/NR9203.53ss.png", width = 720, height = 480)
## make the plot
ss.2 <- ss(G9203.53$time, G9203.53$dFF, nknots = 15, m = 2)
plot(G9203.53$time, G9203.53$dFF, type = "l", xlim = c(-8, 30), main = "No Response: 9203.53", 
     xlab = substitute(paste(bold('Time'))), ylab = substitute(paste(bold('dF/F'))))
lines(predict(ss.2, G9203.53$time), col = "green", lwd = 2)
abline(a = 0, b = 0, h = 0, v = 0, lwd = 1)
dev.off()