library(dplyr)

data <- read.csv('./data/01_join.csv')

model_sleep <- lm(sleep_hours ~ manuscriptOverDue, data=data)

saveRDS(model_sleep, './outputs/models/sleep.rds')