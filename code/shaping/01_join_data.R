library(dplyr)

dir_raw <- './data/raw'

tasting <- file.path(dir_raw, 'tasting_partial.csv') %>% 
  read.csv()

survey <- file.path(dir_raw, 'survey_partial.csv') %>% 
  read.csv()

data_join <- full_join(tasting, survey, by='participant_id')

write.csv(
  data_join,
  './data/01_join.csv',
  row.names=F
)
