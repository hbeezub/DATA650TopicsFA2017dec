#how to make a histogram
#colnames()players weights-see what distribution looks like
#df=data frame

df<-Master%>%
  filter(!is.na(weight))%>%
  select(weight)

ggplot()+
  geom_histogram(data=df,aes(x=weight),color="White",fill="blue",bins=25)+
  ggtitle("Baseball Player Weights") 

#---------------




#color is the border