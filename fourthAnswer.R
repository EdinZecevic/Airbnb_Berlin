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