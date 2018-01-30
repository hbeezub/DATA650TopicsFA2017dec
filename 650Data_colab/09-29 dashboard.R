#09-29-2017
#install & library packages
#install & library flexdashboard (new)  so we can put 
#visualizations together in one dashboard

#scatter plot extract data
result<-Batting%>%
          filter(playerID=='ruthba01')%>%
          select(yearID,SO,HR)

#make variable name result

#scatter plot graph

ggplot()+
  geom_point(data=result,aes(x=SO,y=HR))+
  xlab('strikeouts')+
  ylab('Homeruns')

#histogram
#need to add bins
#
ggplot()+
  geom_histogram(data=result,aes(x=HR),bins=5,color="blue",fill="white")

#time series
#add year ID to date aextrat year id
#re-reun data after year add
ggplot()+
  geom_point(data=result,aes(x=yearID,y=HR))+
  geom_line(data=result,aes(x=yearID,y=HR))+
  xlab('year')+
  ylab('homeruns')

#make a folder namesd dashboad
#set directory to dashboard folder
#open up an r markdown file

