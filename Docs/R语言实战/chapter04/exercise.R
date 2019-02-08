
R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"
Copyright (C) 2016 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R是自由软件，不带任何担保。
在某些条件下你可以将其自由散布。
用'license()'或'licence()'来看散布的详细条件。

R是个合作计划，有许多人为之做出了贡献.
用'contributors()'来看合作者的详细情况
用'citation()'会告诉你如何在出版物中正确地引用R或R程序包。

用'demo()'来看一些示范程序，用'help()'来阅读在线帮助文件，或
用'help.start()'通过HTML浏览器来看帮助文件。
用'q()'退出R.

[原来保存的工作空间已还原]

> save.image("E:\\Desktop\\R Language\\R\\chapter04\\.RData")
> manager <- c(1,2,3,4,5)
> date<-c("10/24/08","10/28/08","10/1/08","10/12/08","5/1/09")
> country<-c("US","US","UK","UK","UK")
> gender<-c("M","F","F","M","F")
> age<-c(32,45,25,39,99)
> q1<-(5,3,3,3,2)
错误: 意外的',' in "q1<-(5,"
> q1<-(5,3,3,3,2)
错误: 意外的',' in "q1<-(5,"
> q1<-(5, 3, 3, 3, 2)
错误: 意外的',' in "q1<-(5,"
> q1 <-(5,3,3,3,2)
错误: 意外的',' in "q1 <-(5,"
> q1
错误: 找不到对象'q1'
> q1 <-c(5,3,3,3,2)
> q2<-(4,5,5,3,2)
错误: 意外的',' in "q2<-(4,"
> q2<-c(4,5,5,3,2)
> q3<-c(,2,5,4,1)
Error in c(, 2, 5, 4, 1) : 1元素是空的
> q3<-c(5,2,5,4,1)
> q4<-c(5,5,5,NA,2)
> q5<-c(5,5,2,NA,1)
> leadership<-date.frame(manager,date,country,gender,age,q1,q2,q3,q4,q5,stringsAsFactors=FALSE)
错误: 没有"date.frame"这个函数
> leadership<-data.frame(manager,date,country,gender,age,q1,q2,q3,q4,q5,stringsAsFactors=FALSE)
> leadership
  manager     date country gender age q1 q2 q3 q4 q5
1       1 10/24/08      US      M  32  5  4  5  5  5
2       2 10/28/08      US      F  45  3  5  2  5  5
3       3  10/1/08      UK      F  25  3  5  5  5  2
4       4 10/12/08      UK      M  39  3  3  4 NA NA
5       5   5/1/09      UK      F  99  2  2  1  2  1
> save.image("E:\\Desktop\\R Language\\R\\chapter04\\.RData")
> #运算符号
> #+，-，*，/
> #^ ** 求幂
> # %% 求余
> # %/% 求除数
> x1
错误: 找不到对象'x1'


> sumx<- mydate$x1+myda> > 
> mydate
错误: 找不到对象'mydate'
> mydata<-data.frame(x1=c(2,2,6,4),x2=c(3,4,2,8))
> mydata$sumx
NULL
> mydata$sumx<-mydata$x1+mydata$x2
> mydata$meanx<-(mydata$x1+mydata$x2)/2
> mydata$sumx
[1]  5  6  8 12
> mydata$meanx
[1] 2.5 3.0 4.0 6.0
> mydata<-transform(mydata,sumx=x1+x2,meanx=(x1+x2)/2)
> mydata
  x1 x2 sumx meanx
1  2  3    5   2.5
2  2  4    6   3.0
3  6  2    8   4.0
4  4  8   12   6.0
> #transform 可以用来扩展数据框
> 
> 
> 
> #逻辑运算符
> #   <, <=,>, >=, ==, !=, !x, x|y, x&y, isTRUE(x)
> 
> 
> 
> #列选择
> leadership$age[leadership$age ==99]<-NA
> leadership$agecat
NULL
> leadership$agecat[leadership$age >75] <- "Elder"
> leadership$agecat[leadership$age >=55 & leadership$age<=75] <- "Middle Aged"
> leadership$agecat[leadership$age <55] <- "Young"
> leadership <- within(leadership,{agecat <- NA})
> 
> leadership
  manager     date country gender age q1 q2 q3 q4 q5 agecat
1       1 10/24/08      US      M  32  5  4  5  5  5     NA
2       2 10/28/08      US      F  45  3  5  2  5  5     NA
3       3  10/1/08      UK      F  25  3  5  5  5  2     NA
4       4 10/12/08      UK      M  39  3  3  4 NA NA     NA
5       5   5/1/09      UK      F  NA  2  2  1  2  1     NA
> leadership$agecat[leadership$age >75] <- "Elder"
> leadership$agecat[leadership$age >=55 & leadership$age<=75] <- "Middle Aged"
> leadership$agecat[leadership$age <55] <- "Young"
> leadership
  manager     date country gender age q1 q2 q3 q4 q5 agecat
1       1 10/24/08      US      M  32  5  4  5  5  5  Young
2       2 10/28/08      US      F  45  3  5  2  5  5  Young
3       3  10/1/08      UK      F  25  3  5  5  5  2  Young
4       4 10/12/08      UK      M  39  3  3  4 NA NA  Young
5       5   5/1/09      UK      F  NA  2  2  1  2  1   <NA>
> leadership<-within(leadership,{})
> 
> leadership<-within(leadership,{})
> leadership<-within(leadership,{})
> leadership<-within(leadership,{})
> leadership<-within(leadership,{})
> leadership<-within(leadership,{
+ agecat<-NA
+ agecat<-[age>75]
错误: 意外的'[' in:
"agecat<-NA
agecat<-["
> leadership<-within(leadership,{
+ agecat<-NA
+ agecat[age>75]<-"Elder"
+ agecat[age>=55 & age<=75] <-"Middle Aged"
+ agecat[age<55]<-"Young"})
> leadership
  manager     date country gender age q1 q2 q3 q4 q5 agecat
1       1 10/24/08      US      M  32  5  4  5  5  5  Young
2       2 10/28/08      US      F  45  3  5  2  5  5  Young
3       3  10/1/08      UK      F  25  3  5  5  5  2  Young
4       4 10/12/08      UK      M  39  3  3  4 NA NA  Young
5       5   5/1/09      UK      F  NA  2  2  1  2  1   <NA>
> 
> 
> #重命名列
> fix(leadership)
> leadership
  managerID     date country gender age q1 q2 q3 q4 q5 agecat
1         1 10/24/08      US      M  32  5  4  5  5  5  Young
2         2 10/28/08      US      F  45  3  5  2  5  5  Young
3         3  10/1/08      UK      F  25  3  5  5  5  2  Young
4         4 10/12/08      UK      M  39  3  3  4 NA NA  Young
5         5   5/1/09      UK      F  NA  2  2  1  2  1   <NA>
> names(leadership)[2] <- "testDate"
> leadership
  managerID testDate country gender age q1 q2 q3 q4 q5 agecat
1         1 10/24/08      US      M  32  5  4  5  5  5  Young
2         2 10/28/08      US      F  45  3  5  2  5  5  Young
3         3  10/1/08      UK      F  25  3  5  5  5  2  Young
4         4 10/12/08      UK      M  39  3  3  4 NA NA  Young
5         5   5/1/09      UK      F  NA  2  2  1  2  1   <NA>
> names(leadership)[6:10] <- c("item1","item2","item3","item4","item5")
> leadership
  managerID testDate country gender age item1 item2 item3 item4 item5 agecat
1         1 10/24/08      US      M  32     5     4     5     5     5  Young
2         2 10/28/08      US      F  45     3     5     2     5     5  Young
3         3  10/1/08      UK      F  25     3     5     5     5     2  Young
4         4 10/12/08      UK      M  39     3     3     4    NA    NA  Young
5         5   5/1/09      UK      F  NA     2     2     1     2     1   <NA>
> 
> 
> install.packages("plyr")
将程序包安装入‘C:/Users/ghostbear/Documents/R/win-library/3.3’
(因为‘lib’没有被指定)
--- 在此連線階段时请选用CRAN的鏡子 ---
试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/plyr_1.8.4.zip'
Content type 'application/zip' length 1188746 bytes (1.1 MB)
downloaded 1.1 MB

程序包‘plyr’打开成功，MD5和检查也通过

下载的二进制程序包在
        C:\Users\ghostbear\AppData\Local\Temp\RtmpeGBJ46\downloaded_packages里
> library("plyr")
Warning message:
程辑包‘plyr’是用R版本3.3.3 来建造的 
> rename
function (x, replace, warn_missing = TRUE, warn_duplicated = TRUE) 
{
    names(x) <- revalue(names(x), replace, warn_missing = warn_missing)
    duplicated_names <- names(x)[duplicated(names(x))]
    if (warn_duplicated && (length(duplicated_names) > 0L)) {
        duplicated_names_message <- paste0("`", duplicated_names, 
            "`", collapse = ", ")
        warning("The plyr::rename operation has created duplicates for the ", 
            "following name(s): (", duplicated_names_message, 
            ")", call. = FALSE)
    }
    x
}
<environment: namespace:plyr>
> rename(leadership,c(managerID="manager",testDate="date"))
  manager     date country gender age item1 item2 item3 item4 item5 agecat
1       1 10/24/08      US      M  32     5     4     5     5     5  Young
2       2 10/28/08      US      F  45     3     5     2     5     5  Young
3       3  10/1/08      UK      F  25     3     5     5     5     2  Young
4       4 10/12/08      UK      M  39     3     3     4    NA    NA  Young
5       5   5/1/09      UK      F  NA     2     2     1     2     1   <NA>
> rename(leadership,c(manager="managerID",date="testDate"))
The following `from` values were not present in `x`: manager, date
  managerID testDate country gender age item1 item2 item3 item4 item5 agecat
1         1 10/24/08      US      M  32     5     4     5     5     5  Young
2         2 10/28/08      US      F  45     3     5     2     5     5  Young
3         3  10/1/08      UK      F  25     3     5     5     5     2  Young
4         4 10/12/08      UK      M  39     3     3     4    NA    NA  Young
5         5   5/1/09      UK      F  NA     2     2     1     2     1   <NA>
> 








R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"
Copyright (C) 2016 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R是自由软件，不带任何担保。
在某些条件下你可以将其自由散布。
用'license()'或'licence()'来看散布的详细条件。

R是个合作计划，有许多人为之做出了贡献.
用'contributors()'来看合作者的详细情况
用'citation()'会告诉你如何在出版物中正确地引用R或R程序包。

用'demo()'来看一些示范程序，用'help()'来阅读在线帮助文件，或
用'help.start()'通过HTML浏览器来看帮助文件。
用'q()'退出R.

[原来保存的工作空间已还原]

> leadership
  managerID testDate country gender age item1 item2 item3 item4 item5 agecat
1         1 10/24/08      US      M  32     5     4     5     5     5  Young
2         2 10/28/08      US      F  45     3     5     2     5     5  Young
3         3  10/1/08      UK      F  25     3     5     5     5     2  Young
4         4 10/12/08      UK      M  39     3     3     4    NA    NA  Young
5         5   5/1/09      UK      F  NA     2     2     1     2     1   <NA>
> y<-c(1,2,3,NA)
> is.na(y)
[1] FALSE FALSE FALSE  TRUE
> is.na(leadership)
  managerID testDate country gender   age item1 item2 item3 item4 item5
1     FALSE    FALSE   FALSE  FALSE FALSE FALSE FALSE FALSE FALSE FALSE
2     FALSE    FALSE   FALSE  FALSE FALSE FALSE FALSE FALSE FALSE FALSE
3     FALSE    FALSE   FALSE  FALSE FALSE FALSE FALSE FALSE FALSE FALSE
4     FALSE    FALSE   FALSE  FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
5     FALSE    FALSE   FALSE  FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
  agecat
1  FALSE
2  FALSE
3  FALSE
4  FALSE
5   TRUE
> 
> 
> leadership[leadership$age==99]<-NA
Error in `[<-.data.frame`(`*tmp*`, leadership$age == 99, value = NA) : 
  missing values are not allowed in subscripted assignments of data frames
> leadership$age[leadership$age==99]<-NA
> 
> #排除缺失值
> x<-c(1,2,NA,3)
> y<-x[1]+x[2]+x[3]+x[4]
> z<-sum(x)
> z
[1] NA
> 
> y
[1] NA
> k<-sum(x,na.rm=TRUE)
> k
[1] 6
> 
> leadership
  managerID testDate country gender age item1 item2 item3 item4 item5 agecat
1         1 10/24/08      US      M  32     5     4     5     5     5  Young
2         2 10/28/08      US      F  45     3     5     2     5     5  Young
3         3  10/1/08      UK      F  25     3     5     5     5     2  Young
4         4 10/12/08      UK      M  39     3     3     4    NA    NA  Young
5         5   5/1/09      UK      F  NA     2     2     1     2     1   <NA>
> newda<-na.omit(leadership)
> newdata
错误: 找不到对象'newdata'
> newda
  managerID testDate country gender age item1 item2 item3 item4 item5 agecat
1         1 10/24/08      US      M  32     5     4     5     5     5  Young
2         2 10/28/08      US      F  45     3     5     2     5     5  Young
3         3  10/1/08      UK      F  25     3     5     5     5     2  Young
> 
> 
> #日期
> #%d
> #%a
> #%A
> #%m
> #%b
> #%B
> #%y
> #%Y
> 
> mydates<-as.date("2007-06-22","2004-02-13")
错误: 没有"as.date"这个函数
> mydates<-as.Date("2007-06-22","2004-02-13")
> mydates
[1] NA
> mydates<-as.Date(c("2007-06-22","2004-02-13"))
> mydates
[1] "2007-06-22" "2004-02-13"
> strDates<-c("01/05/1965","08/16/1975")
> dates<-as.Date(strDates,"%m/%d/%Y")
> dates
[1] "1965-01-05" "1975-08-16"
> 
> myFormat<-"%m/%d/%y"
> leadership$date<-as.Date(leadership$date,myformat)
Error in as.Date.default(leadership$date, myformat) : 
  不知如何将'leadership$date'转换成“Date”类别
> leadership
  managerID testDate country gender age item1 item2 item3 item4 item5 agecat
1         1 10/24/08      US      M  32     5     4     5     5     5  Young
2         2 10/28/08      US      F  45     3     5     2     5     5  Young
3         3  10/1/08      UK      F  25     3     5     5     5     2  Young
4         4 10/12/08      UK      M  39     3     3     4    NA    NA  Young
5         5   5/1/09      UK      F  NA     2     2     1     2     1   <NA>
> fix(leadership)
> leadership
  managerID     Date country gender age item1 item2 item3 item4 item5 agecat
1         1 10/24/08      US      M  32     5     4     5     5     5  Young
2         2 10/28/08      US      F  45     3     5     2     5     5  Young
3         3  10/1/08      UK      F  25     3     5     5     5     2  Young
4         4 10/12/08      UK      M  39     3     3     4    NA    NA  Young
5         5   5/1/09      UK      F  NA     2     2     1     2     1   <NA>
> leadership$date<-as.Date(leadership$date,myformat)
Error in as.Date.default(leadership$date, myformat) : 
  不知如何将'leadership$date'转换成“Date”类别
> leadership$Date<-as.Date(leadership$Date,myformat)
Error in strptime(x, format, tz = "GMT") : 找不到对象'myformat'
> leadership$Date<-as.Date(leadership$Date,myFormat)
> leadership
  managerID       Date country gender age item1 item2 item3 item4 item5
1         1 2008-10-24      US      M  32     5     4     5     5     5
2         2 2008-10-28      US      F  45     3     5     2     5     5
3         3 2008-10-01      UK      F  25     3     5     5     5     2
4         4 2008-10-12      UK      M  39     3     3     4    NA    NA
5         5 2009-05-01      UK      F  NA     2     2     1     2     1
  agecat
1  Young
2  Young
3  Young
4  Young
5   <NA>
> Sys.Date()
[1] "2017-04-13"
> date()
[1] "Thu Apr 13 22:19:48 2017"
> 
> 
> today<-Sys.Date()
> format(today,format="%B %d %Y")
[1] "四月 13 2017"
> 
> startDate<-as.Date("2004-02-12")
> endDate<-as.Date("2011-01-22")
> days<-endDate-startDate
> days
Time difference of 2536 days
> 
> 
> today<-Sys.Date()
> dob<-as.Date("1987-01-03")
> difftime(today,dob,units="days")
Time difference of 11058 days
> difftime(today,dob,units="weeks")
Time difference of 1579.714 weeks
> difftime(today,dob,units="months")
Error in match.arg(units) : 
  'arg'应当是“auto”, “secs”, “mins”, “hours”, “days”, “weeks”其中的一个
> 
> strDate<-as.character(Sys.Date())
> strDate
[1] "2017-04-13"
> 
> 
> #类型转换
> #is.numeric() as.numeric()
> #is.character() as.character()
> #is.vector() as.vector()
> #is.matrix() as.matrix()
> #is.data.frame() as.data.frame()
> #is.factor() as.factor()
> #is.logical() as.logical()
> 
> 
> 
> is.numeric(1)
[1] TRUE
> is.numeric("1")
[1] FALSE
> is.vector("1")
[1] TRUE
> is.vector(c(1,2,3))
[1] TRUE
> is.factor("a")
[1] FALSE
> is.logical(TRUE)
[1] TRUE
> is.logical("TRUE")
[1] FALSE
> 
> 
> 
> #数据排序
> newdata<-leadership[order(leadership$age),]
> leadership
  managerID       Date country gender age item1 item2 item3 item4 item5
1         1 2008-10-24      US      M  32     5     4     5     5     5
2         2 2008-10-28      US      F  45     3     5     2     5     5
3         3 2008-10-01      UK      F  25     3     5     5     5     2
4         4 2008-10-12      UK      M  39     3     3     4    NA    NA
5         5 2009-05-01      UK      F  NA     2     2     1     2     1
  agecat
1  Young
2  Young
3  Young
4  Young
5   <NA>
> newdata
  managerID       Date country gender age item1 item2 item3 item4 item5
3         3 2008-10-01      UK      F  25     3     5     5     5     2
1         1 2008-10-24      US      M  32     5     4     5     5     5
4         4 2008-10-12      UK      M  39     3     3     4    NA    NA
2         2 2008-10-28      US      F  45     3     5     2     5     5
5         5 2009-05-01      UK      F  NA     2     2     1     2     1
  agecat
3  Young
1  Young
4  Young
2  Young
5   <NA>
> help(order)
starting httpd help server ... done
> newdata<-leadership[order(leadership$age,decreasing=TRUE),]
> newdat
错误: 找不到对象'newdat'
> newdata
  managerID       Date country gender age item1 item2 item3 item4 item5
2         2 2008-10-28      US      F  45     3     5     2     5     5
4         4 2008-10-12      UK      M  39     3     3     4    NA    NA
1         1 2008-10-24      US      M  32     5     4     5     5     5
3         3 2008-10-01      UK      F  25     3     5     5     5     2
5         5 2009-05-01      UK      F  NA     2     2     1     2     1
  agecat
2  Young
4  Young
1  Young
3  Young
5   <NA>
> 
> 
> 
> #数据集合并
> total<-merge(dataframeA,dataframeB,by="ID")
Error in merge(dataframeA, dataframeB, by = "ID") : 
  找不到对象'dataframeA'
> #横向合并 merge()
> #纵向合并 rbind()
> 
> 
> 
> #排除选择
> myvars<-names(leadership) %in% c("q3","q4")
> newdata<-leadership[!myvars]
> newdata
  managerID       Date country gender age item1 item2 item3 item4 item5
1         1 2008-10-24      US      M  32     5     4     5     5     5
2         2 2008-10-28      US      F  45     3     5     2     5     5
3         3 2008-10-01      UK      F  25     3     5     5     5     2
4         4 2008-10-12      UK      M  39     3     3     4    NA    NA
5         5 2009-05-01      UK      F  NA     2     2     1     2     1
  agecat
1  Young
2  Young
3  Young
4  Young
5   <NA>
> myvars
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
> myvars<-names(leadership) %in% c("item3","item4")
> newdata<-leadership[!myvars]
> newdata
  managerID       Date country gender age item1 item2 item5 agecat
1         1 2008-10-24      US      M  32     5     4     5  Young
2         2 2008-10-28      US      F  45     3     5     5  Young
3         3 2008-10-01      UK      F  25     3     5     2  Young
4         4 2008-10-12      UK      M  39     3     3    NA  Young
5         5 2009-05-01      UK      F  NA     2     2     1   <NA>
> newdata
  managerID       Date country gender age item1 item2 item5 agecat
1         1 2008-10-24      US      M  32     5     4     5  Young
2         2 2008-10-28      US      F  45     3     5     5  Young
3         3 2008-10-01      UK      F  25     3     5     2  Young
4         4 2008-10-12      UK      M  39     3     3    NA  Young
5         5 2009-05-01      UK      F  NA     2     2     1   <NA>
> newdata<-newdat(-9)
错误: 没有"newdat"这个函数
> newdata<-newdata(-9)
错误: 没有"newdata"这个函数
> newdata<-newdata(c(-9))
错误: 没有"newdata"这个函数
> newdata<-newdata[c(-9)]
> newdata
  managerID       Date country gender age item1 item2 item5
1         1 2008-10-24      US      M  32     5     4     5
2         2 2008-10-28      US      F  45     3     5     5
3         3 2008-10-01      UK      F  25     3     5     2
4         4 2008-10-12      UK      M  39     3     3    NA
5         5 2009-05-01      UK      F  NA     2     2     1
> 
> 
> 
> #subset
> newdata<-subset(leadership,age>=35 |age<24,select=c(item1,item2,item3,item4))
> newdata
  item1 item2 item3 item4
2     3     5     2     5
4     3     3     4    NA
> newdata<-subset(leadership,age>=35 |age<24,select=gender:item4)
> newdat
错误: 找不到对象'newdat'
> newdata
  gender age item1 item2 item3 item4
2      F  45     3     5     2     5
4      M  39     3     3     4    NA
> 
> 
> #数据抽样
> mysample<-leadership[sample(1:nrow(leadership),3,replace=FALSE),]
> mysample
  managerID       Date country gender age item1 item2 item3 item4 item5
1         1 2008-10-24      US      M  32     5     4     5     5     5
2         2 2008-10-28      US      F  45     3     5     2     5     5
5         5 2009-05-01      UK      F  NA     2     2     1     2     1
  agecat
1  Young
2  Young
5   <NA>
> leadership
  managerID       Date country gender age item1 item2 item3 item4 item5
1         1 2008-10-24      US      M  32     5     4     5     5     5
2         2 2008-10-28      US      F  45     3     5     2     5     5
3         3 2008-10-01      UK      F  25     3     5     5     5     2
4         4 2008-10-12      UK      M  39     3     3     4    NA    NA
5         5 2009-05-01      UK      F  NA     2     2     1     2     1
  agecat
1  Young
2  Young
3  Young
4  Young
5   <NA>
> 
> 
> 
> #使用SQL
> install.packages("sqldf")
将程序包安装入‘C:/Users/ghostbear/Documents/R/win-library/3.3’
(因为‘lib’没有被指定)
--- 在此連線階段时请选用CRAN的鏡子 ---
还安装相依关系‘memoise’, ‘BH’, ‘plogr’, ‘gsubfn’, ‘proto’, ‘RSQLite’, ‘DBI’, ‘chron’

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/memoise_1.0.0.zip'
Content type 'application/zip' length 23308 bytes (22 KB)
downloaded 22 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/BH_1.62.0-1.zip'
Content type 'application/zip' length 16150075 bytes (15.4 MB)
downloaded 15.4 MB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/plogr_0.1-1.zip'
Content type 'application/zip' length 17648 bytes (17 KB)
downloaded 17 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/gsubfn_0.6-6.zip'
Content type 'application/zip' length 348578 bytes (340 KB)
downloaded 340 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/proto_1.0.0.zip'
Content type 'application/zip' length 466606 bytes (455 KB)
downloaded 455 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/RSQLite_1.1-2.zip'
Content type 'application/zip' length 1983547 bytes (1.9 MB)
downloaded 1.9 MB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/DBI_0.6-1.zip'
Content type 'application/zip' length 743239 bytes (725 KB)
downloaded 725 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/chron_2.3-50.zip'
Content type 'application/zip' length 109606 bytes (107 KB)
downloaded 107 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/sqldf_0.4-10.zip'
Content type 'application/zip' length 71963 bytes (70 KB)
downloaded 70 KB

程序包‘memoise’打开成功，MD5和检查也通过
程序包‘BH’打开成功，MD5和检查也通过
程序包‘plogr’打开成功，MD5和检查也通过
程序包‘gsubfn’打开成功，MD5和检查也通过
程序包‘proto’打开成功，MD5和检查也通过
程序包‘RSQLite’打开成功，MD5和检查也通过
程序包‘DBI’打开成功，MD5和检查也通过
程序包‘chron’打开成功，MD5和检查也通过
程序包‘sqldf’打开成功，MD5和检查也通过

下载的二进制程序包在
        C:\Users\ghostbear\AppData\Local\Temp\RtmpakIZS6\downloaded_packages里
> 
> library("sqldf")
载入需要的程辑包：gsubfn
载入需要的程辑包：proto
载入需要的程辑包：RSQLite
Warning messages:
1: 程辑包‘sqldf’是用R版本3.3.3 来建造的 
2: 程辑包‘gsubfn’是用R版本3.3.3 来建造的 
3: 程辑包‘proto’是用R版本3.3.3 来建造的 
4: 程辑包‘RSQLite’是用R版本3.3.3 来建造的 
> dataset<-sqldf("select * from leadership")
Loading required package: tcltk
Warning message:
Quoted identifiers should have class SQL, use DBI::SQL() if the caller performs the quoting. 
> dataset<-sqldf("select * from leadership",row.names=TRUE)
> dataset
  managerID       Date country gender age item1 item2 item3 item4 item5 agecat
1         1 2008-10-24      US      M  32     5     4     5     5     5  Young
2         2 2008-10-28      US      F  45     3     5     2     5     5  Young
3         3 2008-10-01      UK      F  25     3     5     5     5     2  Young
4         4 2008-10-12      UK      M  39     3     3     4    NA    NA  Young
5         5 2009-05-01      UK      F  NA     2     2     1     2     1   <NA>
> dataset<-sqldf("select managerID,Date,country,item1+item2+item3+item4 from leadership",row.names=TRUE)
> dataset
  managerID       Date country item1+item2+item3+item4
1         1 2008-10-24      US                      19
2         2 2008-10-28      US                      15
3         3 2008-10-01      UK                      18
4         4 2008-10-12      UK                      NA
5         5 2009-05-01      UK                       7
> dataset<-sqldf("select managerID,Date,country,item1+item2+item3+item4 'ab' from leadership",row.names=TRUE)
> dataset
  managerID       Date country ab
1         1 2008-10-24      US 19
2         2 2008-10-28      US 15
3         3 2008-10-01      UK 18
4         4 2008-10-12      UK NA
5         5 2009-05-01      UK  7
> dataset<-sqldf("select managerID,Date,country,item1+item2+item3+item4 'composed field' from leadership",row.names=TRUE)
> dataset
  managerID       Date country composed field
1         1 2008-10-24      US             19
2         2 2008-10-28      US             15
3         3 2008-10-01      UK             18
4         4 2008-10-12      UK             NA
5         5 2009-05-01      UK              7
> 

