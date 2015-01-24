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

plotHitsForPlayerAndYear <- function(player, year) {
  hits <- loadHitsForYear(year)
  player.hits <- subset(hits, batter == player)
  plot(0:250, -250:0, type="n", bg="white")
  lines(c(125, 150, 125, 100, 125), c(-210, -180, -150, -180, -210), col=c("black"))
  points(subset(player.hits$x, player.hits$type=="H"), subset(-player.hits$y, player.hits$type=="H"), pch=10, col=c("red"))
  points(subset(player.hits$x, player.hits$type=="O"), subset(-player.hits$y, player.hits$type=="O"), pch=10, col=c("blue"))
}
