
ggplot(data = berlin, aes(x=host_response_rate_Categorised, y=berlin$review_scores_rating)) +
  geom_point(aes(color = berlin$cancellation_policy), size=2)+
  labs(title = "Host response and Review scores rating relation", subtitle = "Cancelation policy coloured",
       x="Host response", y= "Review scores rating", colour = "Cancelation policy")+
  geom_smooth(method = "lm")

ggplot(data = berlin, aes(x=host_response_rate_Categorised, y=berlin$review_scores_rating)) +
  geom_abline()+
  labs(title = "Host response and Review scores rating relation",
       x="Host response", y= "Review scores rating")