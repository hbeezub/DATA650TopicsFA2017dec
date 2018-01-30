

#extracting data-------------------------
#continue bar graph from Monday
#df variable stands for data frame
df<-Teams%>%
  filter(yearID==1980)%>%
  select(name,HR)%>%
  arrange(HR)

#arrange from lowest too highest 

df$name<-factor(df$name,levels=df$name)

# shows just the column "name"
#str adds structure   str(df$name)  class (df$name)
#factor 
#factor added to name into variable makes df a factor (26 items)
#we need the levels to be the same as the columns
##-visualize data------
#stat-identity tells ggplot not to do any calculations

g<-ggplot()+
  geom_bar_interactive(data=df,aes(x=name,y=HR,tooltip=HR,data_id=name),stat="identity",color="blue",fill="white")+
  coord_flip()+
  ggtitle("1980 Team Home Run Distribution")+
  ylab("HomeRuns")+
  xlab("Team Names")
  
ggiraph(code=print(g),hover_css="fill:red;stroke:black")


#;stroke:black"

#add titla & a label for the X axis (which is flipped)

##to get hover need to add tooltip to aes tooltip=HR
#color for hover  hover_css='fill:red'