data <- read.csv('./data/01_join.csv')

model_enjoyment <- lm(enjoyment ~ manuscriptOverDue + source + sleep_hours + days_since_roasting, data=data)

saveRDS(model_enjoyment, './outputs/models/enjoyment.rds')