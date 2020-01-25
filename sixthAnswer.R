ggplot(data = berlin, aes(x=berlin$minimum_nights, y=berlin$availability_365)) +
  labs(title = "Minimum nights stay and availability relation",
       x="Minimum nights", y= "Availability")+
  geom_smooth(method = "lm")
