## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/Exploring GCaMP Response Variation.png", width = 720, height = 480)
## make the plot
plot(G9202.32$time, G9202.32$dFF, type = "n", xlim = c(-8, 30), ylim = c(-0.5, 2), 
     main = "Exploring GCaMP Response Variation", 
     xlab = substitute(paste(bold('Time'))), ylab = substitute(paste(bold('dF/F'))))
lines(predict(ss.1, G9202.32$time), col = "blueviolet", lwd = 2)
lines(predict(ss.4, G9204.13$time), col = "darkred", lwd = 2)
lines(predict(ss.6, G9202.12$time), col = "chocolate2", lwd = 2)
lines(predict(ss.8, G9203.31$time), col = "chartreuse4", lwd = 2)
lines(predict(ss.10, G9203.51$time), col = "deepskyblue2", lwd = 2)
abline(a = 0, b = 0, h = 0, v = 0, lwd = 1)
legend("topright", 
       legend = c("No Response: 9202.32", "Good Response: 9204.13", 
                  "Poor Response: 9202.12", "Is it a response?: G9203.31", 
                  "Early Response: G9203.51"),
       fill = c("blueviolet", "darkred", "chocolate2", "chartreuse4", "deepskyblue2"))
dev.off()