#第一章 数据结构

cList<-list(c("jeff","bob","manson"),list(c(1,2,3),c(T,F,F)),c(1.23,45.4,67.2),matrix(1:10,2))
cList
un_cList<-unlist(cList)
un_cList


class(cList)
typeof(cList)
str(cList)


#R中的原子类型向量
#逻辑型，整数型，双精度型，字符型，复数型，raw型



#NA
NA
NA_character_
NA_complex_
NA_integer_
NA_real_
NaN


x<-setNames(1:3,c("a","b","c"))
x

y<-structure(1:5,comment="my attribute")
attributes(y)



f1<-factor(letters)
levels(f1)<-rev(levels(f1))

f2<-rev(factor(letters))
f3<-factor(letters,levels=rev(letters))


dimnames(cList)

names<-c("jeff","bob","lucy")
dim(names)


tMatrix=matrix(1:12,ncol=2,nrow=6,2)
is.matrix(tMatrix)
is.array(tMatrix)


x1<-array(1:5,c(1,1,5))
x2<-array(1:5,c(1,5,1))
x3<-array(1:5,c(5,1,1))
x1
x2
x3


df<-data.frame(x=1:3,y=c("a","b","c"),stringsAsFactors = F)
str(df)

tMatrix=matrix(1:12,ncol=2,nrow=6,2)
tFrame<-data.frame(tMatrix)
tFrame




tFrame<-data.frame(x=1:3, y=list(1:2,1:3,1:4)) #error
tFrame<-data.frame(x=1:3, y=I(list(1:2,1:3,1:4)))  #list的长度要和x列的长度一致
tFrame<-data.frame(x=1:3,y=matrix(1:9,ncol=3)) #matrix的长度要和x列的长度一致
as.matrix(tFrame)



#第二章 取子集

index<-1:100
sIndex<-sample(index,replace = F)
sIndex


#取矩阵子集？
vals<-outer(1:5,1:5,FUN="paste",sep=",")
mSelect<-matrix(c(1,1,3,1,2,4),ncol=2,byrow=T)
vals[mSelect]
#vals
#[,1]  [,2]  [,3]  [,4]  [,5] 
#[1,] "1,1" "1,2" "1,3" "1,4" "1,5"
#[2,] "2,1" "2,2" "2,3" "2,4" "2,5"
#[3,] "3,1" "3,2" "3,3" "3,4" "3,5"
#[4,] "4,1" "4,2" "4,3" "4,4" "4,5"
#[5,] "5,1" "5,2" "5,3" "5,4" "5,5"

#mSelect
#      [,1] [,2]
#[1,]    1    1
#[2,]    3    1
#[3,]    2    4

#result
#[1] "1,1" "3,1" "2,4"



#简化和保留  - 数据对象被取子集后，返回的子集是否保留父集合的格式

#Vector
dVector<-c(name=letters[1:20])
dVector[1]
str(dVector[1])
dVector[[1]]
str(dVector[[1]])


#List
dList<-list(a=1,b=2)
str(dList)
str(dList[1])  #list
str(dList[[1]])  #numeric

#Factor
dFactor<-factor(c("Small","Medium","Large"))
str(dFactor[1]) #Perserving
str(dFactor[1,drop=T])  #Simplify, 只保留small的因子


#Matrix
dMatrix<-matrix(1:10,nrow=5,ncol=2,2)
dMatrix
str(dMatrix[1,])  #数组
str(dMatrix[1,,drop=F])  #矩阵


#Frame
dFrame<-data.frame(a=1:2,b=1:2)
str(dFrame[1])  #还是数据框
str(dFrame[[1]])  #数组
str(dFrame[,"a"]) #数组
str(dFrame[,"a",drop=FALSE])  #还是数据框




# $   x$y  等价于 x[["y", exact=FALSE]]
mtcars$cyl
tName<-"cyl"
mtcars$tName  #这个是硬编码，不能被正常识别
mtcars[[tName,exact=F]]




x<-c("m","f","u","f","f","m","m")  #向量元素名称
lookup<-c(m="Male",f="Female",u=NA)  #向量元素名称
lookup[x] #类似列名筛选
#m        f        u        f        f        m        m 
#"Male" "Female"       NA "Female" "Female"   "Male"   "Male" 


#match   将info$grade == grades的所有行提取出来，并按grade的出现顺序进行呈递
grades<-c(1,2,2,3,1)
info<-data.frame(grade=3:1,desc=c("Excellent","Good","Poor"),fail=c(F,F,T))
grades
ind<-match(grades,info$grade)
info[ind,]


#打乱数组
cFrame<-data.frame(1:26,letters[1:26])
rownames(cFrame[sample(rownames(cFrame),replace = F),])<-1:26
cFrame





#setdiff
df<-data.frame(x=1:3,y=3:1,z=letters[1:3])
df[setdiff(names(df),"z")]

#subset
subset(df,df$x==1)


#
x1<-1:10%%2==0
x1  #FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE

x2<-which(x1)
x2  # 2  4  6  8 10

y1<-1:10%%5==0
y1   #FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE

y2<-which(y1)
y2   #5 10

x1&y1  #intersect   FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE

intersect(x2,y2)

x2&y2 #ERROR

x1|y1

union(x2,y2)

x1&!y1 #setdiff(x1,y1)

setdiff(x2,y2)

xor(x1,y1)

setdiff(union(x2,y2),intersect(x2,y2))  #xor

x3<-1:10
y3<-10:1

xor(x3,y3)  # 不能成立，元素类型不能很好的转化为逻辑类型



# 第六章 函数
library("base")
objs<-mget(ls("package:base"),inherits = TRUE)
func<-Filter(is.function,objs)
func
