


## 변동계수 (coefficient of variation)
## cv = 표준편차 / 산술평균
mtcars
cv1 = sd(mtcars$mpg/mean(mtcars$mpg))
cv1


## 함수를 이용한 변동계수 구하기
## 
# 함수명 <- function(x) {}
#   sd(x) / mean(x)
# }
# 함수호출시
# 함수명(x)


cv <- function(x) sd(x)/mean(x)

lapply(mtcars, cv)
names(mtcars)
cv(mtcars$cyl)
cv(mtcars$am)
cv(mtcars$gear)
cv(mtcars$carb)


# lapply(데이터셋, 함수)
lapply(mtcars, cv)
sapply(mtcars, cv)


a=lapply(mtcars, cv)
b=sapply(mtcars, cv)
class(a); class(b)


### 함수적용(변동계수 구하기)
cv <- function(x) { sd(x)/mean(x) }
lapply(mtcars, cv)

# 위의 것을 한줄로 만들기 
lapply(mtcars, function(x) sd(x)/mean(x))

### 패키지 설치 확인
installed.packages() [ ,c("Package", "Version") ]

a = installed.packages() [ ,c("Package", "Version") ]
grep("foreign", a, value=T)


### 여러 리스트 형태되어 있는 것을 하나의 벡터로 만들겠다.
lst = list("Moe", NULL, "Curly", mtcars)
lst


unlist(lst)
length(unlist)

library(stringr)
str_count("Moe")
nchar("Moe")       # 위와같음. 방법은 여러가지.


### 
library(MASS)
Cars93


### 
View(Cars93)
?Cars93
# City MPG (miles per US gallon by EPA rating).
# Of non-USA or USA company origins? (factor).
table(Cars93$MPG.city)
table(Cars93$Origin)

# split 함수
# split (나눌데이터변수 or 필드, 나눌 구분(필드) )
split(iris$Sepal.Length, iris$Species)
split(iris$Sepal.Length, Cars93$Origin)


# sapply, lapply
# 각각의 리스트 요소에 함수를 적용시키기
# lapply : 리스트로 반환
# sapply : 벡터로 변환

## strings 함수들
# nchar() : 글자수
# 벡터의 길이(요소)를 반환 : length()
# 문자열 결합 : paste(), paste0()
# 문자열 일부를 가져오기 : 
ss <- c("Moe", "Larry", "Curly")
ss[c(1,3)]
substr(ss, 2,3)

ss <- "I am boy"
substr(ss, 6,8)


## 기준(구분)이 되는 것에 따라 문자를 나눈다.
#  strsplit(문자열, "/")
#  맨 마지막 위치에 있는 파일명만 가져오고 싶다.
path <- "/home/mike/data/trials.csv"
strsplit(path, "/")

strsplit(path, "/")[[1]]
b = strsplit(path, "/")[[1]]
filelen = length(b)
filelen

b[filelen]


###
mtcars
names(mtcars)
mt <- mtcars[ , -c(2,3,4)]
names(mt)



### 문자열의 일부 문자열을 바꾸기
# _____ (old, new, 문자열)

# gsub("영화를", "영화", 문자열)
# gsub("영화를", "영화", 문자열
# gsub("역사", "", 문자열)


### 오늘의 날짜를 알아보기
Sys.Date()


## 문자열을 날짜로 변경하기 as.Date("2010-12-31")
dat = as.Date("2010-12-31")
class(dat)

dat1 = as.Date("12/31/2017", format="%m/%d/%Y")
dat2 = as.Date("2017/12/10", format="%Y/%m/%d")
dat; dat1; dat2


##
Sys.Date()
d = as.character(Sys.Date())
d
substr(d,1,4)    # 연도
substr(d,6,7)    # 월
substr(d,9,10)   # day

dat = as.Date("2010-12-31")
p = as.POSIXlt(dat)
str(p)
names(p)
p$mday           # days(1~31)
p$mon   + 1      # month(0-11)
p$year  + 1900   # 연도
p$hour           # 시간 (0-23)
p$wday           # 월~일 0=Sunday, 1=Monday
p$yday           # 0~365
p$min            # 분
p$sec            # 초



