df<-Batting%>%
  group_by(playerID)%>%
  summarize(career_HR=sum(HR),career_SO=sum(SO))%>%
  filter(career_HR >= 400)

HR_vs_SO<-inner_join(df,Master,by=c("playerID"))%>%
  select(nameFirst,nameLast,career_HR,career_SO)

HR_vs_SO$name<-paste(HR_vs_SO$nameFirst,HR_vs_SO$nameLast)

g<-ggplot()+
  geom_point_interactive(data=HR_vs_SO,aes(x=career_SO,y=career_HR,tooltip=nameLast,data_id=nameLast))+
  ggtitle("Career Home Runs vs Strike Outs for Great Hitlers.")+
  xlab("Career Strikeouts")+
  ylab("Career Homeruns")

ggiraph(code=print(g),hover_css="Fill:white;stroke:blue")

#-------------------------------------------------

### colnames(Master) gives you the names of the columns
#----------------------------

