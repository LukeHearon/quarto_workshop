library(dplyr)
library(stringr)
library(quarto)

dir_data <- './data'
dir_raw <- file.path(dir_data, 'raw')

dir_outputs <- './outputs'
dir_plots <- file.path(dir_outputs, 'plots')
dir_models <- file.path(dir_outputs, 'models')

UNMAKE <- function(){
  # list all data files
  list.files(dir_data, full.names=T, recursive=T) %>% 
    # but drop any raw data
    .[!stringr::str_detect(., dir_raw)] %>% 
    # delete those files
    file.remove()
  
  # list output files
  list.files(dir_outputs, recursive=T, full.names=T) %>% 
    # and delete them
    file.remove()
}

MAKE <- function(){
  # create directories for plots and models
  dir.create(dir_plots, showWarnings = F, recursive = T)
  dir.create(dir_models, showWarnings = F, recursive = T)
  
  code_dirs <- c('shaping', 'plotting', 'analysis')
  
  envlist <- list()
  
  for(d in code_dirs){
    message('\n\n\nMaking ', d, '\n\n\n')
    scripts <- list.files(file.path('./code', d), full.names = T) %>%
      sort()
    
    for(s in scripts){
      message('sourcing ', s)
      sname <- basename(s)
      envlist[[sname]] <- new.env()
      source(s, local=envlist[[sname]])
    }
  }
  
  quarto::quarto_render('./manuscript/manuscript.qmd')
}


REMAKE <- function(){
  UNMAKE()
  MAKE()
}