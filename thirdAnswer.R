availabilityPercentage<-function(x){ #function that calculates the
  c <- c()                            #availability in percentage of a year
  for (i in 1:length(x)) {
    c[i]=(x[i]*100)/365
  }
  c
}

#availability in percentage of all accomodations in Berlin
availabilityPercentage<-availabilityPercentage(berlin$availability_365)
availabilityPercentage[c(1:10)]