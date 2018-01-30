df<-Teams%>%
  filter(yearID==1980)%>%
  select(name,HR)%>%
  arrange(HR)

df$name<-factor(df$name,levels=df$name)

#visualizing the data

g<-ggplot()+
  geom_bar_interactive(data=df,aes(x=name,y=HR, tooltip=HR, data_id=name),stat="identity",color="blue",fill="white")+
  coord_flip()+
  ggtitle("1980 Team Homeruns")+
  ylab("Homeruns")+
  xlab("Team")

ggiraph(code=print(g),hover_css="fill:red;stroke:black")
