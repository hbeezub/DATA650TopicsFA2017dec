#time series 
#extract data 

df<-Batting%>%
  filter(playerID=='ruthba01')%>%
  select(yearID,HR)


g<-ggplot()+
  geom_line(data=df, aes(x=yearID, y=HR))+
  geom_point_interactive(data=df,aes(x=yearID,y=HR,tooltip=HR,data_id=yearID))+
  ggtitle("Babe Ruth HomeRuns")
                       
ggiraph(code=print(g),hover_css = "fill:white;stroke:red")

        
        
        #(code=print(g),hover_css="fill:white;stroke:red")