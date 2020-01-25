sum(berlin$price, na.rm=TRUE)
sum(berlin$host_listings_count, na.rm=TRUE)

mean(berlin$host_listings_count, na.rm=TRUE)

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

#This function return index of first 10 best hostings in Berlin based on reviews
indexOfFirstTen<-function(x){
  c=numeric()
  firstTen<-sort(x, decreasing = TRUE)[1:10]
  for (i in 1:length(firstTen)) {
    index<-which(firstTen[i]==x)[i]
    c[i]=index
  }
  return(c)
}
#This function return index of first 10 best hostings in Berlin based on reviews
firstTenBestIndexes<-indexOfFirstTen(berlin$review_scores_rating)

berlin[firstTenBestIndexes,c(1,4:10,12)]

