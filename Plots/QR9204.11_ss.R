## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/QR9204.11ss.png", width = 720, height = 480)
## make the plot
ss.5 <- ss(G9204.11$time, G9204.11$dFF, nknots = 15, m = 2)
plot(G9204.11$time, G9204.11$dFF, type = "l", xlim = c(-8, 30), main = "Questionable: 9204.11", 
     xlab = substitute(paste(bold('Time'))), ylab = substitute(paste(bold('dF/F'))))
lines(predict(ss.5, G9204.11$time), col = "green", lwd = 2)
abline(a = 0, b = 0, h = 0, v = 0, lwd = 1)
dev.off()