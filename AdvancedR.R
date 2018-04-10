options(error=traceback)

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



#NA, 各种类型的空值
NA
NA_character_
NA_complex_
NA_integer_
NA_real_
NaN


#为向量命名
x<-setNames(1:3,c("a","b","c"))
x

y<-structure(1:5,comment="my attribute")
attributes(y)



f1<-factor(letters)
levels(f1)<-rev(levels(f1)) #打印因子标签

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
tFrame<-data.frame(tMatrix)   #矩阵转数据框
tFrame




tFrame<-data.frame(x=1:3, y=list(1:2,1:3,1:4)) #error
tFrame<-data.frame(x=1:3, y=I(list(1:2,1:3,1:4)))  #??? I 将参数作为一个整体返回， list的长度要和x列的长度一致
tFrame<-data.frame(x=1:3,y=matrix(1:9,ncol=3)) #matrix的长度要和x列的长度一致
as.matrix(tFrame)

options(stringAsFactors=FALSE)  #放在字符串自动转换为因子类型

#第二章 取子集

index<-1:100
sIndex<-sample(index,replace = F)
sIndex


#取矩阵子集？
vals<-outer(1:5,1:5,FUN="paste",sep=",")
mSelect<-matrix(c(1,1,3,1,2,4),ncol=2,byrow=T)
vals[mSelect]
#vals
#      [,1]  [,2]  [,3]  [,4]  [,5] 
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





#setdiff, 减操作
df<-data.frame(x=1:3,y=3:1,z=letters[1:3])
df[setdiff(names(df),"z")]  

#subset， 取子集
subset(df,df$x==1)


#
x1<-1:10%%2==0  # %% 取余数操作符
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
  force(x)  #将当前变量强制放在函数的定义域内
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


#  问题没有重现, add函数不加force(x)也没有出错
add<-function(x)
{
  function(y)x+y  
}

address<-lapply(1:10,add)
address[[1]](10)
address[[10]](10)


add2<-function(x){
  force(x)   #强制计算，强制让该变量记录当前的环境，不让其随环境的改变而改变
  function(y)x+y
  
}

address2<-lapply(1:10,add2)
address2[[1]](10)
address2[[10]](10)

f1<-function(x={y<-1;2},y=0) 
{
  x # =2函数体内部可以对参数进行赋值
  y  #=1
  x+y #=3
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
pryr::address(x)   #用来检测赋值操作是否导致变量被频繁复制
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
x[2]<-22
pryr::address(x)

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

is.primitive(sum)  #用C语言实现的函数



###########S3#############
names<-c("jeff","lucy","lily","ben","andy")
is.object(names) & !isS4(names)  #测试对象是不是s3
pryr::otype(names)

df<-data.frame(x=1:10,y=letters[1:10])
pryr::otype(df)#?
pryr::otype(df$x)
pryr::otype(df$y)

ftype(mean)
ftype(sum)


methods("mean")  #查看泛函
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


##########调试##############
browser()  #断点
f<-function(a)g(a)
g<-function(b)h(b)
h<-function(c)i(c)
i<-function(d){
  d<-d+1
  "a"+d
  }

f(10)

sumMatrix<-function(m)
{
  browser()
  if(!is.matrix(m))stop("parameter is not matrix")
  result<-apply(m, MARGIN = 1 ,FUN = "sum")
  result
}
sumMatrix2<-function(m)
{
  #browser()
  if(!is.matrix(m))stop("parameter is not matrix")
  result<-apply(m, MARGIN = 1 ,FUN = "sum")
  result
}
sumMatrix3<-function(m)
{
  browser()
  if(!is.matrix(m))stop("parameter is not matrix")
  result<-apply(m, MARGIN = 1 ,FUN = "sum")
  result
}

sumMatrix(matrix(1:100,10,10,2))   #在函数内插入browser()语句启动调试功能

debug(sumMatrix)  #sumMatrix函数在下次调用的时候会自动进入调试模式
sumMatrix(matrix(1:100,10,10,2))   

undebug(sumMatrix) #删除调试

options(error=traceback)#错误时默认调用的方法，打印函数调用栈

debugonce(sumMatrix2)  #debugonce，只中断一次
sumMatrix2(matrix(1:100,10,10,2))   

trace(sumMatrix3,browser) #调试程序的另外一种方法
sumMatrix3(matrix(1:100,10,10,2)) 

#source("AdvancedR2.R")
#setBreakpoint("AdvancedR2.R",3)
#setBreakpoint()



###Try####

success<-try(1+2)
failure<-try("a"+"B")

class(success)  #"numeric"
class(failure)  #"try-error"



elements<-list(1:10,c(-1,10),c(T,F),letters)
results<-lapply(elements,log)

results<-lapply(elements,function(x)try(log(x)))

is.error<-function(x)inherits(x,"try-error")

succeeded<-!sapply(results,is.error)

str(results[succeeded])

elements[succeeded]

elements[!succeeded]


#######TryCatch########

fError<-function()stop("Error Thing")
fWarn<-function()warning("Warning Thing")
fMessage<-function()message("Message Thing")
fFinally<-function()print("finnally event happened")

showEventType<-function(f){
  tryCatch(f, error=function(c)"error was cought"
           ,warning=function(c)"warning was cought"
           ,message=function(c)"message was cought"
           ,finally=fFinally())
}

showEventType(fError())
showEventType(fWarn())
showEventType(fMessage())


####interrupt for tryCatch###### 防止用户中断
i<-1
while(i<3)
{
  tryCatch({
    Sys.sleep(0.5)
    message("Try to escape")
    }, interrupt=function(x){
      
      message("Try again!")
      i<<-i+1
    })
  
}



##非标准计算的函数？是哪一类函数？ 
#使用substitutue构建的动态函数，使用了元编程技术，难以预测和调整





###############第十章 函数式编程###########


#匿名函数


#闭包



#函数列表
simple_tag<-function(tag){
  
  force(tag)
  function(...)
  {
    paste0("<",tag,">",paste0(...),"</",tag,">")
    
  }
}

tags<-c("p","b","i")
html<-lapply(setNames(tags,tags),simple_tag)


html$p(c("book"))  #返回结果不一样， “...” 具体是什么作用？？？ ...表示尚未匹配的参数，在这里，它指代传入函数中的“book”以及传c("book","rules")
html$p(c("book","rules"))  #传向量进去后，函数被调用了两次？这里应该是向量运算，传入的是个向量，所以paste0会分别为向量中的元素调用一次，并最终返回一个向量

list2env(html,environment())  #将函数列表映射到全局环境中，html是列表
b("nice girl")

#函数式编程的思想也是将通用的函数通过不断的进行抽象，将需要多次
#被调用的函数抽象，并将这些抽象的函数进行高度参数化。
#1.修改封闭和扩展开放原则, 可以使用函数操作符功能


#数值积分, 函数式编程例子，将函数不断的进行高层抽象
midpoint<-function(f,a,b){
  (b-a)*f((a+b)/2)
}

trapezoid<-function(f,a,b)
{
  (b-a)/2*(f(a)+f(b))
  
}

midpoint(sin,0,pi)
trapezoid(sin,0,pi)

midpoint_composite<-function(f,a,b,n=10)
{
  points<-seq(a,b,length=n+1)
  h<-(b-a)/n
  area<-0
  for(i in seq_len(n))
  {
    area<-area+h*f((points[i]+points[i+1])/2)
  }
  area
}

trapezoid_composite<-function(f,a,b,n=10)
{
  points<-seq(a,b,length=n+1)
  h<-(b-a)/n
  area<-0
  for(i in seq_len(n))
  {
    area<-area+h/2*(f(points[i])+f(points[i+1]))
    
  }
  area
  
}
browser()
midpoint_composite(sin,0,pi,n=10)

midpoint_composite(sin,0,pi,n=100)

trapezoid_composite(sin,0,pi,n=10)

trapezoid_composite(sin,0,pi,n=100)


#将不同的函数抽象为一个参数化的函数，使用到了闭包技术,这样的写法类似于策略模式，将不同的策略组装在小函数中
composite<-function(f,a,b,n=10,rule)
{
  #browser()
  points<-seq(a,b,length=n+1)
  area<-0
  for(i in seq_len(n))
  {
    area<-area+rule(f,points[i],points[i+1])
  }
  area
}


composite(sin,0,pi,n=10,rule=midpoint)




############第十一章 泛函############
#用来替代for循环的函数

#三种常用的循环方式
#for(x in xs)
#  
#for(i in seq_along(xs))
#
#for(nm in names(xs))


#lapply的三种常用的方式
#lapply(xs, function(x){})
#
#lapply(seq_along(xs),function(i){})
#
#lapply(names(xs),function(nm){})
#


#MAP， 相等长度的多列并行计算

xs<-replicate(5,runif(10),simplify=FALSE)
ws<-replicate(5,rpois(10,5)+1,simplify = FALSE)

#xs和ws的加权计算
unlist(lapply(seq_along(xs),function(i){
  weighted.mean(xs[[i]],ws[[i]])
  }))

#使用Map进行加权计算
unlist(Map(weighted.mean,xs,ws))

#sweep, 将矩阵安装另一矩阵返回的统计结果进行计算
x<-matrix(rnorm(20,0,10),nrow=4)
x1<-sweep(x,1,apply(x,1,min),'-')
x2<-sweep(x1,1,apply(x1,1,max),'/')

#归1化处理, 用apply实现？？？
#m1<-matrix(rnorm(20,0,10),nrow=4)
#apply(nrow(m1),1,function(x){x-min(x))})


#创建乘法表
outer(1:3,1:10,"*")


#reduce   --》可以用该函数来扩展其他的函数
Reduce('+',1:3) # (1+2)+3
Reduce(sum,1:3)  # sum(sum(sum(1),2),3)

rm_na<-function(x,y,identity)
{
  if(is.na(x) && is.na(y))
  {
    identity
    
  }
  else if(is.na(x))
  {
    y
  }
  else
  {
    x
  }
}


add<-function(x,y,na.rm=FALSE){
  
  if(na.rm && (is.na(x) || is.na(y))) rm_na(x,y,0) else x+y
}

r_add<-function(xs,na.rm=TRUE)
{
  Reduce(function(x,y)add(x,y,na.rm=na.rm),xs)
}

r_add(1:10)

#find, where, position???找不到函数
#namelist<-c("jeff","jim","lily","lucy")
#find(is.character,namelist)



################第十二章 函数运算符########################
##函数运算符提供包装其他的函数并提供额外功能的作用，类似OOP中的装饰者模式，使用函数闭包来实现包装功能
#常用的函数运算符
#compact
#failwith
#Negate
#tee
#memoise

test<-function(...)
{
  str(...)
  
}


test(1)
test(c(1,2,3,4,5,6,7,8))
test(1,T)

install.packages(c("memoise","plyr","pryr"))
library("memoise")
library("plyr")
library("pryr")

#额外行为函数运算符合

dot_every<-function(n,f)
{
  #browser()
  i<-1
  function(...)
  {
    if(i&&n==0)cat(".")
    i<<-i+1
    f(...)
  }
  
}

x<-lapply(1:100,runif)
x<-lapply(1:100,dot_every(10,runif))  #does not work？？？

chatty<-function(f)
{
  browser()
  function(x,...){
    res<-f(x,...)
    cat("Process ",x,"\n",sep="")
    res
  }
}

f<-function(x)x^2
s<-c(3,2,1)
chatty(f)(10)

#备忘录
fib<-function(n)
{
  if(n<2)
     return(1)
  else
    fib(n-1)+fib(n-2)
}

system.time(fib(30))

fib2<-memoise(function(n){
  if(n<2)return(1)
  fib(n-1)+fib(n-2)
})

system.time(fib2(30))


#输出函数的函数操作符

Negate<-function(f)  #取反操作
{
  force(f)
  function(...)!f(...)
}
(Negate(is.null))(NULL)

#改变输入的函数操作符

splat<-function(f){
  force(f)
  function(args)
  {
    do.call(f,args)
  }
}

x<-c(NA,runif(100),1000)
args<-list(list(x),list(x,na.rm=TRUE),list(x,na.rm=TRUE,trim=0.1))
lapply(args,splat(mean))


#函数组合
compose<-function(f,g)
{
  function(...)f(g(...))
}

'%o%'<-compose
sapply(mtcars,length%o%unique)

compose(sqrt,`+`)(1,8)   #`和单引号不一样
(sqrt %o% `+`)(1,8)


#逻辑谓词函数操作符
and<-function(f1,f2)
{
  force(f1);force(f2)
  function(...)
  {
    f1(...)&&f2(...)
  }
}
and(is.character,is.numeric)("1")


############第十三章 非标准函数#################

###捕获表达式
substitute()
deparse() #将表达式转化为字符串


f<-function(x)substitute(x)
g<-function(x)deparse(f(x))

f(1:10)
f(1+2)

g(1:10)
g(x)


#substitue 的后门 
substitute_q<-function(x,env){
  call<-substitute(substitute(y,env),list(y=x))
  eval(call)  #调用一次eval可以消除一次substitue
}

x<-quote(a+b)
#substitute(x)
substitute_q(x,list(a=1,b=2))


#########第十四章 表达式#####
###生成代码的函数#####soft code，用代码生成代码的元数据编程，类似C#中的反射

###抽象语法树
pryr::ast(y<-x*10)
df<-substitute(class(df),list(df=data.frame(x=10)))
typeof(df)
class(df)
eval(df)

#动态执行表达式
exp1<-substitute(a+b+c,list(a=1,b=2,c=3))
eval(exp1)



###名字，调用




x<-quote(read.csv("important.csv",row.names=FALSE))

typeof(x)
class(x)
str(x)

names(x)
x$row.names

length(x)-1  #参数的个数

as.list(x)
eval(x)  #调用

#修改调用，就是soft code，动态编程
x$row.names<-TRUE
x$col.names<-FALSE
x
as.list(x)
x[[2]]<-"//data//jobs.csv"
x
eval(x)


#call, as.call
c1<-as.call(list(quote(mean),quote(1:10)))
typeof(c1)
class(c1)
eval(c1)


###捕获当前调用
sum(1,100)
#sys.call()
#match.call()

f<-function(abc=1,def=2,ghi=3)
{
  list(sys=sys.call(),match=match.call())
}

f(d=2,2)
#sys.call() 用在函数内部，列出当前用户对函数的调用 f(d = 2, 2)
#match.call() 用在函数内部，按照函数的形参表列出当前用户对函数的调用 f(abc = 2, def = 2)
#$sys
#f(d = 2, 2)
#
#$match
#f(abc = 2, def = 2)

testLM<-lm(mpg~cyl+disp+hp+drat,mtcars)
summary(testLM)
testLM$call
typeof(testLM$call)

###成对列表
make_function<-function(args,body,env=parent.frame())
{
  args<-as.pairlist(args)
  eval(call("function",args,body),env)
}

add_new<-make_function(alist(a=1,b=2),quote(a+b))
typeof(add_new)  #closure
class(add_new)   #function

add_new()

generate_matrix<-make_function(alist(a=1:100,b=10,c=10),quote(matrix(a,b,c)))
generate_matrix()


###解析与逆解析
z<-quote(y<-x*10)  #typeof language
deparse(z)  #typeof character
parse(text=deparse(z))  #typeof expression

e1<-parse(text="1+2+3")
call(e1)  #无法调用表达式？？？




##############第十五章 领域特定语言 ############


###该例子使用了如下技术点：泛函，S3，闭包，函数列表，表达式
html<-function(x)structure(x,class="html")
print.html<-function(x,...)
{
  #browser()
  out<-paste0("<HTML>",x,"</HTML>")
  cat(paste(strwrap(out),collapse ="\n"),"\n",sep="")
}

escape<-function(x)UseMethod("escape")
escape.html<-function(x)x
escape.character<-function(x){  #character 只针对特殊字符还是文本和字符？
  browser()
  x<-gsub("&","&amp",x)
  x<-gsub("<","&lt;",x)
  x<-gsub(">","&gt;",x)
  html(x)
}

escape.list<-function(x)
{
  lapply(x,escape)
}


escape("This is some text")
escape("x>1 & y<2")
escape(escape("This is some text. 1>2"))#第一个escape返回的结果为html，所以就没有进行再次转义

escape(html("<hr/>"))


named<-function(x)
{
  if(is.null(names(x)))return(NULL)
  x[names(x)!=""]
  
}
unnamed<-function(x){
  if(is.null(names(x)))return(x)
  x[names(x)==""]
}


source("dsl-html-attributes.r",local=TRUE)
p<-function(...)
{
  browser()
  args<-list(...)
  attribs<-html_attributes(named(args))
  children<-unlist(escape(unnamed(args)))
  html(paste0("<p",attribs,">",paste(children,collapse = ""),"</p>"))
  
}

p("some text")

p("Some text",id="myid")

p("Some text",image=NULL)

p("Some text",class="important","data-value"=10)


tag<-function(tag)
{
  force(tag)
  function(...){
    browser()
    args<-list(...)
    attribs<-html_attributes(named(args))
    children<-unlist(escape(unnamed(args)))
    html(paste0("<",tag,attribs,">",paste(children,collapse=""),"</",tag,">"))
  }
}


p<-tag("p")
b<-tag("b")
i<-tag("i")

p("Some text",b("Some bold text"),i("Some italic text"),class="mypara")

void_tag<-function(tag){  #没有结尾符号的html标签
  force(tag)
  function(...)
  {
    args<-list(...)
    if(length(unnamed(args))>0)
    {
      stop("Tag",tag,"can not have children",call.=FALSE)  #call. 什么意思
    }
    attribs<-html_attributes(named(args))
    html(paste0("<",tag,attribs,"/>"))
    
  }
}

img<-void_tag("img")

img(src="myimage.png",width=100,height=100)

tags <- c("a", "abbr", "address", "article", "aside", "audio", 
          "b","bdi", "bdo", "blockquote", "body", "button", "canvas", 
          "caption","cite", "code", "colgroup", "data", "datalist", 
          "dd", "del","details", "dfn", "div", "dl", "dt", "em", 
          "eventsource","fieldset", "figcaption", "figure", "footer", 
          "form", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", 
          "hgroup", "html", "i","iframe", "ins", "kbd", "label", 
          "legend", "li", "mark", "map","menu", "meter", "nav", 
          "noscript", "object", "ol", "optgroup", "option", "output", 
          "p", "pre", "progress", "q", "ruby", "rp","rt", "s", "samp", 
          "script", "section", "select", "small", "span", "strong", 
          "style", "sub", "summary", "sup", "table", "tbody", "td", 
          "textarea", "tfoot", "th", "thead", "time", "title", "tr",
          "u", "ul", "var", "video")

void_tags <- c("area", "base", "br", "col", "command", "embed",
               "hr", "img", "input", "keygen", "link", "meta", "param", 
               "source", "track", "wbr")

tag_fs<-c(setNames(lapply(tags,tag),tags),
          setNames(lapply(void_tags,void_tag),void_tags))#函数列表

tag_fs$p("Some text.",tag_fs$b("Some bold text"),tag_fs$i("Some italic text"))

with_html<-function(code)
{
  eval(substitute(code),tag_fs) # tag_fs为表达式的执行环境
}

with_html(body(h1("A1 heading",id="first"),p("Some text &",b("some bold text.")),img(src="myimg.png",width=100,heigh=100)))


###LaTex

to_math<-function(x)
{
  expr<-substitute(x)
  eval(expr,latex_env(expr))
}

greek <- c(
  "alpha", "theta", "tau", "beta", "vartheta", "pi", "upsilon",
  "gamma", "gamma", "varpi", "phi", "delta", "kappa", "rho",
  "varphi", "epsilon", "lambda", "varrho", "chi", "varepsilon",
  "mu", "sigma", "psi", "zeta", "nu", "varsigma", "omega", "eta",
  "xi", "Gamma", "Lambda", "Sigma", "Psi", "Delta", "Xi", 
  "Upsilon", "Omega", "Theta", "Pi", "Phi")

greek_list<-setNames(paste0("\\",greek),greek)
greek_env<-list2env(as.list(greek_list),parent = emptyenv())  #将list对象放绑定到环境中

latex_env<-function(expr)
{
  greek_env
}

to_math(pi)


to_math(beta)


#未知的符号
all_names<-function(x)
{
  if(is.atomic(x))
  {
    character()
  }
  else if(is.name(x))
  {
    as.character(x)
  }
  else if(is.call(x) || is.pairlist(x))# pairlist
  {
    children<-lapply(x[-1],all_names)  #???
    unique(unlist(children))
  }
  else
  {
    stop("Don't know how to handle type",typeof(x),call.=FALSE)
  }
}

all_names(quote(x+y+f(a,b,c,10)))


#latex_env<-function(expr)
#{
#  greek_env
## names<-all_names(expr)
## symbol_list<-setNames(as.list(names),names)
#  symbol_env<-list2env(symbol_list)
# clone_env(greek_env,symbol_env)
#}

to_math(x)

to_math(longvariablename)


clone_env<-function(env,parent=parent.env(env)){
  list2env(as.list(env),parent=parent)  #？？？ 这里的先后顺序是否会影响变量值的读取顺序
}


to_math(x)
to_math(longvariablename)
to_math(pi)


unary_op<-function(left,right)
{
  force(left)
  force(right)
  function(e1)
  {
    paste0(left,e1,right)
  }
}

binary_op<-function(sep)
{
  force(sep)
  function(e1,e2){
    paste0(e1,sep,e2)
  }
}


f_env<-new.env(parent=emptyenv())

#二元运算符号
f_env$"+"<-binary_op("+")
f_env$"-"<-binary_op("-")
f_env$"*"<-binary_op("*")
f_env$"/"<-binary_op("/")
f_env$"^"<-binary_op("^")
f_env$"["<-binary_op("_")


#分组
f_env$"{"<-unary_op("\\left{","\\right}")
f_env$"("<-unary_op("\\left","\\right")
f_env$paste<-paste

#其他数学函数
f_env$sqrt<-unary_op("\\sqrt{","}")
f_env$sin<-unary_op("\\sin(",")")
f_env$log<-unary_op("\\log(",")")
f_env$abs<-unary_op("\\left|","\\right|")
f_env$frac<-function(a,b){
  paste0("\\frac{",a,"}{",b,"}")
}

#打标签
f_env$hat<-unary_op("\\hat{","}")
f_env$tilde<-unary_op("\\tilde{","}")


to_math(sin(x+pi))

to_math(log(x_i^2))


#未知函数
all_calls<-function(x)
{
  #browser()
  if(is.atomic(x)||is.name(x))
  {
    as.character(x)  #???这是什么类型
  }
  else if(is.call(x)){
    fname<-as.character(x[[1]])
    children<-lapply(x[-1],all_calls)
    #browser()
    unique(c(fname,unlist(children)))
  }else if(is.pairlist(x))
  {
    unique(unlist(lapply(x[-1],all_calls),use.names=FALSE))
  }else
  {
    stop("Don't know how to handle type",typeof(x),call.=FALSE)
  }
}

all_calls(quote(f(g+b,c,d(a))))

unknown_op<-function(op){
  force(op)
  function(...){
    contents<-paste(...,collapse = ",")
    paste0("\\mathrm{",op,"}(",contents,")")
  }
}



latex_env<-function(expr)
{
  #browser()
  #未知函数
  calls<-all_calls(expr)
  call_list<-setNames(lapply(calls,unknown_op),calls)
  call_env<-list2env(call_list)
  
  #已知函数
  #f_env<-clone_env(f_env,call_env)
  f_env<-list2env(as.list(f_env),parent=call_env)
  
  #默认函数
  symbols<-all_names(expr)
  symbol_list<-setNames(as.list(symbols),symbols)
  symbol_env<-list2env(symbol_list,parent=f_env)
  
  greek_env<-clone_env(greek_env,parent = symbol_env) 
}


to_math(f(a*b))





##############第十六章  性能#############


#微基准测试
# 1s（秒）=1000 ms（毫秒）=1，000，000微秒（us）=1，000，000，000纳秒（ns）
#
#
#
install.packages("microbenchmark")
require("microbenchmark")

x<-runif(100)
microbenchmark(sqrt(x),x^0.5)

#




#############第十七章 性能优化 #############


#并行
install.packages("parallel")
require("parallel")
detectCores()


############第十八章 内存###############
install.packages("profvis")
require("profvis")

source("memory-read-delim.R")

p<-profvis({
  prof<-read_delim("data\\diamond.csv")
  print(prof)
})
p
