#do for dracula from beginning with a fin (already has the scores)
get_sentiments('afinn')

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

dracula_words$group<-dracula_words$line %/% 80

dracula_words$group

dracula_words

#just a list of the afinn sentiments
afinn<-get_sentiments('afinn')

afinn

dracula_words<-inner_join(dracula_words,afinn)

> inner_join(dracula_words,afinn)
Joining, by = "word"
# A tibble: 9,548 x 4
line      word group score
<int>     <chr> <dbl> <int>
  1    21    united     0     1
2    26    united     0     1
3    35      dear     0     2
4    72   cutting     0    -1
5   171 wonderful     2     4
6   176  splendid     2     3
7   177     noble     2     2
8   180    pretty     2     1
9   180      good     2     3
10   181   stopped     2    -1
# ... with 9,538 more rows


#because words already scored...
dracula_sent_finn<-dracula_words%>%
  group_by(group)%>%
  summarize(group_sentiment=sum(score))

dracula_sent_finn

ggplot()+
  geom_col(data=dracula_sent_finn, aes(x=group, y=group_sentiment),fill='sienna',color='black')

