lines<-scan('lyrics.txt',what=character(),sep='\n')

#data_frame(line=1:292,text=lines)
lines_df<-data_frame(line=1:292,text=lines)

words_df<-lines_df%>%
  unnest_tokens(word,text)


words_df<-words_df%>%
  filter(!(word %in% stop_words$word))


word_freq<-words_df%>%
  group_by(word)%>%
  summarize(count=n())
  
wordcloud(word_freq$word,word_freq$count,colors=brewer.pal(7,'Dark2'))