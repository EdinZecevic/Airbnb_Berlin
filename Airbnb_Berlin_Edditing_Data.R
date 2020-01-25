berlin <- read.csv("Airbnb_Berlin.csv")

#host_response_rate EDDITING
#Response rate all NA to 0 becouse 0 is more than one day and for us
#is meaningfull ins response in one day or more than one day but not
#in how many days
berlin$host_response_rate<-as.character(berlin$host_response_rate)# Converting factors to character
berlin$host_response_rate[berlin$host_response_rate=="N/A"] <- "0" # Replace N/A with 0
berlin$host_response_rate<-as.numeric(berlin$host_response_rate)
factor(berlin$host_response_rate) #Factorising again 


#bathrooms EDDITING
#If bathroom ins null or N/A it mean that it is not setted, impssible to have accomodation
#without bathroom, it is possible but unuseless and we do not need it and wee will set to 1
berlin$bathrooms<-as.character(berlin$bathrooms)# Converting numeric to character
berlin$bathrooms[is.na(berlin$bathrooms)] <- "NA" # Replace NULL with NA
berlin$bathrooms[berlin$bathrooms=="NA"] <- "1" # Replace NA with 1
berlin$bathrooms<-as.numeric(berlin$bathrooms) #Converting bathrooms from character to numeric

#bedrooms EDDITING
#Same edditing like in bathrooms but here if there is null or NA can be allso input error
#the bedroom can be allso living space where are all other facilities like one apartment
#with only one room and bathroom and kitchen
berlin$bedrooms<-as.character(berlin$bedrooms)# Converting numeric to character
berlin$bedrooms[is.na(berlin$bedrooms)] <- "NA" # Replace NULL with NA
berlin$bedrooms[berlin$bedrooms=="NA"] <- "1" # Replace NA with 1
berlin$bedrooms<-as.numeric(berlin$bedrooms) #Converting bedrooms from character to numeric

berlin$host_listings_count<-as.character(berlin$host_listings_count)# Converting numeric to character
berlin$host_listings_count[is.na(berlin$host_listings_count)] <- "NA" # Replace NULL with NA
berlin$host_listings_count[berlin$host_listings_count=="NA"] <- "1" # Replace NA with 1
berlin$host_listings_count<-as.numeric(berlin$host_listings_count) #Converting host_listings_count from character to numeric

berlin <- berlin[berlin$beds!=0,]#Deleted all accomodations that have 0 beds
berlin <- berlin[!is.na(berlin$beds),]#Deleted all accomodations that have NULL beds
berlin <- berlin[berlin$price!=0,]#Deleted all accomodations that have price 0
berlin <- berlin[!is.na(berlin$price),]#Deleted all accomodations that have NULL price

#deposit EDDITING
#if deposit is empty or NA it can be setted to 0, becouse if it is not mentioned
#on listing you do not have to pay it
berlin$deposit<-as.character(berlin$deposit)# Converting numeric to character
berlin$deposit[is.na(berlin$deposit)] <- "NA" # Replace NULL with NA
berlin$deposit[berlin$deposit=="NA"] <- "0" # Replace NA with 0
berlin$deposit<-as.numeric(berlin$deposit) #Converting deposit from character to numeric

#cleaning EDDITING
#if cleaning is empty or NA it can be setted to 0, becouse if it is not mentioned
#on listing you do not have to pay it
berlin$cleaning<-as.character(berlin$cleaning_fee)# Converting numeric to character
berlin$cleaning[is.na(berlin$cleaning)] <- "NA" # Replace NULL with NA
berlin$cleaning[berlin$cleaning=="NA"] <- "0" # Replace NA with 1
berlin$cleaning<-as.numeric(berlin$cleaning) #Converting cleaning from character to numeric

berlin <- berlin[berlin$minimum_nights!=0,]#Deleted all accomodations that have minimum stay nights 0
berlin <- berlin[!is.na(berlin$minimum_nights),]#Deleted all accomodations that have NULL minimum stay nights

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

host_response_rate_Categorised<-cut(berlin$host_response_rate, breaks = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,Inf),
                                    labels = c("0.0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"))
