# Levantar los índices de Grasso
library(readxl)
library(dplyr)
library(tidyr)
bt <- list()

bt$raw.data <- readxl::read_excel('indices-4.xlsx') %>%
  tbl_df() %>% mutate(Date = as.Date(Date)) %>%
  gather(strat,price,-Date) %>% filter(price != 100)

bt$start.days <- bt$raw.data %>%
  group_by(strat) %>% summarise(start = first(Date))

bt$returns <- bt$raw.data %>%
  group_by(strat) %>% mutate(return = TTR::ROC(price,type = 'discrete')) %>%
  mutate(price = NULL) %>% spread(strat,return) %>% filter(Date >= '2007-01-05')

bt$xts <- xts(bt$returns[,-1], bt$returns$Date)

charts.PerformanceSummary(bt$xts, ylog = TRUE)