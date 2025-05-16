library(dplyr)
library(ggplot2)

data <- read.csv('./data/01_join.csv')


# Histogram of sleep ----
#
  sleep_distribution <- ggplot(
    data = data,
    aes(
      x = sleep_hours,
      fill = manuscriptOverDue
    )
  ) +
    geom_histogram(color = 'black', alpha=0.5, position='identity', bins=10) +
    theme_bw() +
    scale_fill_manual(values=c('yes'='red', 'no'='blue')) +
    ggtitle('Distribution of sleep the night before coffee') +
    xlab('hours of sleep')
  
  # save to outputs, for preview
  ggsave(
    filename = './outputs/plots/sleep_distribution.png',
    plot = sleep_distribution,
    width=6,
    height=5
  )
  
  # save as rds, for manuscript
  saveRDS(sleep_distribution, './outputs/plots/sleep_distribution.rds')

 