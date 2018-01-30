dracula<-gutenberg_download(345)
#get the WorldPhones

dracula_words<-dracula%>%
  unnest_tokens(word,text)

#bing for sentiments

bing<-get_sentiments('bing')

#don't need line numbers for this proj

dracula_words<-inner_join(dracula_words,bing)

#get rid of id column

dracula_words$gutenberg_id<-NULL

dracula_pos<-dracula_words%>%
  filter(sentiment=='positive')

head(dracula)

dracula_pos<-dracula_words%>%
  filter(sentiment=='positive')%>%
  group_by(word)%>%
  summarize(count=n())
  

dracula_pos<-dracula_words%>%
  filter(sentiment=='positive')%>%
  group_by(word)%>%
  summarize(count=n())%>%
  arrange(count)

dracula_pos<-dracula_words%>%
  filter(sentiment=='positive')%>%
  group_by(word)%>%
  summarize(count=n())%>%
  arrange(count)%>%
  filter(count>=66)

factor(dracula_pos$word, levels=dracula_pos$word)
dracula_pos$word<-factor(dracula_pos$word, levels=dracula_pos$word)


ggplot()+
  geom_bar(data=dracula_pos, aes(x=word, y=count),stat='identity' )+
  coord_flip()


dracula_neg<-dracula_words%>%
  filter(sentiment=='negative')%>%
  group_by(word)%>%
  summarize(count=n())%>%
  arrange(count)%>%
  filter(count>=53)


ggplot()+
  geom_bar(data=dracula_neg, aes(x=word, y=count),stat='identity' )+
  coord_flip()


tail(dracula_neg,20)
#change 66 to 53
#Have to fun the code before adding filter count


#add to take out word miss

filter(word!='miss')

tail(dracula_neg)

#change # to 49


#========

#put 2 dataframes on top of oneaother
#row bind together pot positive ontop of neg & bind together
dracula_comp<-rbind(dracula_pos, dracula-neg)

ggplot()+
  geom_bar(data=dracula_comp, aes(x=word, y=count),stat='identity' )+
  coord_flip()+
  facet_wrap()



