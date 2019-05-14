library(dplyr)
library(tm)
library(RColorBrewer)
library(reticulate)
library(TraMineR)

plot_gen <- function(lyrics){

source_python("/Users/Ben/Documents/Python Scripts/test_g2p.py")

# test_g2p('Hello')

ex <- c(text) %>% 
  strsplit(x = ., split = '\n') %>% 
  unlist

qual_col_pals <- brewer.pal.info[brewer.pal.info$category == 'qual',]

col_vector <- unlist(
  mapply(
    brewer.pal,
    
    qual_col_pals$maxcolors, 
    rownames(qual_col_pals))
)

data <- test_g2p(ex) %>% 
  apply(., 2, unlist) %>% 
  lapply(., function(x)matrix(x, nrow=1)) %>% 
  lapply(., function(x)gsub(x, pattern = " ", replacement = NA)) %>%
  lapply(., function(x){
    x[!is.na(x)]
  }) %>% 
  lapply(., function(x)matrix(x, nrow=1)) %>% 
  plyr::rbind.fill.matrix() %>% 
  apply(.,2,rev) %>% 
  apply(.,2,removeNumbers)

data %>% 
  seqdef(cpal=sample(col_vector, length(unique(c(data))) -1),xtstep = 0) %>%
  seqIplot(with.legend	= T,
           ltext = NA,
           ytlab=NA,
           xtlab=NA,
           ylab=NA,
           xlab=NA,
           main = "",
           asp = 2
  )

test_g2p(ex) %>% 
  apply(., 2, unlist) %>% 
  lapply(., function(x)matrix(x, nrow=1)) %>% 
  lapply(., function(x)gsub(x, pattern = " ", replacement = NA)) %>%
  lapply(., function(x){
    x[!is.na(x)]
  }) %>% 
  lapply(., function(x)matrix(x, nrow=1)) %>% 
  plyr::rbind.fill.matrix() %>% 
  apply(.,2,removeNumbers) %>% 
  seqdef(cpal=sample(col_vector, length(unique(c(data))) -1),xtstep = 0) 
}
