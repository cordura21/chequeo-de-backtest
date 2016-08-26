

library(tidyr)
library(dplyr)
library(quantreg)

managers <- readRDS('all_returns.RDS') %>% tbl_df()
base_ticker_name <- "DONCHIAN"
base_returns <- managers %>% filter(ticker == base_ticker_name)
managers <- managers %>% filter(ticker != base_ticker_name)


cross_data <- merge(managers,base_returns,by=c('date'))


library(ggplot2)
ggplot(cross_data,aes(x=value.x,y= value.y)) + 
  geom_point() + facet_wrap(~ticker.x,scales = 'free') + theme_linedraw()
