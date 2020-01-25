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