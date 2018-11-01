
library(KoNLP)
useSejongDic()
require(plyr)
require(stringr)

### 
library(tm)
docs <- c(D1="The sky is blue.", 
          D2="The sun is bright.",
          D3="The sun in the sky is bright.")

dd <- Corpus(VectorSource(docs))
dd <- tm_map(dd, removePunctuation)
dd <- tm_map(dd, removeWords, stopwords("english"))

strwrap(dd)
inspect(dd)
?strwrap


### 03. 단어 문서 행렬, 문서 단어 행렬

dtm = DocumentTermMatrix(dd, control=list(weighting=weightTfIdf ))
as.matrix(dtm)


###
# doc1 <- "파스타 먹방, 강남 파스타 데이트"
# doc2 <- "강남 버스 파스타 맛집"
# doc3 <- "강남 버스, 강남 파스타, 강남 맛집"

docs1 <- c(doc1 <- "파스타 먹방, 강남 파스타 데이트",
           doc2 <- "강남 버스 파스타 맛집",
           doc3 <- "강남 버스, 강남 파스타, 강남 맛집",
           doc4 <- "데이트 맛집",
           doc5 <- "강남 맛집")


dd1 <- Corpus(VectorSource(docs1))
dd1 <- tm_map(dd1, removePunctuation)


strwrap(dd1)
inspect(dd1)


dtm1 = DocumentTermMatrix(dd1, control=list(weighting=weightTfIdf ))
as.matrix(dtm1)


# 키워드 추출
# 문서 1 : 강남
# 문서 2 : 강남, 맛집
# 문서 3 : 버스
# 문서 4 : 데이트
# 문서 4 : 강남, 맛집



setwd("C:/Users/ktm/Desktop/빅데이터/mac")
getwd()
docs2 <- c("apple.txt",
           "macmini.txt",
           "macmini2.txt")


dd2 <- Corpus(VectorSource(docs2))
dd2 <- tm_map(dd2, removePunctuation)


strwrap(dd2)
inspect(dd2)


dtm2 = DocumentTermMatrix(dd2, control=list(weighting=weightTfIdf ))
as.matrix(dtm2)
