Performance <- function(x,scale = 252) {
  require(PerformanceAnalytics)
  cumRetx = Return.cumulative(x)
  annRetx = Return.annualized(x, scale)
  sharpex = SharpeRatio.annualized(x, scale)
  winpctx = length(x[x > 0])/length(x[x != 0])
  annSDx = sd.annualized(x, scale)
  
  DDs <- findDrawdowns(x)
  maxDDx = min(DDs$return)
  maxLx = max(DDs$length)
  
  Perf = c(cumRetx, annRetx, sharpex, winpctx, annSDx, maxDDx, maxLx)
  names(Perf) = c("Cumulative Return", "Annual Return","Annualized Sharpe Ratio",
                  "Win %", "Annualized Volatility", "Maximum Drawdown", "Max Length Drawdown")
  return(Perf)
}

Performance(edhec[,2], scale = 12)
data(edhec)

