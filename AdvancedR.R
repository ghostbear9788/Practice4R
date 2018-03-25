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


#延迟计算
f1<-function(x)
{
  
  10
}
f1(stop("This is an ERROR!"))

f2<-function(x)
{
  force(x)
  10
}
f2(stop("This is an ERROR!"))


f3<-function(x=ls())
{
  a<--1
  x
  
}
f3()
f3(ls())


#  问题没有重现
add<-function(x)
{
  function(y)x+y
}

address<-lapply(1:10,add)
address[[1]](10)

add2<-function(x){
  force(x)   #强制计算，强制让该变量记录当前的环境，不让其随环境的改变而改变
  function(y)x+y
  
}

address2<-lapply(1:10,add2)
address2[[1]](10)
address2[[10]](10)

f1<-function(x={y<-1;2},y=0)
{
  x
  y
  x+y
}
f1()

#中缀函数
a<-"Jeff"
b<-"Xiong"
a+b
'+'<-function(x,y)paste(x,y,"")
a+b


#替换函数
install.packages("pryr")
library("pryr")

x<-1:10
pryr::address(x)
x[2]<-100L  #需要加L，才能在当前地址进行修改
pryr::address(x)



#变量地址改变了
x<-1:10
pryr::address(x)
'modify<-'<-function(x,position,value)
{
  x[position]<-value
  x
  
}
modify(x,1)<-99
pryr::address(x)
x

modify(get("x"),2)<-22
x




#第七章 面向对象
requre("pryr"){
  install.packages("pryr")
  require("pryr")
}

###########基本类型###############
f<-function(){}
typeof(f)

is.function(f)

typeof(sum)

is.primitive(sum)



###########S3#############
names<-c("jeff","lucy","lily","ben","andy")
is.object(names) & !isS4(names)  #测试对象是不是s3
pryr::otype(names)

df<-data.frame(x=1:10,y=letters[1:10])
pryr::otype(df)#?
pryr::otype(df$x)
pryr::otype(df$y)

ftype(mean)


methods("mean")
methods(class="ts")

#创建s3对象
foo<-structure(list(),class="foo")
foo<-list()
class(foo)<-"foo"
otype(foo)
inherits(foo,"foo") #是否继承

otype(glm)

#构造函数
foo<-function(x)
{
  if(!is.numeric(x))stop("X must be numeric")
  structure(list(x),class="foo")
  
}
foo(10)
otype(foo)


#类型转换 - 不推荐这么做
mod<-lm(log(mpg)~log(disp),data=mtcars)
class(mod)
print(mod)
class(mod)<-"data.frame"
print(mod)
mod$coefficients


f<-function(x)UseMethod("f")  #泛型方法调用,根据类型做具体调用，类似反射解耦编程
f.a<-function(x) "Class a"
f.b<-function(x) "Class b"
a<-structure(list(),class="a")
b<-structure(list(),class="b")
class(a)
f(a)
f(b)

#为已有的泛型函数添加一个方法
mean.a<-function(x) "mean method for class a"
mean(a)


#泛型方法的传递，默认处理
f<-function(x)UseMethod("f")
f.a<-function(x)"Class a"
f.default<-function(x)"Unknown class"  ###########
f(structure(list(),class="a"))
f(structure(list(),class=c("a","b")))
f(structure(list(),class="c"))


t
UseMethod(t())
UseMethod("Math")
methods("t")
  



########s4############

library(stats4)


y<-c(26,17,13,12,20,5,9,8,5,4,8)
nLL<-function(lambda) -sum(stats::dpois(y,lambda,log=TRUE))
fit<-mle(nLL,start=list(lambda=5),nobs=length(y))

isS4(fit)

otype(fit)

isS4(nobs)

ftype(nobs)

mle_nobs<-method_from_call(nobs(fit))  #取出S4方法

isS4(mle_nobs)

ftype(mle_nobs)

#selectMethod("nobs",list("mle"))
#method_from_call(nobs(fit)) 

#构造S4对象
setClass("Person",slots=list(name="character",age="numeric"))
setClass("Employee",slots=list(boss="Person"),contains="Person")  #contains 继承至哪个类



#构造泛型S4函数
output<-function(x,text="defalut")
{
  print("root method")
  
}
#setGeneric("Print",function(x){
#  standardGeneric("Print")
#  
#})
setGeneric("output")  #一定需要，等价于S3的UseMethod

setMethod("output","Person",function(x,text="Person Class") {
  paste(x@name," ",text)
  }) #形参要和被覆盖的函数形参保持一致

setMethod("output","Employee",function(x,text="Employee Class") { 
  print(paste(x@name," ",text))
  callNextMethod(x)}) #形参要和被覆盖的函数形参保持一致  


alice<-new("Person",name="Alice",age=40)
john<-new("Employee",name="John",age=20,boss=alice)

john@name

slot(alice,"name")  #读取属性

output(alice)

output(john) #调用父方法

#########RC############

Account<-setRefClass("Account",fields = list(balance="numeric"))
a<-Account$new(balance=100)
a$balance

a$balance<-200
a$balance

c<-a$copy()
c$balance

Account<-setRefClass("Account",fields=list(balance="numeric"),methods=list(
  withdraw=function(x)
  {
    balance<<-balance-x
  },
  deposit=function(x){
    balance<<-balance+x
  }
))

Customer<-setRefClass("Customer",fields=list(fullname="character"),methods=list(
  signature=function(x)
  {
     x
  },
  deposite=function(x)
  {
     callSuper(x*2)#???
  }
),contains = "Account")
a<-Account$new(balance=100)
a$balance
a$deposit(1000)
a$balance


c<-Customer$new(fullname="Jeff Xiong")
c$fullname
c$balance<-0
c$deposit(100)
c$balance
c$signature(100)



#第八章 环境
library(pryr)
where("mean")

#深度赋值
f<-0
fm<-function()
{
  f<<-100  #在当前环境的父级甚至更高级别搜寻f变量，并对它进行赋值
  
}
f
fm()
f


#延迟绑定，真正调用变量时才加载


system.time(b %<d-%{Sys.sleep(1);1})
system.time(b)

#活动绑定，每次调用的时候，都重新进行以此赋值
tNum %<a-% runif(1)
tNum


#调试
browser()
f<-function(a)g(a)
g<-function(b)h(b)
h<-function(c)i(c)
i<-function(d){d<-d+1;"a"+d}

f(10)





