gutenberg_download(345)

dracula<-gutenberg_download(345)

dim(dracula)

#> dim(dracula)
#[1] 15568     2

dracula$line<-1:15568

dracula$gutenberg_id<-NULL

dracula

dracula_words<-dracula%>%
  unnest_tokens(word,text)

dracula_words

#when tracking sentiment it is best tot track 80 lines
#add acolumn to tell us which group of 80

65 %/% 80
#80 goes into 65 0 times
> 65 %/% 80
[1] 0

73 %/% 80
> 73 %/% 80
[1] 0

85 %/% 80
> 85 %/% 80
[1] 1

170%/% 80
> 170%/% 80
[1] 2

#to determine group #

dracula_words$group<-dracula_words$line %/% 80

dracula_words$group

dracula_words
# now 3 columns line #, wird & group #

#add 4th column for sentiment

#just a list of the bing sentiments
bing<-get_sentiments('bing')

bing

#use innerjoin to join the dracula & bing together

dracula_words<-inner_join(dracula_words,bing)

#no longer have all words only those that can be rated

#add 5th column to add a negative 1 for neg & +1 for positive

dracula_words$score<-1    #gives positive to all
dracula_words
rowneg<-which(dracula_words$sentiment == 'negative')   # which will find the rows where true
#dracula_words$score[rowneg]  #only entries in score colum that are negative

dracula_words

dracula_words$score[rowneg]<--1   #store in a negative 1

dracula_words

dracula_sent<-dracula_words%>%
  group_by(group)%>%
  summarize(group_sentiment=sum(score))

dracula_sent
#group 1 is missing

print(dracula_sent,1000)
#rare that is skips over 1  

ggplot()+
  geom_point(data=dracula_sent, aes(x=group, y=group_sentiment),stat='identity')

# make bars (columns)
ggplot()+
  geom_col(data=dracula_sent, aes(x=group, y=group_sentiment),fill='sienna',color='black')
#http://htmlcolorcodes.com/  move in space & get a color number

ggplot()+
  geom_col(data=dracula_sent, aes(x=group, y=group_sentiment),fill='sienna',color='black')
