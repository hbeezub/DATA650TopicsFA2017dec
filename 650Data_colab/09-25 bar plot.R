

#

df<-Teams%>%
  filter(yearID==1980)%>%
  select(name,HR)%>%
  arrange(HR)
df

df$name<-factor(df$name,levels=df$name)
#this didn't work df$name<-factor(df$name)


ggplot()+
  geom_bar(data=df,aes(x=name,y=HR),stat="identity",color="blue",fill="white")+
  coord_flip()