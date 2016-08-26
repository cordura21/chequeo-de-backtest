names(real$returns.xts)
names(bt$xts.btPeriod)
names(bt$xts.btPeriod) <- c('BREAKOUTS', 'DONCHIAN',
                            'STRANGLES',
                            'TSM',
                            'STRANGLES EN VIX','VIX')

real$returns.xts <- real$returns.xts[,sort(names(real$returns.xts))]
bt$xts.btPeriod <- bt$xts.btPeriod[,sort(names(bt$xts.btPeriod))]

names(bt$xts.btPeriod) == names(real$returns.xts)

t(Return.annualized(bt$xts.btPeriod))
t(Return.annualized(real$returns.xts))

t(maxDrawdown(bt$xts.btPeriod))
t(maxDrawdown(real$returns.xts))


t(maxDrawdown(bt$xts.btPeriod))
t(maxDrawdown(real$returns.xts))
