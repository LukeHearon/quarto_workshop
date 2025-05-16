library(dplyr)
library(ggplot2)

data <- read.csv('./data/01_join.csv') %>% 
  mutate(
    sleep_deficit = 8-sleep_hours,
    coffee_age = case_when(
      days_since_roasting < 10 ~ 'fresh',
      days_since_roasting < 20 ~ 'stale',
      T ~ 'foul'
    )
  )


enjoyment <- ggplot(
  data = data,
  aes(
    x = sleep_deficit,
    y = enjoyment,
    color = source
  )
) +
  geom_point() +
  geom_smooth(method='lm', se=F) +
  theme_bw()

  
  # save to outputs, for preview
  ggsave(
    filename = './outputs/plots/sleep_enjoyment.png',
    plot = enjoyment,
    width=6,
    height=5
  )
  
  # save as rds, for manuscript
  saveRDS(enjoyment, './outputs/plots/sleep_enjoyment.rds')