
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

> #服从正态分布的伪函数
> runif(5)
[1] 0.8085362 0.4827602 0.4272967 0.8801272 0.2206980
> set.seed(1234)
> runif(5)
[1] 0.1137034 0.6222994 0.6092747 0.6233794 0.8609154
> set.seed(1234)
> runif(5)
[1] 0.1137034 0.6222994 0.6092747 0.6233794 0.8609154
> runif(6)
[1] 0.640310605 0.009495756 0.232550506 0.666083758 0.514251141 0.693591292
> 
> 
> #多元正态分布函数
> library(MASS(
+ 
+ )
+ )
> library(MASS)
> options(digits=3)
> set.seed(1234)
> mean<-c(230.7, 146,7, 3.6)
> sigma<-matrix(c(15360.8,6721.2, -47.1, 6721.2, 4700.9, -16.5,-47.1,-16.5,0.3),nrow=3,ncol=3)
> mydata<-mvrnorm(500,mean,sigma)
Error in mvrnorm(500, mean, sigma) : incompatible arguments
> sigma
        [,1]   [,2]  [,3]
[1,] 15360.8 6721.2 -47.1
[2,]  6721.2 4700.9 -16.5
[3,]   -47.1  -16.5   0.3
> help(mvrnorm)
starting httpd help server ... done
> 
> 
> 
> #矩阵操作
> a<-5
> sqrt(a)
[1] 2.24
> b<-c(1.243,5.654,2.99)
> round(b)
[1] 1 6 3
> c<-matrix(runif(12),nrow=3)
> c
      [,1]  [,2]  [,3]  [,4]
[1,] 0.694 0.923 0.286 0.232
[2,] 0.545 0.292 0.267 0.317
[3,] 0.283 0.837 0.187 0.303
> log(c)
       [,1]    [,2]  [,3]  [,4]
[1,] -0.366 -0.0797 -1.25 -1.46
[2,] -0.607 -1.2299 -1.32 -1.15
[3,] -1.263 -0.1776 -1.68 -1.20
> 
> #将运算运用到单列或单列
> apply(c,1,mean)
[1] 0.534 0.355 0.402
> apply(c,2,mean)
[1] 0.507 0.684 0.247 0.284
> 
> 
> 
> #统计学生成绩排名
> options(digits=3)
> Student<-c("John Davis","Angela Williams", "Bullwinkle Moose", "David Jones", "Janice Makhammer", "Cheryl Cushing", "reuven Ytzrhak", "Greg Knox","Joel England","Mary Rayburn")
> Math<-c(502,600,412,358,495,512,410,625,573,522)
> Science<-c(95,99,80,82,75,85,80,95,89,86)
> English<-c(25,22,18,15,20,28,15,30,27,18)
> roster<-data.frame(Student,Math,Science,English,stringAsFactors=FALSE)
> z<-scale(roster[,2:4])
> roster
            Student Math Science English stringAsFactors
1        John Davis  502      95      25           FALSE
2   Angela Williams  600      99      22           FALSE
3  Bullwinkle Moose  412      80      18           FALSE
4       David Jones  358      82      15           FALSE
5  Janice Makhammer  495      75      20           FALSE
6    Cheryl Cushing  512      85      28           FALSE
7    reuven Ytzrhak  410      80      15           FALSE
8         Greg Knox  625      95      30           FALSE
9      Joel England  573      89      27           FALSE
10     Mary Rayburn  522      86      18           FALSE
> z
         Math Science English
 [1,]  0.0127   1.078  0.5869
 [2,]  1.1434   1.591  0.0367
 [3,] -1.0257  -0.847 -0.6969
 [4,] -1.6487  -0.590 -1.2471
 [5,] -0.0681  -1.489 -0.3301
 [6,]  0.1281  -0.205  1.1370
 [7,] -1.0488  -0.847 -1.2471
 [8,]  1.4318   1.078  1.5038
 [9,]  0.8319   0.308  0.9536
[10,]  0.2434  -0.077 -0.6969
attr(,"scaled:center")
   Math Science English 
  500.9    86.6    21.8 
attr(,"scaled:scale")
   Math Science English 
  86.67    7.79    5.45 
> help(scale)
> roaster[1,]
错误: 找不到对象'roaster'
> roster[1,]
     Student Math Science English stringAsFactors
1 John Davis  502      95      25           FALSE
> roster[1,2:4]
  Math Science English
1  502      95      25
> y<-quantile(score, c(.8,.6,.4,.2)
+ )
Error in quantile(score, c(0.8, 0.6, 0.4, 0.2)) : 找不到对象'score'
> score<-apply(z,1,mean)
> score
 [1]  0.559  0.924 -0.857 -1.162 -0.629  0.353 -1.048  1.338  0.698 -0.177
> roster<-cbind(roster,score)
> roster
            Student Math Science English stringAsFactors  score
1        John Davis  502      95      25           FALSE  0.559
2   Angela Williams  600      99      22           FALSE  0.924
3  Bullwinkle Moose  412      80      18           FALSE -0.857
4       David Jones  358      82      15           FALSE -1.162
5  Janice Makhammer  495      75      20           FALSE -0.629
6    Cheryl Cushing  512      85      28           FALSE  0.353
7    reuven Ytzrhak  410      80      15           FALSE -1.048
8         Greg Knox  625      95      30           FALSE  1.338
9      Joel England  573      89      27           FALSE  0.698
10     Mary Rayburn  522      86      18           FALSE -0.177
> y<-quantile(score, c(.8,.6,.4,.2)
+ )
> y
   80%    60%    40%    20% 
 0.743  0.436 -0.358 -0.895 
> roster$grade[score>y[1]]<-"A"
> roster$grade[score<y[1] & score>=y[2]]<-"B"
> roster$grade[score<y[2] & score>=y[3]]<="C"
[1] NA NA
> roster$grade[score<y[2] & score>=y[3]]<-"C"
> roster$grade[score<y[3] & score>=y[4]]<-"D"
> roster$grade[score<y[4]]<-"E"
> roster
            Student Math Science English stringAsFactors  score grade
1        John Davis  502      95      25           FALSE  0.559     B
2   Angela Williams  600      99      22           FALSE  0.924     A
3  Bullwinkle Moose  412      80      18           FALSE -0.857     D
4       David Jones  358      82      15           FALSE -1.162     E
5  Janice Makhammer  495      75      20           FALSE -0.629     D
6    Cheryl Cushing  512      85      28           FALSE  0.353     C
7    reuven Ytzrhak  410      80      15           FALSE -1.048     E
8         Greg Knox  625      95      30           FALSE  1.338     A
9      Joel England  573      89      27           FALSE  0.698     B
10     Mary Rayburn  522      86      18           FALSE -0.177     C
> roster$grade[score<y[4]]<-"F"
> roster
            Student Math Science English stringAsFactors  score grade
1        John Davis  502      95      25           FALSE  0.559     B
2   Angela Williams  600      99      22           FALSE  0.924     A
3  Bullwinkle Moose  412      80      18           FALSE -0.857     D
4       David Jones  358      82      15           FALSE -1.162     F
5  Janice Makhammer  495      75      20           FALSE -0.629     D
6    Cheryl Cushing  512      85      28           FALSE  0.353     C
7    reuven Ytzrhak  410      80      15           FALSE -1.048     F
8         Greg Knox  625      95      30           FALSE  1.338     A
9      Joel England  573      89      27           FALSE  0.698     B
10     Mary Rayburn  522      86      18           FALSE -0.177     C
> 
> 
> name<- strsplit((roster$Student)," ")
Error in strsplit((roster$Student), " ") : 非字符参数
> name<- strsplit((roster$Student),"")
Error in strsplit((roster$Student), "") : 非字符参数
> name<- strsplit((roster$Student)," ")
Error in strsplit((roster$Student), " ") : 非字符参数
> roster$Student
 [1] John Davis       Angela Williams  Bullwinkle Moose David Jones      Janice Makhammer
 [6] Cheryl Cushing   reuven Ytzrhak   Greg Knox        Joel England     Mary Rayburn    
10 Levels: Angela Williams Bullwinkle Moose Cheryl Cushing David Jones ... reuven Ytzrhak
> name<- strsplit((roster$Student),' ')
Error in strsplit((roster$Student), " ") : 非字符参数
> help(strsplit)
> name<- strsplit(roster$Student,' ')
Error in strsplit(roster$Student, " ") : 非字符参数
> name<- strsplit(roster$Student," ")
Error in strsplit(roster$Student, " ") : 非字符参数
> name<- strsplit(roster$Student,c(" "))
Error in strsplit(roster$Student, c(" ")) : 非字符参数
> options(digits=2)
> roster
            Student Math Science English stringAsFactors score grade
1        John Davis  502      95      25           FALSE  0.56     B
2   Angela Williams  600      99      22           FALSE  0.92     A
3  Bullwinkle Moose  412      80      18           FALSE -0.86     D
4       David Jones  358      82      15           FALSE -1.16     F
5  Janice Makhammer  495      75      20           FALSE -0.63     D
6    Cheryl Cushing  512      85      28           FALSE  0.35     C
7    reuven Ytzrhak  410      80      15           FALSE -1.05     F
8         Greg Knox  625      95      30           FALSE  1.34     A
9      Joel England  573      89      27           FALSE  0.70     B
10     Mary Rayburn  522      86      18           FALSE -0.18     C
> #?? 调用strsplit函数失败
> roster[order(roster$grade)]
Error in `[.data.frame`(roster, order(roster$grade)) : 
  undefined columns selected
> roster[order(grade)]
Error in order(grade) : 找不到对象'grade'
> roster[order(grade)]
Error in order(grade) : 找不到对象'grade'
> roster[order(grade),]
Error in order(grade) : 找不到对象'grade'
> order(grade)
Error in order(grade) : 找不到对象'grade'
> roster
            Student Math Science English stringAsFactors score grade
1        John Davis  502      95      25           FALSE  0.56     B
2   Angela Williams  600      99      22           FALSE  0.92     A
3  Bullwinkle Moose  412      80      18           FALSE -0.86     D
4       David Jones  358      82      15           FALSE -1.16     F
5  Janice Makhammer  495      75      20           FALSE -0.63     D
6    Cheryl Cushing  512      85      28           FALSE  0.35     C
7    reuven Ytzrhak  410      80      15           FALSE -1.05     F
8         Greg Knox  625      95      30           FALSE  1.34     A
9      Joel England  573      89      27           FALSE  0.70     B
10     Mary Rayburn  522      86      18           FALSE -0.18     C
> roster[order(grade),]
Error in order(grade) : 找不到对象'grade'
> 
> 
> 
> 
> #控制流
> #for 循环
> for(1 in 1:10) print("hello")
错误: unexpected numeric constant in "for(1"
> for(i in 1:10) print("hello"+i)
Error in "hello" + i : 二进列运算符中有非数值参数
> for(i in 1:10) print("hello"+as.Character(i))
Error in print("hello" + as.Character(i)) : 没有"as.Character"这个函数
> for(i in 1:10) print("hello"+As.Character(i))
Error in print("hello" + As.Character(i)) : 没有"As.Character"这个函数
> for(i in 1:10) print("hello"+as.character(i))
Error in "hello" + as.character(i) : 二进列运算符中有非数值参数
> for(i in 1:10) print("hello")
[1] "hello"
[1] "hello"
[1] "hello"
[1] "hello"
[1] "hello"
[1] "hello"
[1] "hello"
[1] "hello"
[1] "hello"
[1] "hello"
> for(i in 1:10) print(as.character(i))
[1] "1"
[1] "2"
[1] "3"
[1] "4"
[1] "5"
[1] "6"
[1] "7"
[1] "8"
[1] "9"
[1] "10"


> for(i in 1:10) print(as.character(i))> > 
> roster[order(roster$grade),]
            Student Math Science English stringAsFactors score grade
2   Angela Williams  600      99      22           FALSE  0.92     A
8         Greg Knox  625      95      30           FALSE  1.34     A
1        John Davis  502      95      25           FALSE  0.56     B
9      Joel England  573      89      27           FALSE  0.70     B
6    Cheryl Cushing  512      85      28           FALSE  0.35     C
10     Mary Rayburn  522      86      18           FALSE -0.18     C
3  Bullwinkle Moose  412      80      18           FALSE -0.86     D
5  Janice Makhammer  495      75      20           FALSE -0.63     D
4       David Jones  358      82      15           FALSE -1.16     F
7    reuven Ytzrhak  410      80      15           FALSE -1.05     F
> 
> 
> #while 循环
> i<-10
> while(i>0){
+ print("Hello");
+ i<-i-1;
+ }
[1] "Hello"
[1] "Hello"
[1] "Hello"
[1] "Hello"
[1] "Hello"
[1] "Hello"
[1] "Hello"
[1] "Hello"
[1] "Hello"
[1] "Hello"
> 
> 
> #条件
> if(is.character(grade)) grade<-as.factor(grade)
错误: 找不到对象'grade'
> if(is.character(roster$grade)) grade<-as.factor(grade)
Error in is.factor(x) : 找不到对象'grade'
> if(is.character(roster$grade)) roster$grade<-as.factor(roster$grade)
> if(!is.factor(roster$grade)) grade<- as.factor(grade) else print("Grade already is a factor")
[1] "Grade already is a factor"
> 
> ifelse(roster$score>0.5,print("Passed")
+ )
[1] "Passed"
Error in ifelse(roster$score > 0.5, print("Passed")) : 
  缺少参数"no",也没有缺省值
> ifelse(roster$score>0.5,print("Passed"),print("Failed"))
[1] "Passed"
[1] "Failed"
 [1] "Passed" "Passed" "Failed" "Failed" "Failed" "Failed" "Failed" "Passed" "Passed" "Failed"
> 
> 
> feelings<-c("sad","afraid")
> for (i in feelings)
+ print( switch(i,
+ happy="I am glad you are happy",
+ afraid="There is nothing to fear",
+ sad="Cheer up",
+ angry="Calm down now")
+ )
[1] "Cheer up"
[1] "There is nothing to fear"
> 
> 
> 
> #自定义函数
> 
> 
> mystats<-function(x,parametric=TRUE,print=FALSE){
+ if(parametric){
+ center<-mean(x);spreed<-sd(x)
+ }else{
+ center<-median(x);spread<-mad(x)}
+ if(print $ parametric){
+ cat("Mean=", center, "\n", "SD=", spread, "\n")
+ }else if(print & !parametric){
+ cat("Median=",center,"\n","MAD=",spread,"\n")
+ }
+ result<-list(center=center,spread=spread)
+ return(result)
+ }
> mystats
function(x,parametric=TRUE,print=FALSE){
if(parametric){
center<-mean(x);spreed<-sd(x)
}else{
center<-median(x);spread<-mad(x)}
if(print $ parametric){
cat("Mean=", center, "\n", "SD=", spread, "\n")
}else if(print & !parametric){
cat("Median=",center,"\n","MAD=",spread,"\n")
}
result<-list(center=center,spread=spread)
return(result)
}
> set.seed(1234)
> x<-rnorm(500)
> y<-mystats(x)
Error in print$parametric : $ operator is invalid for atomic vectors
> y<-mystats(x,parametric=FALSE,print=TRUE)
Error in print$parametric : $ operator is invalid for atomic vectors


> mystats> > 
> function(x,parametric=TRUE,print=FALSE){
+ if(parametric){
+ center<-mean(x);spreed<-sd(x)
+ }else{
+ center<-median(x);spread<-mad(x)}
+ if(print $ parametric){
+ cat("Mean=", center, "\n", "SD=", spread, "\n")
+ }else if(print & !parametric){
+ cat("Median=",center,"\n","MAD=",spread,"\n")
+ }
+ result<-list(center=center,spread=spread)
+ return(result)
+ }
function(x,parametric=TRUE,print=FALSE){
if(parametric){
center<-mean(x);spreed<-sd(x)
}else{
center<-median(x);spread<-mad(x)}
if(print $ parametric){
cat("Mean=", center, "\n", "SD=", spread, "\n")
}else if(print & !parametric){
cat("Median=",center,"\n","MAD=",spread,"\n")
}
result<-list(center=center,spread=spread)
return(result)
}
> 
> mystats<-function(x,parametric=TRUE,print=FALSE){
+ if(parametric){
+ center<-mean(x);spreed<-sd(x)
+ }else{
+ center<-median(x);spread<-mad(x)}
+ if(print & parametric){
+ cat("Mean=", center, "\n", "SD=", spread, "\n")
+ }else if(print & !parametric){
+ cat("Median=",center,"\n","MAD=",spread,"\n")
+ }
+ result<-list(center=center,spread=spread)
+ return(result)
+ }
> mystats(x)
Error in mystats(x) : 找不到对象'spread'
> mystats
function(x,parametric=TRUE,print=FALSE){
if(parametric){
center<-mean(x);spreed<-sd(x)
}else{
center<-median(x);spread<-mad(x)}
if(print & parametric){
cat("Mean=", center, "\n", "SD=", spread, "\n")
}else if(print & !parametric){
cat("Median=",center,"\n","MAD=",spread,"\n")
}
result<-list(center=center,spread=spread)
return(result)
}
> mystats<-function(x,parametric=TRUE,print=FALSE){
+ if(parametric){
+ center<-mean(x);spread<-sd(x)
+ }else{
+ center<-median(x);spread<-mad(x)}
+ if(print & parametric){
+ cat("Mean=", center, "\n", "SD=", spread, "\n")
+ }else if(print & !parametric){
+ cat("Median=",center,"\n","MAD=",spread,"\n")
+ }
+ result<-list(center=center,spread=spread)
+ return(result)
+ }
> mystats(x)
$center
[1] 0.0018

$spread
[1] 1

> x
  [1] -1.2071  0.2774  1.0844 -2.3457  0.4291  0.5061 -0.5747 -0.5466 -0.5645 -0.8900 -0.4772
 [12] -0.9984 -0.7763  0.0645  0.9595 -0.1103 -0.5110 -0.9112 -0.8372  2.4158  0.1341 -0.4907
 [23] -0.4405  0.4596 -0.6937 -1.4482  0.5748 -1.0237 -0.0151 -0.9359  1.1023 -0.4756 -0.7094
 [34] -0.5013 -1.6291 -1.1676 -2.1800 -1.3410 -0.2943 -0.4659  1.4495 -1.0686 -0.8554 -0.2806
 [45] -0.9943 -0.9685 -1.1073 -1.2520 -0.5238 -0.4968 -1.8060 -0.5821 -1.1089 -1.0150 -0.1623
 [56]  0.5631  1.6478 -0.7734  1.6059 -1.1578  0.6566  2.5490 -0.0348 -0.6696 -0.0076  1.7771
 [67] -1.1386  1.3678  1.3296  0.3365  0.0069 -0.4555 -0.3665  0.6483  2.0703 -0.1534 -1.3907
 [78] -0.7236  0.2583 -0.3171 -0.1778 -0.1700 -1.3723 -0.1738  0.8502  0.6976  0.5500 -0.4027
 [89] -0.1916 -1.1945 -0.0532  0.2552  1.7060  1.0015 -0.4956  0.3556 -1.1346  0.8782  0.9729
[100]  2.1211  0.4145 -0.4747  0.0660 -0.5025 -0.8260  0.1670 -0.8963  0.1682  0.3550 -0.0521
[111] -0.1959 -0.6491 -1.1098  0.8493  0.0224  0.8311 -1.2443  0.1690  0.6732 -0.0263 -0.1914
[122] -0.7819  2.0582  0.7505  1.8242  0.0801 -0.6314 -1.5133 -0.6361  0.2263  1.0137  0.2528
[133] -1.1719  0.6687 -1.6501 -0.3659 -0.3161 -1.9482  0.9201 -0.6229 -0.3340  1.3951  0.6367
[144] -0.1084  0.5138  0.3993  1.6629  0.2759  0.5063  0.3476 -0.3772  0.0976  1.6387 -0.8756
[155]  0.1218  1.3621 -0.2346 -1.0534 -0.8698 -0.3901 -0.8474 -0.2606 -0.4144 -0.1831  0.4071
[166]  0.6246  1.6782 -0.0687 -0.3208  1.4710  1.7043  0.0432 -0.3327 -1.8222  1.4113 -0.8376
[177] -1.1238  3.0438  0.2350 -0.0333 -2.7322 -0.0998  0.9760  0.4139  0.9123  1.9837  1.1691
[188] -0.5087  0.7042 -0.1984 -0.5381 -2.8558 -0.7896  0.4878  2.1680  0.5007  0.6202 -0.9659
[199]  0.1627 -2.0782  0.4852  0.6968  0.1855  0.7007  0.3117  0.7605  1.8425  1.1124  0.0327
[210] -1.1144  0.4181 -0.4002  1.4935 -1.6071 -0.4158  0.4220 -0.1517 -0.6062 -0.3047  0.6295
[221]  0.8952  0.6602  2.2735  1.1735  0.2877 -0.6598  2.9191  0.6774 -0.6843  0.1865 -0.3244
[232] -0.2747 -0.9335  0.1168  0.3192 -1.0775 -3.2332 -0.2549  0.0295  0.5943  0.0591  0.4134
[243] -1.0978  0.7112  0.7189  0.2517  1.3573  0.4045  0.2644  0.2680  0.4369  1.0601  0.4522
[254]  0.6632 -1.1364 -0.3705  1.4770 -1.2239  0.2581  0.4050  0.9758 -0.3489  0.1586 -1.7633
[265]  0.3386 -0.6666 -0.2386 -1.1878  0.3849  0.6666 -0.3046  1.8250  0.6706  0.9486  2.0494
[276] -0.6511  0.8086  0.9866 -0.0062  0.3191 -1.0118  0.4702 -0.7010  0.8137 -0.8114  0.3194
[287] -0.8465 -0.2458 -1.5529  0.1284  0.9854  0.1832 -1.7662 -0.6205  1.6560  1.8098 -1.1750
[298] -0.3667  0.3536  0.3192 -0.5800 -0.9533 -0.1794  1.0098  0.0236 -0.6490 -0.5044  1.6144
[309] -0.4470  0.7632  1.4717  0.4437 -0.4217 -0.0400 -0.4923  1.2277 -0.1496  1.5500 -0.5616
[320] -0.6471  0.1431  0.0242 -0.5045 -1.5814  0.0301 -0.7166  1.0826 -0.9527  1.1265 -0.6490
[331]  0.2925  0.8987 -0.5187  0.5544 -0.0880 -1.1352 -0.2701  1.6198 -0.2141 -0.8178 -0.0540
[342]  0.3301  0.9553  1.1440  0.1005  1.1646 -0.7643 -2.3445 -0.4717 -0.5159 -2.3160  0.5625
[353] -0.7838 -0.2261 -1.5871  0.5475  1.8912 -0.8781 -0.1126  1.9487  0.9338  1.9131 -0.0052
[364] -0.1523 -0.5096  1.4346 -1.2858  0.3073 -0.0463  2.2518 -0.6080 -1.5093  0.2326 -0.0396
[375] -0.8391  0.1323 -0.2755 -0.6788  0.5008 -0.3317 -1.8350 -2.6517 -0.5806  1.4542  0.8381
[386]  1.2151  0.9825  0.3158 -1.5071  0.2056  1.5972 -3.3961 -0.7814  1.1025  0.5287  0.7894
[397]  0.4571  0.5388  0.0146 -0.9165 -1.2268  0.0362 -0.4214 -0.8994  0.4174  0.1534  1.4633
[408] -1.1215 -0.5178 -0.0749 -1.4078 -0.2847 -0.7082 -2.1476 -0.2838 -0.5341  1.1330 -0.6041
[419]  0.5575  0.1426 -1.2369  0.3741 -0.1061  0.1661  0.6580  0.1140  1.5852  0.1156 -1.2540
[430]  0.7419 -1.2229 -1.9189 -0.8099 -0.7447 -0.6075  1.6068  1.6356  0.7261 -1.2738  0.0231
[441]  0.4871 -0.1370  0.1717 -0.9448 -1.2876  1.4078  0.2674 -0.4084  0.3253  2.0625  0.3627
[452]  1.4114  1.3675 -0.4072  0.7625 -0.6512 -1.4737 -1.2017 -0.1487  1.7971  0.1048 -0.8028
[463]  0.2304  0.6980 -1.2952 -1.0547 -1.9416 -1.2696 -0.8874 -0.2919  1.4101  0.8886  0.2730
[474] -0.5666 -0.0402  0.5476 -0.5040  1.0591  1.0975 -1.1665 -0.7469  1.2067 -1.6872  0.4197
[485]  0.2335  3.1959 -2.7297 -0.8408  0.6740  1.6743  0.8397 -1.4284  2.2394 -1.7573 -1.1130
[496] -0.0431  2.2256  0.5063  0.7304  1.7281
> 
> 
> 
> #转置
> cars<-mtcars[1:5,1:4]
> cars
                  mpg cyl disp  hp
Mazda RX4          21   6  160 110
Mazda RX4 Wag      21   6  160 110
Datsun 710         23   4  108  93
Hornet 4 Drive     21   6  258 110
Hornet Sportabout  19   8  360 175
> t(cars)
     Mazda RX4 Mazda RX4 Wag Datsun 710 Hornet 4 Drive Hornet Sportabout
mpg         21            21         23             21                19
cyl          6             6          4              6                 8
disp       160           160        108            258               360
hp         110           110         93            110               175
> cars
                  mpg cyl disp  hp
Mazda RX4          21   6  160 110
Mazda RX4 Wag      21   6  160 110
Datsun 710         23   4  108  93
Hornet 4 Drive     21   6  258 110
Hornet Sportabout  19   8  360 175
> cars2<-t(cars)
> cars2
     Mazda RX4 Mazda RX4 Wag Datsun 710 Hornet 4 Drive Hornet Sportabout
mpg         21            21         23             21                19
cyl          6             6          4              6                 8
disp       160           160        108            258               360
hp         110           110         93            110               175
> 
> 
> options(digits=3)
> aggdata<-aggregate(mtcars,by=list(cyl,gear),FUN=mean,na.rm=TRUE)
Error in aggregate.data.frame(mtcars, by = list(cyl, gear), FUN = mean,  : 
  找不到对象'cyl'

> aggdata<-aggregate(mtcars,by=list(cyl,gear),FUN=mean,na.rm=TRUE)> 
> attach(mycars)
Error in attach(mycars) : 找不到对象'mycars'
> attach(mtcars)
> aggdata<-aggregate(mtcars,by=list(cyl,gear),FUN=mean,na.rm=TRUE)
> aggdata
  Group.1 Group.2  mpg cyl disp  hp drat   wt qsec  vs   am gear carb
1       4       3 21.5   4  120  97 3.70 2.46 20.0 1.0 0.00    3 1.00
2       6       3 19.8   6  242 108 2.92 3.34 19.8 1.0 0.00    3 1.00
3       8       3 15.1   8  358 194 3.12 4.10 17.1 0.0 0.00    3 3.08
4       4       4 26.9   4  103  76 4.11 2.38 19.6 1.0 0.75    4 1.50
5       6       4 19.8   6  164 116 3.91 3.09 17.7 0.5 0.50    4 4.00
6       4       5 28.2   4  108 102 4.10 1.83 16.8 0.5 1.00    5 2.00
7       6       5 19.7   6  145 175 3.62 2.77 15.5 0.0 1.00    5 6.00
8       8       5 15.4   8  326 300 3.88 3.37 14.6 0.0 1.00    5 6.00
> mycars
错误: 找不到对象'mycars'
> mtcars
                     mpg cyl  disp  hp drat   wt qsec vs am gear carb
Mazda RX4           21.0   6 160.0 110 3.90 2.62 16.5  0  1    4    4
Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.88 17.0  0  1    4    4
Datsun 710          22.8   4 108.0  93 3.85 2.32 18.6  1  1    4    1
Hornet 4 Drive      21.4   6 258.0 110 3.08 3.21 19.4  1  0    3    1
Hornet Sportabout   18.7   8 360.0 175 3.15 3.44 17.0  0  0    3    2
Valiant             18.1   6 225.0 105 2.76 3.46 20.2  1  0    3    1
Duster 360          14.3   8 360.0 245 3.21 3.57 15.8  0  0    3    4
Merc 240D           24.4   4 146.7  62 3.69 3.19 20.0  1  0    4    2
Merc 230            22.8   4 140.8  95 3.92 3.15 22.9  1  0    4    2
Merc 280            19.2   6 167.6 123 3.92 3.44 18.3  1  0    4    4
Merc 280C           17.8   6 167.6 123 3.92 3.44 18.9  1  0    4    4
Merc 450SE          16.4   8 275.8 180 3.07 4.07 17.4  0  0    3    3
Merc 450SL          17.3   8 275.8 180 3.07 3.73 17.6  0  0    3    3
Merc 450SLC         15.2   8 275.8 180 3.07 3.78 18.0  0  0    3    3
Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.25 18.0  0  0    3    4
Lincoln Continental 10.4   8 460.0 215 3.00 5.42 17.8  0  0    3    4
Chrysler Imperial   14.7   8 440.0 230 3.23 5.34 17.4  0  0    3    4
Fiat 128            32.4   4  78.7  66 4.08 2.20 19.5  1  1    4    1
Honda Civic         30.4   4  75.7  52 4.93 1.61 18.5  1  1    4    2
Toyota Corolla      33.9   4  71.1  65 4.22 1.83 19.9  1  1    4    1
Toyota Corona       21.5   4 120.1  97 3.70 2.46 20.0  1  0    3    1
Dodge Challenger    15.5   8 318.0 150 2.76 3.52 16.9  0  0    3    2
AMC Javelin         15.2   8 304.0 150 3.15 3.44 17.3  0  0    3    2
Camaro Z28          13.3   8 350.0 245 3.73 3.84 15.4  0  0    3    4
Pontiac Firebird    19.2   8 400.0 175 3.08 3.85 17.1  0  0    3    2
Fiat X1-9           27.3   4  79.0  66 4.08 1.94 18.9  1  1    4    1
Porsche 914-2       26.0   4 120.3  91 4.43 2.14 16.7  0  1    5    2
Lotus Europa        30.4   4  95.1 113 3.77 1.51 16.9  1  1    5    2
Ford Pantera L      15.8   8 351.0 264 4.22 3.17 14.5  0  1    5    4
Ferrari Dino        19.7   6 145.0 175 3.62 2.77 15.5  0  1    5    6
Maserati Bora       15.0   8 301.0 335 3.54 3.57 14.6  0  1    5    8
Volvo 142E          21.4   4 121.0 109 4.11 2.78 18.6  1  1    4    2
> #aggregate -- 分组计算
> 
> 
> install.packages("reshape2")
将程序包安装入‘C:/Users/ghostbear/Documents/R/win-library/3.3’
(因为‘lib’没有被指定)
--- 在此連線階段时请选用CRAN的鏡子 ---
Warning: failed to download mirrors file (无法打开URL'https://cran.r-project.org/CRAN_mirrors.csv'); using local file 'C:/PROGRA~1/R/R-33~1.2/doc/CRAN_mirrors.csv'
试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/reshape2_1.4.2.zip'
Content type 'application/zip' length 571928 bytes (558 KB)
downloaded 558 KB

程序包‘reshape2’打开成功，MD5和检查也通过

下载的二进制程序包在
        C:\Users\ghostbear\AppData\Local\Temp\RtmpcjdfkN\downloaded_packages里
Warning message:
In download.file(url, destfile = f, quiet = TRUE) :
  InternetOpenUrl失败:’不能连接到吊销服务器，或者未能获得最终响应。'
> install.packages("reshape2")
将程序包安装入‘C:/Users/ghostbear/Documents/R/win-library/3.3’
(因为‘lib’没有被指定)
试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/reshape2_1.4.2.zip'
Content type 'application/zip' length 571928 bytes (558 KB)
downloaded 558 KB

程序包‘reshape2’打开成功，MD5和检查也通过

下载的二进制程序包在
        C:\Users\ghostbear\AppData\Local\Temp\RtmpcjdfkN\downloaded_packages里
> library(reshape2)
Warning message:
程辑包‘reshape2’是用R版本3.3.3 来建造的 
> 
> #融合
> ID<-c("1","1","2","2")
> Time<-c("1","2","1","2")
> X1<-c("5","3","6","2")
> X2<-c("6","5","1","4")
> mydata<-data.frame(ID,Time,X1,X2)
> mydata
  ID Time X1 X2
1  1    1  5  6
2  1    2  3  5
3  2    1  6  1
4  2    2  2  4
> md<-melt(mydata,id=c("ID","Time"))
Warning message:
attributes are not identical across measure variables; they will be dropped 
> md
  ID Time variable value
1  1    1       X1     5
2  1    2       X1     3
3  2    1       X1     6
4  2    2       X1     2
5  1    1       X2     6
6  1    2       X2     5
7  2    1       X2     1
8  2    2       X2     4
> md2<-melt(mydata,id=c("ID"))
Warning message:
attributes are not identical across measure variables; they will be dropped 
> md2
   ID variable value
1   1     Time     1
2   1     Time     2
3   2     Time     1
4   2     Time     2
5   1       X1     5
6   1       X1     3
7   2       X1     6
8   2       X1     2
9   1       X2     6
10  1       X2     5
11  2       X2     1
12  2       X2     4
> 
> #重铸
> dcast(mydata,ID+Time~variable)
Using X2 as value column: use value.var to override.
Error in eval(expr, envir, enclos) : 找不到对象'variable'
> dcast(md,ID+Time~variable)
  ID Time X1 X2
1  1    1  5  6
2  1    2  3  5
3  2    1  6  1
4  2    2  2  4
> dcast(md,ID~variable)
Aggregation function missing: defaulting to length
  ID X1 X2
1  1  2  2
2  2  2  2
> dcast(md,ID~variable+time)
Error in unique.default(x) : unique()只适用于矢量
> dcast(md,ID~variable+Time)
  ID X1_1 X1_2 X2_1 X2_2
1  1    5    3    6    5
2  2    6    2    1    4
> 
