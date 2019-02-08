
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

> attach(mtcars)
> plot(wt,mpg)
> abline(li(mpg,wt))
Error in abline(li(mpg, wt)) : 没有"li"这个函数
> abline(lm(mpg,wt))
Error in formula.default(object, env = baseenv()) : invalid formula
> abline(lm(mpg~wt))
> 
> 
> pdf("\\chapter03\\mygraph.pdf")
Error in pdf("\\chapter03\\mygraph.pdf") : 
  无法打开'\chapter03\mygraph.pdf'文件
> pdf("chapter03\\mygraph.pdf")
Error in pdf("chapter03\\mygraph.pdf") : 
  无法打开'chapter03\mygraph.pdf'文件
> pdf("mygraph.pdf")
> attach(mtcars)
The following objects are masked from mtcars (pos = 3):

    am, carb, cyl, disp, drat, gear, hp, mpg, qsec, vs, wt

> plot(wt,mpg)
> abline(lm(mpg~wt))
> title("Regression of MPG on Weight")
> detach(mtcars)
> dev.off()
windows 
      2 
> attach(mtcars)
The following objects are masked from mtcars (pos = 3):

    am, carb, cyl, disp, drat, gear, hp, mpg, qsec, vs, wt

> pdf("mygraph2.pdf")
>  plot(wt,mpg)
>  abline(lm(mpg~wt))
>  title("Regression of MPG on Weight")
> 
> dev.off()
windows 
      2 
> 
> getsd()
错误: 没有"getsd"这个函数
> setsw()
错误: 没有"setsw"这个函数
> getwd()
[1] "C:/Users/ghostbear/Documents"
> setwd("E:\Desktop\R Language\R\chapter03")
错误: 由""E:\D"开头的字符串中存在'\D'，但没有这种逸出号
> setwd("E:\\Desktop\\R Language\\R\\chapter03")
> dev.new()
> dev.new()
> dev.new()
> plot(mpg,wt)
> dev.new()
> abline(lm(mpg~wt))
Error in int_abline(a = a, b = b, h = h, v = v, untf = untf, ...) : 
  plot.new has not been called yet
> abline(lm(mpg~wt))
Error in int_abline(a = a, b = b, h = h, v = v, untf = untf, ...) : 
  plot.new has not been called yet
> abline.new(lm(mpg~wt))
错误: 没有"abline.new"这个函数


> abline.new(lm(mpg~wt))> > 
> dev.set()
windows 
      2 
> dev.set(3)
windows 
      3 
> abline.new(lm(mpg~wt))
错误: 没有"abline.new"这个函数
> abline(lm(mpg~wt))
Error in int_abline(a = a, b = b, h = h, v = v, untf = untf, ...) : 
  plot.new has not been called yet
> plot(mpg,wt)
> 
> 
> dose <- c(20,30,40,45,60)
> drugA <-c(16,20,27,40,60)
> drugB <-c(15,18,25,31,40)
> 
> plot(dose,drugA,type="b")
> 
> 
> #画图参数

> #画图参数> 
> #画图参数,改变绘图样式
> opar <- par(no.readonly=TRUE)
> par(lty=2,pch=17)
> plot(dose,drugA,type="b")
> par(opar)
> plot(dose,drugA,type="b",lty=2,pch=17)
> plot(dose,drugA,type="b",lty=2,pch=18)
> plot(dose,drugA,type="b",lty=2,pch=17)
> 
> #pch
> #pcex
> #cex
> #lty
> #lwd
> plot(dose,drugA,type="b",lty=3,lwd=3,pch=15,cex=2)
> 
> 
> 
> #颜色
> library(RColorBrewer)
Error in library(RColorBrewer) : 不存在叫‘RColorBrewer’这个名字的程辑包
> library(RColorBrewer)
Error in library(RColorBrewer) : 不存在叫‘RColorBrewer’这个名字的程辑包
> install.package(RColorBrewer)
错误: 没有"install.package"这个函数
> install.packages(RColorBrewer)
Error in install.packages(RColorBrewer) : 找不到对象'RColorBrewer'
> install.packages("RColorBrewer")
将程序包安装入‘C:/Users/ghostbear/Documents/R/win-library/3.3’
(因为‘lib’没有被指定)
--- 在此連線階段时请选用CRAN的鏡子 ---
试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/RColorBrewer_1.1-2.zip'
Content type 'application/zip' length 26706 bytes (26 KB)
downloaded 26 KB

程序包‘RColorBrewer’打开成功，MD5和检查也通过

下载的二进制程序包在
        C:\Users\ghostbear\AppData\Local\Temp\RtmpYFtd3p\downloaded_packages里
> libary(RColorBrewer)
错误: 没有"libary"这个函数
> library(RColorBrewer)
> n <-7
> mycolors <- brewer.pal(n,"Set1")
> barplot(rep(1,n),col=mycolors)
> 
> 
> n<-10
> mycolors<-rainbow(n)
> pie(rep(1,n),labels=mycolors,col=mycolors)
> mygrays<-gray(0:n/n)
> pie(rep(1,n),labels=mygrays,col=mycolors)
> 
> 
> 
> #字体
> par(font.lab=3,cex.lab=1.5, font.main=4, cex.main=2)
>  windowsFonts(A=windowsFont("Arial Black"),B=windowsFont("Bookman Old Style"),C=windowsFont("comic Sans MS"))
> par(family="A"）
> par(family="A")
> plot(mpg,wt)
> 
> 
> #图片尺寸
>  dose <- c(20,30,40,45,60)
> > drugA <-c(16,20,27,40,60)
错误: 意外的'>' in ">"
> > drugB <-c(15,18,25,31,40)
错误: 意外的'>' in ">"
>  drugB <-c(15,18,25,31,40)
> drugA <-c(16,20,27,40,60)
> 
> opar<- par(no.readonly=TRUE)
> par(pin=c(2,3))
> par(cex.axis=.75, font.axis=3)
> plot(dose,drugA,type="b",pch=19,lty=2,col="red")
> plot(dose,drugA,type="b",pch=23,lty=6,col="blue",bg="green")
> 
> 
> #添加文本和自定义坐标轴
> plot(dose,drugA,type="b",col="red",lty=2,pch=2,lwd=2,main="Clinical Trials for Drug A",sub="This is hypothetical data",xlab="Dosage",ylab="Drug Response",xlim=c(0,60),ylim=c(0,70))
> 
> x<-c(1:10)
> y<-x
> z<-10/x
> opar<-par(no.readonly=TRUE)
> par(mar=c(5,4,4,8)+0.1)
> plot(x,y,type="b",pch=21,col="red",yaxt="n",lty=3,ann=FALSE)
> lines(x,z,type="b",pch=22,col="blue",lty=2)
> axis(2,at=x,labels=x,col.axis="red",las=2)
> axis(4,at=x,labels=round(z,digits=2),col.axis="blue",las=2,cex.axis=0.7,tck=-.01)
> axis(4,at=z,labels=round(z,digits=2),col.axis="blue",las=2,cex.axis=0.7,tck=-.01)
> mtext("y=1/x",side=4,line=3,cex.lab=1,las=2,col="blue")
> mtext("y=1/x",side=3,line=3,cex.lab=1,las=2,col="blue")
> mtext("y=1/x",side=3,line=2,cex.lab=1,las=2,col="blue")
> mtext("y=1/x",side=3,line=0,cex.lab=1,las=2,col="blue")
> title("An example of creative Axes",xlab="X values",ylab="Y=X")
> par(opar)
> 
> 
> dev.new()
> abline(h=c(1,5,7))
Error in int_abline(a = a, b = b, h = h, v = v, untf = untf, ...) : 
  plot.new has not been called yet
> dev.set()
windows 
      3 
> abline(h=c(1,5,7))
> abline(v=seq(1,10,2), lty=2, col="blue")
> 
> 
> 
> #标识符
> opar<-par(no.readonly=TRUE)
> par(lwd=2,cex=1.5,font.lab=2)
> plot(dose,drugA,type="b",pch=15,lty=1,col="red",ylim=c(0,60),main="Drug A vs. Drug B",xlab="Drug Dosage",xlab="Drug Response")
Error in plot.default(dose, drugA, type = "b", pch = 15, lty = 1, col = "red",  : 
  正式参数"xlab"有多个与之相对应的实际参数
> plot(dose,drugA,type="b",pch=15,lty=1,col="red",ylim=c(0,60),main="Drug A vs. Drug B",xlab="Drug Dosage",ylab="Drug Response")
> abline(dose,drugB,type="b",pch=17,lty=2,col="blue")
Warning message:
In int_abline(a = a, b = b, h = h, v = v, untf = untf, ...) :
  图形参数"type"已过期不用了
> abline(dose,drugB,pch=17,lty=2,col="blue")
> abline(h=c(30),lwd=1.5,lty=2,col="gray")
> line(dose,drugB,type="b",pch=17,lty=2,col="blue")
Error in line(dose, drugB, type = "b", pch = 17, lty = 2, col = "blue") : 
  参数没有用(type = "b", pch = 17, lty = 2, col = "blue")
> lines(dose,drugB,type="b",pch=17,lty=2,col="blue")
> library(Hmisc)
Error in library(Hmisc) : 不存在叫‘Hmisc’这个名字的程辑包
> install.packages("Hmisc")
将程序包安装入‘C:/Users/ghostbear/Documents/R/win-library/3.3’
(因为‘lib’没有被指定)
还安装相依关系‘mime’, ‘dichromat’, ‘munsell’, ‘labeling’, ‘stringi’, ‘evaluate’, ‘highr’, ‘markdown’, ‘yaml’, ‘backports’, ‘jsonlite’, ‘digest’, ‘plyr’, ‘reshape2’, ‘scales’, ‘tibble’, ‘lazyeval’, ‘stringr’, ‘knitr’, ‘magrittr’, ‘checkmate’, ‘htmlwidgets’, ‘viridisLite’, ‘Rcpp’, ‘survival’, ‘Formula’, ‘ggplot2’, ‘latticeExtra’, ‘acepack’, ‘gtable’, ‘gridExtra’, ‘data.table’, ‘htmlTable’, ‘viridis’, ‘htmltools’, ‘base64enc’

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/mime_0.5.zip'
Content type 'application/zip' length 37483 bytes (36 KB)
downloaded 36 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/dichromat_2.0-0.zip'
Content type 'application/zip' length 147728 bytes (144 KB)
downloaded 144 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/munsell_0.4.3.zip'
Content type 'application/zip' length 134011 bytes (130 KB)
downloaded 130 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/labeling_0.3.zip'
Content type 'application/zip' length 40914 bytes (39 KB)
downloaded 39 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/stringi_1.1.3.zip'
Content type 'application/zip' length 14288448 bytes (13.6 MB)
downloaded 13.6 MB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/evaluate_0.10.zip'
Content type 'application/zip' length 47761 bytes (46 KB)
downloaded 46 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/highr_0.6.zip'
Content type 'application/zip' length 35890 bytes (35 KB)
downloaded 35 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/markdown_0.7.7.zip'
Content type 'application/zip' length 167729 bytes (163 KB)
downloaded 163 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/yaml_2.1.14.zip'
Content type 'application/zip' length 179367 bytes (175 KB)
downloaded 175 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/backports_1.0.5.zip'
Content type 'application/zip' length 27851 bytes (27 KB)
downloaded 27 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/jsonlite_1.3.zip'
Content type 'application/zip' length 1122865 bytes (1.1 MB)
downloaded 1.1 MB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/digest_0.6.12.zip'
Content type 'application/zip' length 172726 bytes (168 KB)
downloaded 168 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/plyr_1.8.4.zip'
Content type 'application/zip' length 1188003 bytes (1.1 MB)
downloaded 1.1 MB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/reshape2_1.4.2.zip'
Content type 'application/zip' length 571845 bytes (558 KB)
downloaded 558 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/scales_0.4.1.zip'
Content type 'application/zip' length 676013 bytes (660 KB)
downloaded 660 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/tibble_1.3.0.zip'
Content type 'application/zip' length 627114 bytes (612 KB)
downloaded 612 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/lazyeval_0.2.0.zip'
Content type 'application/zip' length 139248 bytes (135 KB)
downloaded 135 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/stringr_1.2.0.zip'
Content type 'application/zip' length 148861 bytes (145 KB)
downloaded 145 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/knitr_1.15.1.zip'
Content type 'application/zip' length 1003775 bytes (980 KB)
downloaded 980 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/magrittr_1.5.zip'
Content type 'application/zip' length 149887 bytes (146 KB)
downloaded 146 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/checkmate_1.8.2.zip'
Content type 'application/zip' length 557079 bytes (544 KB)
downloaded 544 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/htmlwidgets_0.8.zip'
Content type 'application/zip' length 848612 bytes (828 KB)
downloaded 828 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/viridisLite_0.2.0.zip'
Content type 'application/zip' length 57571 bytes (56 KB)
downloaded 56 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/Rcpp_0.12.10.zip'
Content type 'application/zip' length 3316677 bytes (3.2 MB)
downloaded 3.2 MB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/survival_2.41-3.zip'
Content type 'application/zip' length 5251889 bytes (5.0 MB)
downloaded 5.0 MB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/Formula_1.2-1.zip'
Content type 'application/zip' length 163536 bytes (159 KB)
downloaded 159 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/ggplot2_2.2.1.zip'
Content type 'application/zip' length 2761029 bytes (2.6 MB)
downloaded 2.6 MB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/latticeExtra_0.6-28.zip'
Content type 'application/zip' length 2069257 bytes (2.0 MB)
downloaded 2.0 MB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/acepack_1.4.1.zip'
Content type 'application/zip' length 91236 bytes (89 KB)
downloaded 89 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/gtable_0.2.0.zip'
Content type 'application/zip' length 57830 bytes (56 KB)
downloaded 56 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/gridExtra_2.2.1.zip'
Content type 'application/zip' length 483302 bytes (471 KB)
downloaded 471 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/data.table_1.10.4.zip'
Content type 'application/zip' length 1502201 bytes (1.4 MB)
downloaded 1.4 MB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/htmlTable_1.9.zip'
Content type 'application/zip' length 223537 bytes (218 KB)
downloaded 218 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/viridis_0.4.0.zip'
Content type 'application/zip' length 1741192 bytes (1.7 MB)
downloaded 1.7 MB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/htmltools_0.3.5.zip'
Content type 'application/zip' length 582845 bytes (569 KB)
downloaded 569 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/base64enc_0.1-3.zip'
Content type 'application/zip' length 38394 bytes (37 KB)
downloaded 37 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/Hmisc_4.0-2.zip'
Content type 'application/zip' length 1788178 bytes (1.7 MB)
downloaded 1.7 MB

程序包‘mime’打开成功，MD5和检查也通过
程序包‘dichromat’打开成功，MD5和检查也通过
程序包‘munsell’打开成功，MD5和检查也通过
程序包‘labeling’打开成功，MD5和检查也通过
程序包‘stringi’打开成功，MD5和检查也通过
程序包‘evaluate’打开成功，MD5和检查也通过
程序包‘highr’打开成功，MD5和检查也通过
程序包‘markdown’打开成功，MD5和检查也通过
程序包‘yaml’打开成功，MD5和检查也通过
程序包‘backports’打开成功，MD5和检查也通过
程序包‘jsonlite’打开成功，MD5和检查也通过
程序包‘digest’打开成功，MD5和检查也通过
程序包‘plyr’打开成功，MD5和检查也通过
程序包‘reshape2’打开成功，MD5和检查也通过
程序包‘scales’打开成功，MD5和检查也通过
程序包‘tibble’打开成功，MD5和检查也通过
程序包‘lazyeval’打开成功，MD5和检查也通过
程序包‘stringr’打开成功，MD5和检查也通过
程序包‘knitr’打开成功，MD5和检查也通过
程序包‘magrittr’打开成功，MD5和检查也通过
程序包‘checkmate’打开成功，MD5和检查也通过
程序包‘htmlwidgets’打开成功，MD5和检查也通过
程序包‘viridisLite’打开成功，MD5和检查也通过
程序包‘Rcpp’打开成功，MD5和检查也通过
程序包‘survival’打开成功，MD5和检查也通过
程序包‘Formula’打开成功，MD5和检查也通过
程序包‘ggplot2’打开成功，MD5和检查也通过
程序包‘latticeExtra’打开成功，MD5和检查也通过
程序包‘acepack’打开成功，MD5和检查也通过
程序包‘gtable’打开成功，MD5和检查也通过
程序包‘gridExtra’打开成功，MD5和检查也通过
程序包‘data.table’打开成功，MD5和检查也通过
程序包‘htmlTable’打开成功，MD5和检查也通过
程序包‘viridis’打开成功，MD5和检查也通过
程序包‘htmltools’打开成功，MD5和检查也通过
程序包‘base64enc’打开成功，MD5和检查也通过
程序包‘Hmisc’打开成功，MD5和检查也通过

下载的二进制程序包在
        C:\Users\ghostbear\AppData\Local\Temp\RtmpYFtd3p\downloaded_packages里
> library(Hmisc)
载入需要的程辑包：lattice
载入需要的程辑包：survival
载入需要的程辑包：Formula
载入需要的程辑包：ggplot2

载入程辑包：‘ggplot2’

The following object is masked from ‘mtcars’:

    mpg

The following object is masked from ‘mtcars’:

    mpg


载入程辑包：‘Hmisc’

The following objects are masked from ‘package:base’:

    format.pval, round.POSIXt, trunc.POSIXt, units

Warning messages:
1: 程辑包‘Hmisc’是用R版本3.3.3 来建造的 
2: 程辑包‘survival’是用R版本3.3.3 来建造的 
3: 程辑包‘ggplot2’是用R版本3.3.3 来建造的 
> minor.tick(nx=3,ny=3,tick.ratio=0.5)
> legend("topleft",inset=.05,title="Drug Type", c("A","B"),lty=c(1,2),pch=c(15,17),col=c("red","blue"))
> par(opar)
> 
> 
> #文本标注
> attach(mtcars)
The following object is masked from package:ggplot2:

    mpg

The following objects are masked from mtcars (pos = 9):

    am, carb, cyl, disp, drat, gear, hp, mpg, qsec, vs, wt

The following objects are masked from mtcars (pos = 10):

    am, carb, cyl, disp, drat, gear, hp, mpg, qsec, vs, wt

> detach(mtcars)
> attach(mtcars)
The following object is masked from package:ggplot2:

    mpg

The following objects are masked from mtcars (pos = 9):

    am, carb, cyl, disp, drat, gear, hp, mpg, qsec, vs, wt

The following objects are masked from mtcars (pos = 10):

    am, carb, cyl, disp, drat, gear, hp, mpg, qsec, vs, wt

> plot(wt,mpg,main="xXX",xlab="xlab",ylab="ylab",pch=18,col="blue")
> text(wt,mpg,row.names(mtcars),cex=0.6,pos=4,col="red")
> 
> 
> #图形组合
> opar<-par(no.readonly=TRUE)
> par(mfrow=c(2,2))
> plot(wt,mpg,main="wt vs. mpg")
> plot(wt,disp,main="wt vs. disp")
> his(wt,main="hist.")
错误: 没有"his"这个函数
> hist(wt,main="hist.")
> boxplot(wt,main="boxplot of wt")
> 
> 
> layout(matrix(c(1,1,2,3),2,2,byrow=TRUE),widths=c(3,1),heights=c(1,2))
> hist(wt)
> hist(mpg)
> hist(disp)
> 
> 
> 
> opar<-par(no.readonly=TRUE)
> par(fig=c(0,0.8,0,0.8)
+ )
> plot(mtcars$wt, mtcars$mpg, xlab="xlab", ylab="ylab")
> par(fig=c(0,0.8,0.55,1),new=TRUE)
> boxplot(mtcars$wt,horizontal=TRUE,axes=FALSE)
> par(fig=c(0.65,1,0,0.8),new=TRUE)
> boxplot(mtcars$mpg,axes=FALSE)
> mtext("Enhanced Scatterplot",side=3,outer=TRUE,line=-3)
> 
