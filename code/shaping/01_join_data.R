library(dplyr)

data_type <- 'partial'
dir_raw <- './data/raw'

tasting <- file.path(dir_raw, paste0('tasting_', data_type, '.csv')) %>% 
  read.csv()

survey <- file.path(dir_raw, paste0('survey_', data_type, '.csv')) %>% 
  read.csv()

data_join <- full_join(tasting, survey, by='participant_id')

write.csv(
  data_join,
  './data/01_join.csv',
  row.names=F
)
