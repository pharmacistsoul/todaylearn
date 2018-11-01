

## 01. 데이터 준비
## 02. 긍정단어, 부정단어
## 03. 불러온 텍스트 전처리
## 04. 감정분석을 위한 점수


## 01. 데이터 준비 및 사전 준비
## 세종 Dic, KoNLP, 파일 30_AgainCourt.txt
rm(list=ls())
library(KoNLP)
useSejongDic()

fname = "C:/Users/ktm/Desktop/빅데이터/긍정부정/30_AgainCourt.txt"
road1 = readLines(fname)

setwd("C:/Users/ktm/Desktop/빅데이터/긍정부정")

## 02. 긍정단어, 부정단어 불러오기
pos.words = scan("positive-words-ko-v2.txt", what="character", comment.char=";")
neg.words = scan("negative-words-ko-v2.txt", what="character", comment.char=";")

pos.words
neg.words


## 03. 의미없는 데이터 제거(특수문자, 제어문자(\n,\r), 숫자 제거)- gsub
require(plyr)
require(stringr)


### require -> library
a1 = library(plyr)  # library한 패키지 파일이 들어있고.
a2 = require(plyr)  # 이건 True,false 잘작동되었다 안되었다가 나온다.
a1; a2

sentences <- road1

### 
sentences <- gsub('\\d+','',sentences ) # 숫자를 공백으로 변경해라.
sentences <- gsub('[[:cntrl:]]','',sentences ) # \n, \r 같은 제어문자 제거

# 구두점 문자, ! " # $ % ' ( ) * +, - . / : ; < = > ? @ [ ] ^ _ ` { | } ~. 제거
sentences <- gsub('[[:punct:]]','',sentences )

length(sentences)    # 요소의 길이
head(sentences)


?sapply
## 명사추출
wordlist <- sapply(sentences, extractNoun, USE.NAMES=F)
class(wordlist)
words <- unlist(wordlist)
head(words)
length(words)


## 04. 감성 분석
ex <- list(a="진짜", b="변호사", c="그렇다") # words(단어리스트)
ex
dic = c("진짜", "변호사") # 단어사전
match(words, c("진짜", "변호사")) # 단어사전에서 검색된 위치가 반환
match(words, pos.words)   # words에 긍정단어 사전에 위치 (있다면) NA 


## 각각의 문장에 대한 긍정단어의 위치, 부정단어의 위치
pos.matches <- match(words, pos.words)   # 긍정 단어 검색
neg.matches <- match(words, neg.words)   # 부정 단어 검색



pos.matches <- !is.na(pos.matches)   # 검색된 긍정단어 숫자, 7000개 단어들을 NA인지 아닌지
neg.matches <- !is.na(neg.matches)   # 검색된 부정단어     , 7000개 단어들을 NA인지 아닌지
sum(pos.matches)     ## TRUE(긍정단어), FALSE
sum(neg.matches)     ## TRUE(부정단어), FALSE

score <- sum(pos.matches) - sum(neg.matches)
score





