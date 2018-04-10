setwd("E:\\Desktop\\R Language\\R Level2\\天善智能学习资料\\谢佳标老师十五大案例资料\\第一课\\第一课\\")

# 利用read.table函数读入iris数据
iris <- read.table(file = "iris.txt",
                   header = TRUE)
iris <- read.table(file = "iris.csv",
                   header = TRUE,
                   sep = ",")
iris <- read.table("clipboard",T)
# 利用read.csv函数读入iris数据
iris <- read.csv("iris.txt",
                 sep = " ")
iris <- read.csv("iris.csv")

# 读入Excel数据
# 利用xlsx包读取Excel数据
install.packages("xlsx")
install.packages("rJava")
library(xlsx)
res <- read.xlsx("sample.xlsx",1) #第二个参数用来表示sheet号
res
res$FirstName

# 利用XLConnect包读取Excel数据
rm(list=ls()) #删除所有对象

install.packages("XLConnect")
install.packages("XLConnectJars")

library(XLConnect)
wb <- loadWorkbook("sample.xlsx")
xldf <- readWorksheet(wb,"mysheet")  #报错rror: NoSuchMethodError (Java): org.apache.poi.ss.usermodel.Cell.getCellTypeEnum()Lorg/apache/poi/ss/usermodel/CellType;
getSheets(wb)
xldf <- readWorksheet(wb,sheet = getSheets(wb)[1])  #报错rror: NoSuchMethodError (Java): org.apache.poi.ss.usermodel.Cell.getCellTypeEnum()Lorg/apache/poi/ss/usermodel/CellType;
xldf
# 利用RODBC包读取Excel数据
install.packages("RODBC")
library(RODBC)
channel <- odbcConnectExcel2007("sample.xlsx")
xlrodbc <- sqlFetch(channel,"Sheet2")  #sheet名称区分大小写
xlrodbc
# 利用readxl包来读取Excel数据
library(readxl)
xlread <- read_excel("sample.xlsx",sheet = 1)
rm(list=ls())
xlread <- read_excel("sample.xlsx",sheet = "mysheet")
xlread

# 利用foreign包读取特殊格式数据
# 读入spss的数据
library(foreign)
sample <- read.spss("sample100.sav",to.data.frame = TRUE)
head(sample)
# 读取weka的数据（arff格式）
weather_file <- system.file(
  "arff",
  "weather.arff",
  package = "rattle"
)
path <- "C:\\Program Files\\R\\R-3.3.1\\library\\rattle\\arff\\weather.arff"
weather <- read.arff(weather_file)
weather1 <- read.arff(path)
setwd("C:\\Program Files\\R\\R-3.3.1\\library\\rattle\\arff")
weather2 <- read.arff("weather.arff")

# 访问数据库管理系统（MYSQL）
# 通过ROBDC包访问MYSQL
# install.packages("RODBC")
library(RODBC)
channel <- odbcConnect("daniel","root","123456")
odbcGetInfo(channel)
# 将mtcars数据集写入到MYSQL中，生成新表mydata
sqlSave(channel,mtcars,"mydata",append = FALSE)
# 可以利用sqlFetch函数读取MYSQL中的表mydata
mydata <- sqlFetch(channel,"mydata")
str(mydata)
# 利用sqlQuery函数查询mydata表的前六行
sqlQuery(channel,"select * from mydata limit 6")
sqlQuery(channel,"select vs,am,avg(mpg) from mydata group by vs,am")
# 利用sqlDrop函数删除MYSQL中的表mydata
rm(list=ls())
sqlDrop(channel,"mydata")
odbcClose(channel)

# 利用RMySQL包连接MySQL数据库
# install.packages("RMySQL")
library(RMySQL)
conn <- dbConnect(MySQL(),host="pyspider.cloudapp.net",port=8899,dbname = "myresult",user = "root",password = "sh@yid@0",client.flag = CLIENT_MULTI_STATEMENTS )
dbGetInfo(conn) # 查看连接信息
dbSendQuery(conn,"SET NAMES gbk")

revenue <- dbGetQuery(conn,"SELECT * FROM CRMJOBSSURVEY order by createdon desc;")
head(revenue,1)
# 解决windows中文乱码问题
dbDisconnect(conn) # 断开连接
conn <- dbConnect(MySQL()
                  ,host="pyspider.cloudapp.net"
                  ,port=8899,dbname = "myresult"
                  ,user = "root"
                  ,password = "sh@yid@0"
                   ,client.flag = CLIENT_MULTI_STATEMENTS)
dbSendQuery(conn,"SET NAMES gbk")
revenue <- dbGetQuery(conn,"SELECT * FROM CRMJOBSSURVEY order by createdon desc;")
head(revenue,1)
dbDisconnect(conn) # 断开连接

# 网络数据爬取
# 通过XML或者rvest包爬取网络表格数据
# 通过XML包实现
url <- "http://cs.sports.163.com/tables/"
if(!require(XML)) install.packages("XML")
library(XML)
html <- htmlParse(url,encoding = "UTF-8")
tables <- readHTMLTable(html,header = TRUE) #报错
tables
# 通过rvest包实现
if(!require(rvest)) install.packages("rvest")
library(rvest)
html <- read_html(url,encoding = "UTF-8")
tables <- html_table(html)

# 爬取团购信息
# 利用readLinse函数爬取团购信息
url <- "http://shenzhen.lashou.com/cate/meishi"
web <- readLines(url,encoding = "UTF-8")
# 提取关键信息
# 提取goods-name 
goods_name <- web[grep("class=\"goods-name\"",web)]
goods_name <- substr(goods_name,regexpr("\">",goods_name)+2,regexpr("</",goods_name)-1)
# 提取goods-text
goods_text <- web[grep("class=\"goods-text\"",web)]
goods_text <- substr(goods_text,regexpr("\">",goods_text)+2,regexpr("</",goods_text)-1)
# 提取price
price <- web[grep("class=\"price\"",web)]
price <- substr(price,regexpr("</em>",price)+5,regexpr("</span>",price)-1)
# 提取money
money <- web[grep("class=\"money\"",web)]
money <- substr(money,regexpr("<del>",money)+5,regexpr("</del>",money)-1)
# 提取number
number <- web[grep("class=\"number\"",web)]
number <- substr(number,regexpr("<i>",number)+3,regexpr("</i>",number)-1)
number<-c(number,rep("0",60-length(number)))
result <- data.frame(goods_name = goods_name,
                     goods_text = goods_text,
                     price = price,
                     money = money,
                     number = number)
head(result)
# 利用rvest包爬取团购信息
library(rvest)
web <- read_html(url)
goods_name <- web %>% html_nodes("a.goods-name") %>% html_text()
goods_text <- web %>% html_nodes("a.goods-text") %>% html_text()
price <- web %>% html_nodes("span.price") %>% html_text()
price <- substr(price,2,nchar(price))
money <- web %>% html_nodes("span.money") %>% html_text()
money <- substr(money,2,nchar(money))
number <- web %>% html_nodes("span.number") %>% html_text()
number <- substr(number,3,nchar(number))
number<-c(number,rep("0",60-length(number)))
result <- data.frame(goods_name = goods_name,
                     goods_text = goods_text,
                     price = price,
                     money = money,
                     number = number)
DT::datatable(result)
