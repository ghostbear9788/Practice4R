### 数据基本管理 ###
## 创建新变量
# 方法一:
mydata <- iris[,1:2]
mydata$square <- mydata$Sepal.Length*mydata$Sepal.Width
# 方法二:
rm(list = ls()) 
mydata <- iris[,1:2]
attach(mydata)
mydata$square <- Sepal.Length*Sepal.Width
# 方法三：
rm(list = ls())
mydata <- iris[,1:2]
mydata <- transform(mydata,
                    square = Sepal.Length*Sepal.Length)
library(DT)
datatable(mydata,rownames = F)

### 变量重新编码
rm(list = ls())
mydata <-mtcars
mydata$am <- ifelse(mydata$am==0,"automatic","manual")

### 变量重命名
# 	reshape包中有一个rename()函数，可用于修改变量名。rename()函数的使用格式为：
#   rename(dataframe, c(oldname="newname", oldname="newname",…)) 
w <- mtcars
library(reshape)
colnames(w)
w <- rename(w,
            c(mpg = "Miles/(US) gallon",cyl = "Number of Cylinders",
              disp = "Displacement(cu.in.)",hp = "Gross horsepower"))
colnames(w)
# 也可以直接用names函数进行重命名
names(w)[5] <- "Rear axle ratio"

### 变量哑变量处理
# 	caret包中有一个dummyVars函数，可用变量虚拟化批处理。dummyVars()函数的使用格式为： 
#   dummyVars(formula, data, sep = ".", levelsOnly = FALSE, fullRank = FALSE, ...) 
customers <- data.frame(
  id=c(10,20,30,40,50), 
  gender=c('male','female','female','male','female'), 
  mood=c('happy','sad','happy','sad','happy'), 
  outcome=c(1,1,0,0,0))
customers
install.packages("caret")
library(caret)
# 哑变量处理
dmy <- dummyVars(" ~ .", data = customers)
trsf <- data.frame(predict(dmy, newdata = customers))
print(trsf)

### 转换函数-transform
# 一个数据框中常用的更改变量的函数是transform。
# 在调用这个函数时，首先要指定一个数据框（作为第一个参数），
# 跟着是一系列的表达式，表达式中的变量是数据框中的变量。
# transform函数会完成每个表达式中的计算，然后返回最终的数据框。
head(airquality)
head(transform(airquality,
               Ozone = -Ozone))
head(transform(airquality,
               new = -Ozone))
head(transform(airquality,
               new = -Ozone,
               Temp = (Temp-23)/1.8))

### 排序
# R中涉及排序的基本函数有order、sort和rank三个。
# order函数返回的是排序数据所在向量中的索引，
# rank函数返回该值处于第几位（在统计学上称为秩），
# sort函数则返回的是按次排好的数据。
(x <- c(19,84,64,2))
order(x)
rank(x)
sort(x)
# 下面再看一个例子，来更加深入了解order的用法
d <- data.frame(x=c(19,84,64,2,2),
                y=c(20,13,5,40,21))
d
# 按x的升序排序，如果x一样，则按y的升序排序
d[order(d$x,d$y),]
# 按x的升序排序，如果x一样，则按y的降序排序
d[order(d$x,-d$y),]
# 按y的升序排序，如果y一样，则按x的升序排序
d[order(d$y,d$x),]

### 选定特定行或者子集
# 很多时候需要根据一定的条件来提取特定的行，主要使用函数subset来实现这个功能。
# subset(x, subset, select, ...)
# x表示原数据，subset是逻辑表达式，表示需要满足的条件，select是一个表达式，表示对那些列来进行选择。
subset(airquality, Temp > 80, select = c(Ozone, Temp)) 
subset(airquality, Day == 1, select = -Temp) 
subset(airquality, select = Ozone:Wind) 
with(airquality, subset(Ozone, Temp > 80)) 

### 另一种操作数据框的方法
library(sqldf)
a1 <- sqldf("select * from mtcars")
head(a1)
# 按照cyl求mpg的均值
(a <- sqldf("select cyl,avg(mpg) as 'mean.mpg' from mtcars group by cyl"))
# 去数据前六行
a1r <- head(warpbreaks)
a1s <- sqldf("select * from warpbreaks limit 6")
identical(a1r,a1s)

# 利用createDataPartition函数对数据进行抽样
# 对iris数据进行演示
# 载入caret包，如果本地为安装就进行在线安装caret包
if(!require(caret)) install.packages("caret")
# 提取下标集
splitindex <- createDataPartition(iris$Species,times=1,p=0.1,list=FALSE)
splitindex
# 提取符合子集
sample <- iris[splitindex,]
# 查看Species变量中各类别的个数和占比
table(sample$Species);
prop.table(table(sample$Species))
# 设置list为TRUE
# 提取下标集
splitindex1 <- createDataPartition(iris$Species,times=1,p=0.1,list=TRUE)
# 查看下标集
splitindex1
# 提取子集
iris[splitindex1$Resample1,]
# 设置times=2
splitindex2 <- createDataPartition(iris$Species,times=2,p=0.1,list=TRUE)
splitindex2

### 数据清洗 ###
# 缺失值判断及处理
# 识别缺失值
# 以睡眠数据sleep为例：
# 加载sleep数据集
data(sleep,package="VIM")
# 查看数据结构
str(sleep)
# 列出没有缺失值的行
sleep[complete.cases(sleep),]
# 计算没有缺失值的样本量
nrow(sleep[complete.cases(sleep),])
# 列出有一个或多个缺失值的行
sleep[!complete.cases(sleep),]
# 计算有缺失值的样本量
nrow(sleep[!complete.cases(sleep),])
# 以变量Dream为研究对象
attach(sleep)
# 查看变量Dream数据
Dream
# is.na( )判断变量Dream各值是否为缺失值，TRUE为缺失值，FALSE为非缺失值
is.na(Dream)
table(is.na(Dream))
# complete.cases( )判断变量Dream各值是否为缺失值，FALSE为缺失值，TRUE为非缺失值
complete.cases(Dream)
table(complete.cases(Dream))
# 可用sum()和mean()函数来获取关于缺失数据的有用信息
# 查看变量Dream的缺失个数
sum(is.na(Dream)) # 等价于sum(!complete.cases(Dream)) 
# 查看变量Dream缺失值的占比
mean(is.na(Dream))
# 查看变量Dream非缺失值的占比
mean(complete.cases(Dream))
# 查看数据集sleep中样本有缺失值的占比
mean(!complete.cases(sleep)) 

# 探索缺失值模式
# 列表显示缺失值
# mice包中的md.pattern()函数
# 将函数应用到sleep数据集
library(mice)
data(sleep,package="VIM")
md.pattern(sleep)
# 将函数应用到nhanes2数据集
md.pattern(nhanes)

# 图形探究缺失数据
# aggr()函数
library(VIM)
aggr(sleep,prop=FALSE,numbers=TRUE)
# 代码aggr(sleep, prop = TRUE, numbers = TRUE)将生成相同的图形，但用比例代替了计数。
aggr(sleep,prop=TRUE,numbers=TRUE)
# 选项numbers = FALSE（默认）删去数值型标签
aggr(sleep,prop=FALSE,number=FALSE)

# 理性处理不完整数据
# 行删除
cor(na.omit(sleep))
cor(sleep,use="complete.obs")
# 回归模型插补
library(mice)
sub=which(is.na(nhanes2[,4])==TRUE)    # 返回nhanes2数据集中第4列为NA的行
dataTR=nhanes2[-sub,]                      # 将第4列不为NA的数存入数据集dataTR中
dataTE=nhanes2[sub,]                       # 将第4列为NA的数存入数据集dataTE中
dataTE                                             # dataTE数据
lm=lm(chl~age,data=dataTR)   # 利用dataTR中age为自变量，chl为因变量构建线性回归模型lm
nhanes2[sub,4]=round(predict(lm,dataTE)) # 利用dataTE中数据按照模型lm对nhanes2中chl中的缺失数据进行预测
head(nhanes2)          # 缺失值处理后的nhanes2的前若干条
# 随机森林插补
airquality   #有缺失值NA的R自带的数据
complete.cases(airquality) #判断每行有没有缺失值
which(complete.cases(airquality)==F) #缺失值的行号
sum(complete.cases(airquality)) #完整观测值的个数
library(missForest) #用随机森林迭代弥补缺失值
z=missForest(airquality)
air.full=z$ximp  # 随机森林插补后的新数据集

