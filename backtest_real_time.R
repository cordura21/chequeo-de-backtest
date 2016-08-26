# Levantar los índices de Grasso
library(readxl)
library(dplyr)
library(tidyr)
bt_oos <- list()

bt_oos$raw.data <- readxl::read_excel('indices-4.xlsx') %>%
  tbl_df() %>% mutate(Date = as.Date(Date)) %>%
  gather(strat,price,-Date) %>% filter(price != 100)

bt_oos$start.days <- bt_oos$raw.data %>%
  group_by(strat) %>% summarise(start = first(Date))

bt_oos$returns <- bt_oos$raw.data %>%
  group_by(strat) %>% mutate(return = TTR::ROC(price,type = 'discrete')) %>%
  mutate(price = NULL) %>% spread(strat,return) %>% filter(Date >= '2007-01-05')

bt_oos$xts <- xts(bt_oos$returns[,-1], bt_oos$returns$Date)
bt_oos$xts <- bt_oos$xts [,sort(names(bt_oos$xts))]
bt_oos$xts.bt_oosPeriod <- bt_oos$xts['2012::']
bt_oos$strat.weights <- c(.8/3,.8/3,.10,.8/3,.05,.05)
bt_oos$portfolio <- Return.portfolio(bt_oos$xts.bt_oosPeriod,bt_oos$strat.weights,rebalance_on = 'quarters')

charts.PerformanceSummary(bt_oos$portfolio, ylog = TRUE, colorset = rainbow6equal)
charts.PerformanceSummary(bt_oos$xts.bt_oosPeriod, ylog = TRUE, colorset = rainbow6equal)

t(Return.annualized(bt_oos$xts.bt_oosPeriod))
t(Return.annualized(bt_oos$portfolio))

