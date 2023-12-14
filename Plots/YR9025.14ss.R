## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/YR9025.14ss.png", width = 720, height = 480)
## make the plot
ss <- ss(G9025.14$time, G9025.14$dFF, nknots = 15, m = 2)
plot(G9025.14$time, G9025.14$dFF, type = "l", xlim = c(-8, 30), main = "Yes: 9025.14", 
     xlab = substitute(paste(bold('Time'))), ylab = substitute(paste(bold('dF/F'))))
lines(predict(ss, G9025.14$time), col = "green", lwd = 2)
abline(a = 0, b = 0, h = 0, v = 0, lwd = 1)
dev.off()