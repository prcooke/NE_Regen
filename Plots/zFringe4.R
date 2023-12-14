## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/zFringe4.png", width = 720, height = 480)
## make the plot
plot(G9202.32$time, G9202.32$dFF, type = "n", xlim = c(-8, 30), ylim = c(-0.5, 1.5), 
     main = "Fringe Cases: Z-score = 4", 
     xlab = substitute(paste(bold('Time'))), ylab = substitute(paste(bold('dF/F'))))
lines(predict(ss.9025.73, G9025.73$time), col = "azure4", lwd = 2)
lines(predict(ss.9023.12, G9023.12$time), col = "azure4", lwd = 2)
lines(predict(ss.9204.11, G9204.11$time), col = "darkgoldenrod", lwd = 2)
lines(predict(ss.9022.11, G9022.11$time), col = "deeppink", lwd = 2)
lines(predict(ss.9202.32, G9202.32$time), col = "deeppink", lwd = 2)
lines(predict(ss.9202.12, G9202.12$time), col = "darkgoldenrod", lwd = 2)
lines(predict(ss.9203.53, G9203.53$time), col = "deeppink", lwd = 2)
lines(predict(ss.9023.13, G9023.13$time), col = "darkgoldenrod", lwd = 2)
lines(predict(ss.9025.53, G9025.53$time), col = "darkgoldenrod", lwd = 2)
lines(predict(ss.9202.13, G9202.13$time), col = "darkgoldenrod", lwd = 2)
legend("topright", 
       legend = c("Yes Reference", "No Reference", 
                  "Questionable: 9204.11", "No: 9022.11", "No: G9202.32",
                  "Questionable: 9202.12", "No: 9203.53", "Questionable: 9023.13",
                  "Questionable: 9025.53", "Questionable: 9202.13"),
       fill = c("azure4", "azure4", "darkgoldenrod", "deeppink", "deeppink",
                "darkgoldenrod", "deeppink", "darkgoldenrod", "darkgoldenrod", "darkgoldenrod"))
legend("topleft", legend = c("Included", "Excluded"), lty = 1:2)
abline(a = 0, b = 0, h = 0, v = 0, lwd = 1)
dev.off()