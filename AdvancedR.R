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


