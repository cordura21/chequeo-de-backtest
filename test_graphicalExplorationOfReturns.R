library(tidyr)
library(dplyr)
library(quantreg)
source('func_xts.me.R')

managers <- readRDS('all_returns.RDS') %>% tbl_df()
in_sample <- managers %>% filter(sample == 'in')

in_sample_dates <- in_sample %>% group_by(ticker) %>% 
  summarise(start= first(date),end = last(date))

in_sample_xts <- xts.me(in_sample, xts.class = TRUE)

tbl_is_cagr <-t(Return.annualized(in_sample_xts['2007-07::2011']))
tbl_is_maxDD <-t(maxDrawdown(in_sample_xts['2007-07::2011']))
tbl_is <- merge(tbl_is_cagr,tbl_is_maxDD, by='row.names')

oos_sample <-  managers %>% filter(sample == 'out' & source != 'BACKTEST')

oos_sample_dates <- oos_sample %>% group_by(ticker) %>% 
  summarise(start= first(date),end = last(date))

oos_sample_xts <- xts.me(oos_sample, xts.class = TRUE)['2012::2015']

tbl_oos_cagr <-t(Return.annualized(oos_sample_xts))
tbl_oos_maxDD <-t(maxDrawdown(oos_sample_xts))
tbl_oos <- merge(tbl_oos_cagr,tbl_oos_maxDD, by='row.names')

all_periods <- merge(tbl_is,tbl_oos, by = 'Row.names', all = TRUE)
names(all_periods)[1] <- 'strategy'
our_tf_strats <- c('BREAKOUTS', 'DONCHIAN','TSM')
our_vol_strats <- c('STRANGLES','VIX','STRANGLES EN VIX')
all_periods <- all_periods %>%
  filter(!(strategy %in% our_vol_strats)) %>%
  mutate(`Annualized Return.x` = ifelse(strategy %in% our_tf_strats,
                                        (`Annualized Return.x`-.02)*.8,
                                        `Annualized Return.x`)) %>%
  mutate(`Annualized Return.y` = ifelse(strategy %in% our_tf_strats,
                                        (`Annualized Return.y`-.02)*.8,
                                        `Annualized Return.y`)) %>%
  mutate(mar_is = `Annualized Return.x` / `Worst Drawdown.x`,
         mar_oos = `Annualized Return.y` / `Worst Drawdown.y`) %>%
  mutate(legend = row_number())

xplot <- ggplot(all_periods,aes(x=mar_oos,y=mar_is,
                                color = legend,
                                group = legend)) +
  geom_point() + xlim(-0.15,1.7) + ylim(-0.15,1.7) +
  geom_abline(intercept = 0, slope = 1)
direct.label(xplot)
