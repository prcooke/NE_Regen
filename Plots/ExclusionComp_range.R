## Required packages
library(data.table)
library(dplyr)
library(tidyverse)
library(gsignal)
library(boxfilter)
library(npreg)
## Open a png file
png(filename = "./plots/ExclusionComp_Range.png", width = 720, height = 480)
## make the plot
plot(G9202.32$time, G9202.32$dFF, type = "n", xlim = c(-8, 30), ylim = c(-0.5, 1.5), 
     main = "Exclusion Criteria: Range = 0.5", 
     xlab = substitute(paste(bold('Time'))), ylab = substitute(paste(bold('dF/F'))))
lines(predict(ss.9025.11, G9025.11$time[11:200]), col = "chartreuse4", lwd = 2)
lines(predict(ss.9025.12, G9025.12$time[11:200]), col = "chartreuse4", lwd = 2)
lines(predict(ss.9025.13, G9025.13$time[11:200]), col = "deeppink", lwd = 2)
lines(predict(ss.9203.11, G9203.11$time[11:200]), col = "chartreuse4", lwd = 2)
lines(predict(ss.9203.14, G9203.14$time[11:200]), col = "deeppink", lwd = 2)
lines(predict(ss.9025.72, G9025.72$time[11:200]), col = "deeppink", lwd = 2)
lines(predict(ss.9023.11, G9023.11$time[11:200]), col = "chartreuse4", lwd = 2)
lines(predict(ss.9023.12, G9023.12$time[11:200]), col = "chartreuse4", lwd = 2)
lines(predict(ss.9022.11, G9022.11$time[11:200]), col = "chartreuse4", lwd = 2)
lines(predict(ss.9022.13, G9022.13$time[11:200]), col = "chartreuse4", lwd = 2)
lines(predict(ss.9025.32, G9025.32$time[11:200]), col = "chartreuse4", lwd = 2)
lines(predict(ss.9025.53, G9025.53$time[11:200]), col = "chartreuse4", lwd = 2)
lines(predict(ss.9023.13, G9023.13$time[11:200]), col = "chartreuse4", lwd = 2)
lines(predict(ss.9023.33, G9023.33$time[11:200]), col = "chartreuse4", lwd = 2)
lines(predict(ss.9025.51, G9025.51$time[11:200]), col = "blue", lwd = 2)
lines(predict(ss.9203.53, G9203.53$time[11:200]), col = "chartreuse4", lwd = 2)
legend("topright", 
       legend = c("9025.11", "9025.12", "9025.13", "9203.11", "9203.14", "9025.72",
                  "9023.11", "9023.12", "9022.11", "9022.13", "9025.32", "9025.53",
                  "9023.13", "9023.33", "9025.51", "9203.53"),
       fill = c("chartreuse4", "chartreuse4", "deeppink", "chartreuse4", "deeppink",
                "deeppink", "chartreuse4", "chartreuse4", "chartreuse4", "chartreuse4",
                "chartreuse4", "chartreuse4", "chartreuse4", "chartreuse4",
                "blue", "chartreuse4"))
legend("topleft", legend = c("Exclude", "Include", "Near Threshold (0.53)"), 
       fill = c("deeppink", "chartreuse4", "blue"))
abline(a = 0, b = 0, h = 0, v = 0, lwd = 1)
dev.off()