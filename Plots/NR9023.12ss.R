## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/NR9023.12ss.png", width = 720, height = 480)
## make the plot
ss.1 <- ss(G9023.12$time, G9023.12$dFF, nknots = 15, m = 2)
plot(G9023.12$time, G9023.12$dFF, type = "l", xlim = c(-8, 30), main = "No Response: 9023.12", 
     xlab = substitute(paste(bold('Time'))), ylab = substitute(paste(bold('dF/F'))))
lines(predict(ss.1, G9023.12$time), col = "green", lwd = 2)
abline(a = 0, b = 0, h = 0, v = 0, lwd = 1)
dev.off()