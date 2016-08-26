# Levantar los índices de Grasso
library(readxl)
library(dplyr)
library(tidyr)
real <- list()

real$raw.data <- readRDS('pnl.RDS') %>% tbl_df() %>%
  select(Fecha,NombreFamilia,PorcRentDiaria) %>%
  mutate(PorcRentDiaria = PorcRentDiaria / 100) %>%
  filter(NombreFamilia %in% c('BREAKOUTS','DONCHIAN','TSM',
                              'VIX','STRANGLES', 'STRANGLES EN VIX'))
names(real$raw.data) <- c('Date','strat', 'return')

real$returns  <- real$raw.data  %>%
  spread(strat,return)
real$returns.xts <- xts(real$returns [,-1], real$returns$Date)

t(Return.annualized(real$returns.xts))
