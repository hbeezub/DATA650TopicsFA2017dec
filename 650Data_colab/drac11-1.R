# 11-1-17
#Map pos & neg sentiments
sentiments
#lets look at tail
tail(sentiments)
#other pkgs
get_sentiments('nrc')
#words in nrc lexicon with the sentiment associated with that word
get_sentiments('bing')
#pos or negative
get_sentiments('afin')
#gives a score

nrc<-get_sentiments('nrc')

#only want the fear words
nrc_fear<-nrc%>%
  filter(sentiment == 'fear')

drac<-gutenberg_download(345)

head(drac)

#always ahave the word first-makes a column of words & then the Text is the name of the column they are from
drac_words<-drac%>%
  unnest_tokens(word,text)

drac_fear_words<-inner_join(nrc_fear,drac_words)

head(drac_fear_words)

drac_fear_freq<-drac_fear_words%>%
  group_by(word)%>%
  summarise(count=n())

wordcloud(drac_fear_freq$word,drac_fear_freq$count,min.freq=100)
wordcloud(drac_fear_freq$word,drac_fear_freq$count,min.freq=25)
wordcloud(drac_fear_freq$word,drac_fear_freq$count)
wordcloud(drac_fear_freq$word,drac_fear_freq$count,min.freq=5)

unique(nrc$sentiment)


#do a slide presentarion usiing latex
#on fri we will keep tracck of when drac is + and -
