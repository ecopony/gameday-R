# Just getting going here.
#
# Starting with some basics to load data from a PostgreSQL database.
# See https://github.com/ecopony/pggameday getting it filled with data.

loadPitchesForYear <- function(year) {
  drv <- dbDriver("PostgreSQL")
  con <- dbConnect(drv, dbname="go-gameday", host="localhost")
  query <- paste("select * from pitches where year =",year, sep="")
  res <- dbSendQuery(con, query)
  fetch(res, n=-1)
}

loadHitsForYear <- function(year) {
  drv <- dbDriver("PostgreSQL")
  con <- dbConnect(drv, dbname="go-gameday", host="localhost")
  query <- paste("select * from hits where year =",year, sep="")
  res <- dbSendQuery(con, query)
  fetch(res, n=-1)
}
