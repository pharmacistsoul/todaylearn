

library(tm)

# 01. data 불러오기
setwd("E:/bigdata/Github/todaylearn/data")
dat <- readLines("comment.txt")
print(dat)

# 02. 말뭉치 생성
# tm 패키지에서 기본자료형으로 말뭉치 사용
tSource <- VectorSource(dat)
tSource
myCor <- Corpus(tSource)
myCor

# 이부분 고민 아래에잇던거 가져온것 잘 작동이안되서<이걸 제대로 작동시키는 공부를 하기>
# removeWord = c("본","ㅡ", "에", "아 ", "왜나와", " 와", "이", "이어", "  다", "거", "ㅎㅎㅎ ", "부른", "넘들 ", " 못피함", "쓰기가")
# myCorpus <- tm_map(myCorpus, removeWords, removeWord)

# 03. 전처리가 후, 문서 내용 확인
# tm_map( tolower )
myCorpus <- tm_map(myCorpus, removeNumbers)                     # 숫자 제거
myCorpus <- tm_map(myCorpus, removePunctuation)                 # 특수 문자 제거
#myCorpus <- tm_map(myCorpus, stripWhitespace)                   # 공백 제거 



# 04. 전처리가 후, 문서 내용 확인
inspect(myCor)
myCor[[3]]$content


# 05. 불용어 처리 수행
## stopwords : C:/Users/ktm/Documents/R/win-library/3.5/tm/stopwords
## 나의 라이브러리 위치 확인
.libPaths()


## 
# myCor <- tm_map(myCor, removeWords, stopwords("english"))
# myCorpus <- tm_map(myCorpus, removeWords, stopwords(""))

# 06. 단어 문서 행렬(Term Document Matrix, TDM)
# 단어의 빈도를 확인하기 위해서
# 단어와 단어간의 연관성을 확인하기 위해서
# TF(용어의 빈도수)
# TFIDF 
# 한글은 한글자를 두글자로 봄.
tdm <- TermDocumentMatrix(myCor, control=list(tokenize="scan", wordLengths=c(2,8)))
inspect(tdm)

tdm_M <- as.matrix(tdm)
tdm_M

## 단어 빈도수 구하기
frequency <- rowSums(tdm_M)
frequency

## 07. 정렬
frequency <- sort(frequency, decreasing = T)
frequency    # 단어별 빈도
barplot(frequency[1:20], las=2)   # 막대그래프 그리고


colors()
RColorBrewer::brewer.pal.info
## 워드 클라우드
library(wordcloud)
wordName <- names(frequency)   # 단어별- 이름
pal <- brewer.pal(8, "Dark2") # 색 지정
wordcloud(words=wordName,       # 이름
          freq=frequency, # 빈도수
          min.freq=1,     # 표시할 최소 횟수
          random.order=F, # 가장 횟수가 많은 단어를 중심으로
          random.color=T, # 여러가지 색을 랜덤하게 지정한다.
          colors=pal)     # 색지정




