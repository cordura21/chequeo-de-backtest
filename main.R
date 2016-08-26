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
bt$xts <- bt$xts [,sort(names(bt$xts))]
bt$xts.btPeriod <- bt$xts['2007-07-27::2011']
bt$strat.weights <- c(.8/3,.8/3,.10,.8/3,.05,.05)
bt$portfolio <- Return.portfolio(bt$xts.btPeriod,bt$strat.weights,rebalance_on = 'quarters')

charts.PerformanceSummary(bt$portfolio, ylog = TRUE, colorset = rainbow6equal)
charts.PerformanceSummary(bt$xts.btPeriod, ylog = TRUE, colorset = rainbow6equal)

t(Return.annualized(bt$xts.btPeriod))
t(Return.annualized(bt$portfolio))

