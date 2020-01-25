berlin <- read.csv("Airbnb_Berlin.csv")
length(berlin$price)#same amount like id or hostings in this data

sum(berlin$price, na.rm=TRUE)
sum(berlin$host_listings_count, na.rm=TRUE)

mean(berlin$host_listings_count, na.rm=TRUE)

plot(factor(berlin$review_scores_rating), factor(berlin$host_listings_count),
     pch = 19, col =  1:5, cex = 0.1)

install.packages("ggplot2")
# load ggplot2
library(ggplot2)

max(berlin$price)
max(berlin$accommodates)
max(berlin$minimum_nights)

ggplot(data = berlin,aes(x=factor(review_scores_rating), y=factor(host_listings_count)))+
  geom_point(aes(color =factor(host_listings_count), size =1), alpha=0.7)+
  title("Corelation between review based score and number of listing for each host")+
  xlab("review_scores_rating")+
  ylab("host_listings_count")

ggplot(data = berlin,aes(x=factor(price), y=factor(host_listings_count)))+
  geom_point(aes(color =factor(host_listings_count), size =1), alpha=0.7)+
  xlab("price")+
  ylab("host_listings_count")

availabilityPercentage<-function(x){ #function that calculates the
  c <- c()                            #availability in percentage of a year
  for (i in 1:length(x)) {
    c[i]=(x[i]*100)/365
  }
  c
}

availabilityPercentage<-availabilityPercentage(newBerlin$availability_365)# average availability of all accomodations in Berlin

scatter.smooth(x=berlin$availability_365, y=berlin$minimum_nights, 
               main="Linear Realtion")  # scatterplot

cor(berlin$availability_365, berlin$minimum_nights)#corelation


ggplot(data = berlin, aes(x=berlin$availability_365, y=berlin$minimum_nights)) +
  geom_point(aes(color = "red")) +
  geom_smooth(method = "lm")#Linear regresion x = berlin$availability_365, y = berlin$minimum_nights

ggplot(data = berlin, aes(x=availabilityPercentage, y=berlin$minimum_nights)) +
  geom_point(aes(color = "red")) +
  geom_smooth(method = "lm")#Linear regresion x = availabilityPercentage(using function), y = berlin$minimum_nights


listing_Count_Categorised<-cut(berlin$host_listings_count, 
  breaks= c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,20,50,100,Inf),
  labels = c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16-20","21-50","51-100","100+"))

price_Categorised<-cut(berlin$price, breaks = c(0,10,20,30,40,50,60,70,80,90,100,150,200,250,300,400,500,600,700,800,900,1000,Inf),
                       labels = c("to 10","11-20","21-30","31-40","41-50","51-60","61-70","71-80","81-90","91-100"
                                  ,"101-150","151-200","201-250","251-300","301-400","401-500","501-600","601-700"
                                  ,"701-800","801-900","901-1000","1001+"))

availability_365_Categorised<-cut(berlin$availability_365, breaks = c(0,10,20,30,40,50,60,70,80,90,100,150,200,250,300,365,Inf),
                                        labels = c("to 10","11-20","21-30","31-40","41-50","51-60","61-70","71-80","81-90","91-100"
                                                   ,"101-150","151-200","201-250","251-300","301-365","365+"))

review_scores_rating_Categorised<-cut(berlin$review_scores_rating, breaks = c(0,10,20,30,40,50,60,70,80,90,100,Inf),
                                  labels = c("to 10","11-20","21-30","31-40","41-50","51-60","61-70","71-80","81-90","91-100"
                                             ,"100+"))

summary(availabilityPercentage)

summary(berlin$accommodates)
summary(berlin$beds)
