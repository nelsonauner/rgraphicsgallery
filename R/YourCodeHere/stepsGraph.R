# date: 2014-03-18
#timeseries
#base

print(getwd())
steps <- read.csv("steps.csv")
steps$date <- as.Date(steps$date)
plot(steps$date,steps$clare,type="l",ylab="daily steps",xlab="date")


