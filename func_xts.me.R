xts.me <- function (x, xts.class = FALSE) {
  require(tidyr)
  retObj <- x %>%
           select(date,ticker,value) %>%
           spread(ticker,value)

  if( xts.class){
    require(xts)
    retObj <- xts(retObj[,-1], retObj$date)
  }
  return(retObj)
}