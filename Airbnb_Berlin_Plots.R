install.packages("ggplot2")
# load ggplot2
library(ggplot2)

plot(factor(berlin$review_scores_rating), factor(berlin$host_listings_count),
     pch = 19, col =  1:5, cex = 0.1)

ggplot(data = berlin,aes(x=factor(review_scores_rating), y=factor(host_listings_count)))+
  geom_point(aes(color =factor(host_listings_count), size =1), alpha=0.7)+
  title("Corelation between review based score and number of listing for each host")+
  xlab("review_scores_rating")+
  ylab("host_listings_count")

ggplot(data = berlin,aes(x=factor(price), y=factor(host_listings_count)))+
  geom_point(aes(color =factor(host_listings_count), size =1), alpha=0.7)+
  xlab("price")+
  ylab("host_listings_count")

scatter.smooth(x=berlin$availability_365, y=berlin$minimum_nights, 
               main="Linear Realtion")  # scatterplot

cor(berlin$availability_365, berlin$minimum_nights)#corelation


ggplot(data = berlin, aes(x=berlin$availability_365, y=berlin$minimum_nights)) +
  geom_point(aes(color = "red")) +
  geom_smooth(method = "lm")#Linear regresion x = berlin$availability_365, y = berlin$minimum_nights

ggplot(data = berlin, aes(x=berlin$availabilityPercentage, y=berlin$minimum_nights)) +
  geom_point(aes(color = "red")) +
  geom_smooth(method = "lm")#Linear regresion x = availabilityPercentage(using function), y = berlin$minimum_nights



ggplot(data = berlin, aes(x=listing_Count_Categorised, y=price_Categorised)) +
  geom_point(aes(color = berlin$cancellation_policy), size=2)+
  labs(title = "Listing count and price relation", subtitle = "Cancelation policy coloured",
       x="Listing count", y= "Price", colour = "Cancelation policy")+
  geom_smooth(method = "lm") 


#Aswer on question: Does number of listings increase price, review score and availability of each listing?
ggplot(data = berlin, aes(x=listing_Count_Categorised, y=price_Categorised)) +
  geom_abline()+
  labs(title = "Listing count and price relation",
       x="Listing count", y= "Price")+
  geom_smooth(method = "lm")

ggplot(data = berlin, aes(x=listing_Count_Categorised, y=availability_365_Categorised)) +
  geom_abline()+
  labs(title = "Listing count and Availability relation",
       x="Listing count", y= "Availability")+
  geom_smooth(method = "lm")

ggplot(data = berlin, aes(x=listing_Count_Categorised, y=review_scores_rating_Categorised)) +
  geom_abline()+
  labs(title = "Listing count and Review scores rating relation",
       x="Listing count", y= "Review scores rating")+
  geom_smooth(method = "lm")
                            

