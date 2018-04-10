# 查看对象的数据类型
# 有三个函数 mode、class、typeof函数实现
c1 <- letters[1:3]
c2 <- 1:3
c3 <- c(1,-1,3)
# 用mode函数判断对象的数据类型
mode(c1)
mode(c2)
mode(c3)
# 用class函数判断对象的数据类型
class(c1)
class(c2)
class(c3)
# 用typeof函数判断对象的数据类型
typeof(c1);typeof(c2);typeof(c3)
# 得出结论：查看数据类型的话 mode < class < typeof 细分情况

### 向量
# 用c()函数创建向量，并用mode函数查看数据类型，用length函数查看向量的长度
w <- c(1,3,4,5,6,7) #  数值型
w
length(w)
mode(w)
w1 <- c("张三","李四","王五") #字符型
w1
length(w1)
mode(w1)
w2 <- c(TRUE,F,T)  #逻辑型
w2
length(w2)
mode(w2)
# 一个向量的所有元素必须是属于相同的模型，如果不是，R将强制进行类型转换.
w4 <- c(w,w1)  # 数值型+字符型=字符型
w4
mode(w4)
w5 <- c(w1,w2) # 字符型+逻辑型=字符型
w5
mode(w5)
(w6 <- c(w,w2)) # 数值型+逻辑型=数值型
mode(w6)
## 向量化
rm(list=ls())
(w <- 1:10)
(x <- sqrt(w))
# 也可以利用R的这个特性进行向量的算术运算
rm(list=ls())
(w1 <- c(2,3,4))
(w2 <- c(3.1,4.2,5.3))
(w <- w1 + w2)
# 如果两个向量的长度不同，R将利用循环原则，该规则重复较短的向量元素，指导得到的向量长度与较长的向量长度相同
rm(list=ls())
(w1 <- c(2,4,6,8))
(w2 <- c(10,12))
(w <- w1 + w2)
rm(list=ls())
(w1 <- c(2,4,6,8))
(w2 <- c(10,12,14))
(w <- w1 + w2)
# 等差序列的创建
seq(1,-9) #只给出首项和尾项，by自动匹配为1或者-1
seq(1,-9,length.out = 5) #给出首项和尾项数据以及长度，自动计算by
seq(1,-9,-2) #给出首项和尾项数据以及等差，自动计算长度
seq(1,by=2,length.out = 10) #给出首项和等差以及长度数据，自动计算尾项
# 重复序列的创建
rep(1:4,times = 2) 
rep(1:4,each = 2)
rep(1:4,c(2,2,2,2))
rep(1:4,c(2,1,2,1))
rep(1:4,each = 2,length.out = 4)
rep(1:4,each = 2,len = 10)
rep(1:4,each = 2,times = 3)
rep(1:4,times = 3,each = 2)
# 索引向量
x <- c(-1.91, 0.587, -1.085, -1.45, -0.152)
x
# 提取x中的元素为负的子集
x[c(1,3,4,5)]
x[-2]
x[c(T,F,T,T,T)] 
x[x < 0]
# 注意：正负值是不能混用的
x[c(-1,2)]
# which函数将返回逻辑向量中为TRUE的位置
which(x < 0)
x[which(x < 0)]
which.max(x)
which.min(x)

### 因子
# 创建因子
f <- factor(LETTERS[1:3])
f.order <- factor(LETTERS[1:3],ordered = T)
f.order
f > "A"
f == "A"
f.order > "A"
f1 <- factor(rep(1:3,3))
f1
levels(f1)
f1.label <- factor(rep(1:3,3),labels = c('Low',"Median","High"))
f1.label
# gl函数
factor(rep(1:3,each = 5))
gl(3,5)
gl(2,5,labels = c("T","F"))
gl(2,1,20)
gl(2,2,20)
gl(2,2,2)

### 矩阵和数组
# 利用matrix函数创建矩阵
(w <- seq(1,10))
(A <- matrix(w,nrow = 2,ncol = 5))
(A <- matrix(w,2,5,byrow = T)) # 按行填充
(A <- matrix(w,2,5,byrow = T,
             dimnames = list(c("r1","r2"),paste0("l",1:5))))
A[1,4]
A[1,3:4]
A[1,]
A[,3]
dim(A)
# 矩阵的拉直
as.vector(A)
# 数组创建
rm(list=ls())
(w <- array(1:30,dim = c(2,5,3)))
dim(w)

# 列表创建
my.list <- list(stud.id=12345,
                stud.name="张三",
                stud.mark=c(60,70,40,90))

# 数据框的创建
my.dataset <- data.frame(site=c('A','B',"B","B","A"),
                         season=c("Winter","Summer","Summer","Spring","Winter"),
                         PH=c(7.4,6.3,8.6,7.2,8.9))

