## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/zFringe8.png", width = 720, height = 480)
## make the plot
plot(G9202.32$time, G9202.32$dFF, type = "n", xlim = c(-8, 30), ylim = c(-0.5, 1.5), 
     main = "Fringe Cases: Z-score = 8", 
     xlab = substitute(paste(bold('Time'))), ylab = substitute(paste(bold('dF/F'))))
lines(predict(ss.9025.73, G9025.73$time), col = "azure4", lwd = 2)
lines(predict(ss.9023.12, G9023.12$time), col = "azure4", lwd = 2)
lines(predict(ss.9025.53, G9025.53$time), col = "darkgoldenrod", lwd = 2)
lines(predict(ss.9025.51, G9025.51$time), col = "chartreuse4", lty = 2, lwd = 2)
lines(predict(ss.9025.74, G9025.74$time), col = "chartreuse4", lty = 2, lwd = 2)
lines(predict(ss.9025.14, G9025.14$time), col = "chartreuse4", lty = 2, lwd = 2)
legend("topright", 
       legend = c("Yes Reference", "No Reference","Questionable: 9025.53", "Yes: 9025.51", 
                  "Yes: 9025.74", "Yes: 9025.14"),
       fill = c("azure4", "azure4", "darkgoldenrod", "chartreuse4", "chartreuse4", "chartreuse4"))
legend("topleft", legend = c("Included", "Excluded"), lty = 1:2)
abline(a = 0, b = 0, h = 0, v = 0, lwd = 1)
dev.off()