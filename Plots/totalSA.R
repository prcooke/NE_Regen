# saving PNG of my Total Surface Area graph
## Open a png file
png(filename = "./plots/totalSA.png", width = 480, height = 480)
# the graph
ave__treatment_cut %>%
    ggplot(aes(x = week, y = mean_treat, color = treatment)) +
    geom_point() + 
    geom_line() +
    geom_linerange(aes(ymin = mean_treat - se_treat, ymax = mean_treat + se_treat)) +
    geom_label(aes(label = paste0(n)), hjust = 1.2, vjust = 1) +
    theme_minimal() + 
    scale_x_continuous(breaks = seq(-2, 22, by = 2)) +
    ylab("Normalized Axon Surface Area") +
    ggtitle("Norepienphrine Axons Regrow After Chemical Lesion")
dev.off()