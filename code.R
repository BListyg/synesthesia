library(tm)
library(RColorBrewer)
library(dplyr)
library(TraMineR)
library(readxl)

data <- read_excel("~/Desktop/dream.xlsx",
                   col_names = F,sheet = 1) %>%
  apply(.,2,rev) %>% 
  apply(.,2,removeNumbers) %>% 
  apply(.,2,function(x)
  {gsub(pattern = '/',
        replacement = NA,
        x = x)})

qual_col_pals = brewer.pal.info[brewer.pal.info$category == 'qual',]
col_vector = unlist(
  mapply(
    brewer.pal,
    qual_col_pals$maxcolors, 
    rownames(qual_col_pals)))

data %>% 
  seqdef(cpal=sample(col_vector, length(unique(c(data))) -1),xtstep = 0) %>%
  seqIplot(with.legend	= T,
           ltext = NA,
           ytlab=NA,
           xtlab=NA,
           ylab=NA,
           xlab=NA,
           main = "",
           asp = 3
  )

