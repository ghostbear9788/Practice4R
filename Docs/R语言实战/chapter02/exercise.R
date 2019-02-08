
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

> getwd()
[1] "C:/Users/ghostbear/Documents"
> setwd("E:\\Desktop\\R Language\\R")
> getwd()
[1] "E:/Desktop/R Language/R"
> ls()
 [1] "a"                   "articleHitsComments" "b"                  
 [4] "code"                "dispath"             "dispath2"           
 [7] "draw.plotmath.cell"  "draw.sample.cell"    "draw.title"         
[10] "draw.title.cell"     "draw.vf.cell"        "employees"          
[13] "fcol"                "fi"                  "fill"               
[16] "get.c"               "get.r"               "hfhh"               
[19] "hfhhNameOnly"        "hfhhSorted"          "i"                  
[22] "i1"                  "i2"                  "make.table"         
[25] "my_raise"            "mylm"                "myLMBig"            
[28] "myLMSmall"           "nc"                  "nearRcolor"         
[31] "NewLastName"         "nr"                  "ocode"              
[34] "oldpar"              "overlap"             "panel.stackedDens"  
[37] "plotCol"             "r"                   "rotsinc"            
[40] "showCols1"           "showCols2"           "sinc.exp"           
[43] "string"              "tf"                  "x"                  
[46] "x.at"                "y"                   "y.at"               
[49] "z"                   "z0"                  "zi"                 
> getwd()
[1] "E:/Desktop/R Language/R"
> ls()
 [1] "a"                   "articleHitsComments" "b"                  
 [4] "code"                "dispath"             "dispath2"           
 [7] "draw.plotmath.cell"  "draw.sample.cell"    "draw.title"         
[10] "draw.title.cell"     "draw.vf.cell"        "employees"          
[13] "fcol"                "fi"                  "fill"               
[16] "get.c"               "get.r"               "hfhh"               
[19] "hfhhNameOnly"        "hfhhSorted"          "i"                  
[22] "i1"                  "i2"                  "make.table"         
[25] "my_raise"            "mylm"                "myLMBig"            
[28] "myLMSmall"           "nc"                  "nearRcolor"         
[31] "NewLastName"         "nr"                  "ocode"              
[34] "oldpar"              "overlap"             "panel.stackedDens"  
[37] "plotCol"             "r"                   "rotsinc"            
[40] "showCols1"           "showCols2"           "sinc.exp"           
[43] "string"              "tf"                  "x"                  
[46] "x.at"                "y"                   "y.at"               
[49] "z"                   "z0"                  "zi"                 
> options()
$add.smooth
[1] TRUE

$browserNLdisabled
[1] FALSE

$CBoundsCheck
[1] FALSE

$check.bounds
[1] FALSE

$citation.bibtex.max
[1] 1

$continue
[1] "+ "

$contrasts
        unordered           ordered 
"contr.treatment"      "contr.poly" 

$defaultPackages
[1] "datasets"  "utils"     "grDevices" "graphics"  "stats"     "methods"  

$demo.ask
[1] "default"

$deparse.cutoff
[1] 60

$device
function (width, height, pointsize, record, rescale, xpinch, 
    ypinch, bg, canvas, gamma, xpos, ypos, buffered, title, restoreConsole, 
    clickToConfirm, fillOddEven, family = "", antialias) 
{
    check <- Sys.getenv("_R_CHECK_SCREEN_DEVICE_", "")
    msg <- "screen devices should not be used in examples etc"
    if (identical(check, "stop")) 
        stop(msg, domain = NA)
    else if (identical(check, "warn")) 
        warning(msg, immediate. = TRUE, noBreaks. = TRUE, domain = NA)
    new <- list()
    if (!missing(width)) 
        new$width <- as.double(width)
    if (!missing(height)) 
        new$height <- as.double(height)
    if (!missing(pointsize)) 
        new$pointsize <- as.double(pointsize)
    if (!missing(record)) 
        new$record <- record
    if (!missing(rescale)) 
        new$rescale <- rescale
    if (!missing(xpinch)) 
        new$xpinch <- as.double(xpinch)
    if (!missing(ypinch)) 
        new$ypinch <- as.double(ypinch)
    if (!missing(bg)) 
        new$bg <- bg
    if (!missing(canvas)) 
        new$canvas <- canvas
    if (!missing(gamma)) 
        new$gamma <- gamma
    if (!missing(xpos)) 
        new$xpos <- as.integer(xpos)
    if (!missing(ypos)) 
        new$ypos <- as.integer(ypos)
    if (!missing(buffered)) 
        new$buffered <- buffered
    if (!missing(title)) 
        new$title <- title
    if (!missing(restoreConsole)) 
        new$restoreConsole <- restoreConsole
    if (!missing(clickToConfirm)) 
        new$clickToConfirm <- clickToConfirm
    if (!missing(fillOddEven)) 
        new$fillOddEven <- fillOddEven
    if (!missing(antialias)) 
        new$antialias <- match.arg(antialias, aa.win)
    d <- check.options(new = new, envir = .WindowsEnv, name.opt = ".Windows.Options", 
        reset = FALSE, assign.opt = FALSE)
    rescale <- match(d$rescale, c("R", "fit", "fixed"))
    if (is.na(rescale)) 
        stop("invalid value for 'rescale'")
    antialias <- pmatch(d$antialias, aa.win)
    invisible(.External(C_devga, "", d$width, d$height, d$pointsize, 
        d$record, rescale, d$xpinch, d$ypinch, d$canvas, d$gamma, 
        d$xpos, d$ypos, d$buffered, .PSenv, d$bg, d$restoreConsole, 
        d$title, d$clickToConfirm, d$fillOddEven, family, antialias))
}
<bytecode: 0x000000001558d288>
<environment: namespace:grDevices>

$device.ask.default
[1] FALSE

$digits
[1] 7

$echo
[1] TRUE

$editor
[1] "internal"

$encoding
[1] "native.enc"

$example.ask
[1] "default"

$expressions
[1] 5000

$help.search.types
[1] "vignette" "demo"     "help"    

$help.try.all.packages
[1] FALSE

$help_type
[1] "html"

$HTTPUserAgent
[1] "R (3.3.2 x86_64-w64-mingw32 x86_64 mingw32)"

$install.packages.compile.from.source
[1] "interactive"

$internet.info
[1] 2

$keep.source
[1] TRUE

$keep.source.pkgs
[1] FALSE

$locatorBell
[1] TRUE

$mailer
[1] "mailto"

$max.print
[1] 99999

$menu.graphics
[1] TRUE

$na.action
[1] "na.omit"

$nwarnings
[1] 50

$OutDec
[1] "."

$pager
[1] "internal"

$papersize
[1] "a4"

$pdfviewer
[1] "C:/PROGRA~1/R/R-33~1.2/bin/x64/open.exe"

$pkgType
[1] "both"

$prompt
[1] "> "

$repos
                                CRAN                            CRANextra 
                            "@CRAN@" "http://www.stats.ox.ac.uk/pub/RWin" 

$scipen
[1] 0

$show.coef.Pvalues
[1] TRUE

$show.error.messages
[1] TRUE

$show.signif.stars
[1] TRUE

$str
$str$strict.width
[1] "no"

$str$digits.d
[1] 3

$str$vec.len
[1] 4


$str.dendrogram.last
[1] "`"

$stringsAsFactors
[1] TRUE

$timeout
[1] 60

$ts.eps
[1] 1e-05

$ts.S.compat
[1] FALSE

$unzip
[1] "internal"

$useFancyQuotes
[1] TRUE

$verbose
[1] FALSE

$warn
[1] 0

$warning.length
[1] 1000

$width
[1] 77

$windowsTimeouts
[1] 100 500

> options()
$add.smooth
[1] TRUE

$browserNLdisabled
[1] FALSE

$CBoundsCheck
[1] FALSE

$check.bounds
[1] FALSE

$citation.bibtex.max
[1] 1

$continue
[1] "+ "

$contrasts
        unordered           ordered 
"contr.treatment"      "contr.poly" 

$defaultPackages
[1] "datasets"  "utils"     "grDevices" "graphics"  "stats"     "methods"  

$demo.ask
[1] "default"

$deparse.cutoff
[1] 60

$device
function (width, height, pointsize, record, rescale, xpinch, 
    ypinch, bg, canvas, gamma, xpos, ypos, buffered, title, restoreConsole, 
    clickToConfirm, fillOddEven, family = "", antialias) 
{
    check <- Sys.getenv("_R_CHECK_SCREEN_DEVICE_", "")
    msg <- "screen devices should not be used in examples etc"
    if (identical(check, "stop")) 
        stop(msg, domain = NA)
    else if (identical(check, "warn")) 
        warning(msg, immediate. = TRUE, noBreaks. = TRUE, domain = NA)
    new <- list()
    if (!missing(width)) 
        new$width <- as.double(width)
    if (!missing(height)) 
        new$height <- as.double(height)
    if (!missing(pointsize)) 
        new$pointsize <- as.double(pointsize)
    if (!missing(record)) 
        new$record <- record
    if (!missing(rescale)) 
        new$rescale <- rescale
    if (!missing(xpinch)) 
        new$xpinch <- as.double(xpinch)
    if (!missing(ypinch)) 
        new$ypinch <- as.double(ypinch)
    if (!missing(bg)) 
        new$bg <- bg
    if (!missing(canvas)) 
        new$canvas <- canvas
    if (!missing(gamma)) 
        new$gamma <- gamma
    if (!missing(xpos)) 
        new$xpos <- as.integer(xpos)
    if (!missing(ypos)) 
        new$ypos <- as.integer(ypos)
    if (!missing(buffered)) 
        new$buffered <- buffered
    if (!missing(title)) 
        new$title <- title
    if (!missing(restoreConsole)) 
        new$restoreConsole <- restoreConsole
    if (!missing(clickToConfirm)) 
        new$clickToConfirm <- clickToConfirm
    if (!missing(fillOddEven)) 
        new$fillOddEven <- fillOddEven
    if (!missing(antialias)) 
        new$antialias <- match.arg(antialias, aa.win)
    d <- check.options(new = new, envir = .WindowsEnv, name.opt = ".Windows.Options", 
        reset = FALSE, assign.opt = FALSE)
    rescale <- match(d$rescale, c("R", "fit", "fixed"))
    if (is.na(rescale)) 
        stop("invalid value for 'rescale'")
    antialias <- pmatch(d$antialias, aa.win)
    invisible(.External(C_devga, "", d$width, d$height, d$pointsize, 
        d$record, rescale, d$xpinch, d$ypinch, d$canvas, d$gamma, 
        d$xpos, d$ypos, d$buffered, .PSenv, d$bg, d$restoreConsole, 
        d$title, d$clickToConfirm, d$fillOddEven, family, antialias))
}
<bytecode: 0x000000001558d288>
<environment: namespace:grDevices>

$device.ask.default
[1] FALSE

$digits
[1] 7

$echo
[1] TRUE

$editor
[1] "internal"

$encoding
[1] "native.enc"

$example.ask
[1] "default"

$expressions
[1] 5000

$help.search.types
[1] "vignette" "demo"     "help"    

$help.try.all.packages
[1] FALSE

$help_type
[1] "html"

$HTTPUserAgent
[1] "R (3.3.2 x86_64-w64-mingw32 x86_64 mingw32)"

$install.packages.compile.from.source
[1] "interactive"

$internet.info
[1] 2

$keep.source
[1] TRUE

$keep.source.pkgs
[1] FALSE

$locatorBell
[1] TRUE

$mailer
[1] "mailto"

$max.print
[1] 99999

$menu.graphics
[1] TRUE

$na.action
[1] "na.omit"

$nwarnings
[1] 50

$OutDec
[1] "."

$pager
[1] "internal"

$papersize
[1] "a4"

$pdfviewer
[1] "C:/PROGRA~1/R/R-33~1.2/bin/x64/open.exe"

$pkgType
[1] "both"

$prompt
[1] "> "

$repos
                                CRAN                            CRANextra 
                            "@CRAN@" "http://www.stats.ox.ac.uk/pub/RWin" 

$scipen
[1] 0

$show.coef.Pvalues
[1] TRUE

$show.error.messages
[1] TRUE

$show.signif.stars
[1] TRUE

$str
$str$strict.width
[1] "no"

$str$digits.d
[1] 3

$str$vec.len
[1] 4


$str.dendrogram.last
[1] "`"

$stringsAsFactors
[1] TRUE

$timeout
[1] 60

$ts.eps
[1] 1e-05

$ts.S.compat
[1] FALSE

$unzip
[1] "internal"

$useFancyQuotes
[1] TRUE

$verbose
[1] FALSE

$warn
[1] 0

$warning.length
[1] 1000

$width
[1] 77

$windowsTimeouts
[1] 100 500

> options(digits=3)
> x<-runif(20)
> x
 [1] 0.329 0.499 0.360 0.922 0.733 0.969 0.840 0.484 0.386 0.964 0.150 0.421
[13] 0.130 0.809 0.483 0.427 0.880 0.221 0.632 0.866
> summary(x)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  0.130   0.380   0.491   0.575   0.847   0.969 
> hist(x)
> ls()
 [1] "a"                   "articleHitsComments" "b"                  
 [4] "code"                "dispath"             "dispath2"           
 [7] "draw.plotmath.cell"  "draw.sample.cell"    "draw.title"         
[10] "draw.title.cell"     "draw.vf.cell"        "employees"          
[13] "fcol"                "fi"                  "fill"               
[16] "get.c"               "get.r"               "hfhh"               
[19] "hfhhNameOnly"        "hfhhSorted"          "i"                  
[22] "i1"                  "i2"                  "make.table"         
[25] "my_raise"            "mylm"                "myLMBig"            
[28] "myLMSmall"           "nc"                  "nearRcolor"         
[31] "NewLastName"         "nr"                  "ocode"              
[34] "oldpar"              "overlap"             "panel.stackedDens"  
[37] "plotCol"             "r"                   "rotsinc"            
[40] "showCols1"           "showCols2"           "sinc.exp"           
[43] "string"              "tf"                  "x"                  
[46] "x.at"                "y"                   "y.at"               
[49] "z"                   "z0"                  "zi"                 
> dir.create("chapter04")
> dir.create("chapter05")
> source("chapter01\\script1.R")
Error in file(filename, "r", encoding = encoding) : 无法打开链结
此外: Warning message:
In file(filename, "r", encoding = encoding) :
  无法打开文件'script2.R': No such file or directory
> source("\\chapter01\\script1.R")
Error in file(filename, "r", encoding = encoding) : 无法打开链结
此外: Warning message:
In file(filename, "r", encoding = encoding) :
  无法打开文件'\chapter01\script1.R': No such file or directory
> source("\\chapter01\\script1.R")
Error in file(filename, "r", encoding = encoding) : 无法打开链结
此外: Warning message:
In file(filename, "r", encoding = encoding) :
  无法打开文件'\chapter01\script1.R': No such file or directory
> source("chapter01\\script1.R")
Error in file(filename, "r", encoding = encoding) : 无法打开链结
此外: Warning message:
In file(filename, "r", encoding = encoding) :
  无法打开文件'script2.R': No such file or directory
> setwd("\\chapter01")
Error in setwd("\\chapter01") : 无法改变工作目录
> source("chapter01\\script1.R")
> dev.off()
pdf 
  3 
> install.package("vcd")
错误: 没有"install.package"这个函数
> install.packages("vcd")
Warning in install.packages("vcd") :
  'lib="C:/Program Files/R/R-3.3.2/library"'不可写
--- 在此連線階段时请选用CRAN的鏡子 ---
还安装相依关系‘zoo’, ‘colorspace’, ‘lmtest’

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/zoo_1.7-14.zip'
Content type 'application/zip' length 905737 bytes (884 KB)
downloaded 884 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/colorspace_1.3-2.zip'
Content type 'application/zip' length 442050 bytes (431 KB)
downloaded 431 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/lmtest_0.9-35.zip'
Content type 'application/zip' length 288854 bytes (282 KB)
downloaded 282 KB

试开URL’https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib/3.3/vcd_1.4-3.zip'
Content type 'application/zip' length 1266639 bytes (1.2 MB)
downloaded 1.2 MB

程序包‘zoo’打开成功，MD5和检查也通过
程序包‘colorspace’打开成功，MD5和检查也通过
程序包‘lmtest’打开成功，MD5和检查也通过
程序包‘vcd’打开成功，MD5和检查也通过

下载的二进制程序包在
        C:\Users\ghostbear\AppData\Local\Temp\RtmpMPqffR\downloaded_packages里
> help(package="vcd")
starting httpd help server ... 做完了。
> library(vcd)
载入需要的程辑包：grid
Warning message:
程辑包‘vcd’是用R版本3.3.3 来建造的 
> help(Arthritis)
> Arthritis
   ID Treatment    Sex Age Improved
1  57   Treated   Male  27     Some
2  46   Treated   Male  29     None
3  77   Treated   Male  30     None
4  17   Treated   Male  32   Marked
5  36   Treated   Male  46   Marked
6  23   Treated   Male  58   Marked
7  75   Treated   Male  59     None
8  39   Treated   Male  59   Marked
9  33   Treated   Male  63     None
10 55   Treated   Male  63     None
11 30   Treated   Male  64     None
12  5   Treated   Male  64     Some
13 63   Treated   Male  69     None
14 83   Treated   Male  70   Marked
15 66   Treated Female  23     None
16 40   Treated Female  32     None
17  6   Treated Female  37     Some
18  7   Treated Female  41     None
19 72   Treated Female  41   Marked
20 37   Treated Female  48     None
21 82   Treated Female  48   Marked
22 53   Treated Female  55   Marked
23 79   Treated Female  55   Marked
24 26   Treated Female  56   Marked
25 28   Treated Female  57   Marked
26 60   Treated Female  57   Marked
27 22   Treated Female  57   Marked
28 27   Treated Female  58     None
29  2   Treated Female  59   Marked
30 59   Treated Female  59   Marked
31 62   Treated Female  60   Marked
32 84   Treated Female  61   Marked
33 64   Treated Female  62     Some
34 34   Treated Female  62   Marked
35 58   Treated Female  66   Marked
36 13   Treated Female  67   Marked
37 61   Treated Female  68     Some
38 65   Treated Female  68   Marked
39 11   Treated Female  69     None
40 56   Treated Female  69     Some
41 43   Treated Female  70     Some
42  9   Placebo   Male  37     None
43 14   Placebo   Male  44     None
44 73   Placebo   Male  50     None
45 74   Placebo   Male  51     None
46 25   Placebo   Male  52     None
47 18   Placebo   Male  53     None
48 21   Placebo   Male  59     None
49 52   Placebo   Male  59     None
50 45   Placebo   Male  62     None
51 41   Placebo   Male  62     None
52  8   Placebo   Male  63   Marked
53 80   Placebo Female  23     None
54 12   Placebo Female  30     None
55 29   Placebo Female  30     None
56 50   Placebo Female  31     Some
57 38   Placebo Female  32     None
58 35   Placebo Female  33   Marked
59 51   Placebo Female  37     None
60 54   Placebo Female  44     None
61 76   Placebo Female  45     None
62 16   Placebo Female  46     None
63 69   Placebo Female  48     None
64 31   Placebo Female  49     None
65 20   Placebo Female  51     None
66 68   Placebo Female  53     None
67 81   Placebo Female  54     None
68  4   Placebo Female  54     None
69 78   Placebo Female  54   Marked
70 70   Placebo Female  55   Marked
71 49   Placebo Female  57     None
72 10   Placebo Female  57     Some
73 47   Placebo Female  58     Some
74 44   Placebo Female  59     Some
75 24   Placebo Female  59   Marked
76 48   Placebo Female  61     None
77 19   Placebo Female  63     Some
78  3   Placebo Female  64     None
79 67   Placebo Female  65   Marked
80 32   Placebo Female  66     None
81 42   Placebo Female  66     None
82 15   Placebo Female  66     Some
83 71   Placebo Female  68     Some
84  1   Placebo Female  74   Marked
> example(Arthritis)

Arthrt> data("Arthritis")

Arthrt> art <- xtabs(~ Treatment + Improved, data = Arthritis, subset = Sex == "Female")

Arthrt> art
         Improved
Treatment None Some Marked
  Placebo   19    7      6
  Treated    6    5     16

Arthrt> mosaic(art, gp = shading_Friendly)

Arthrt> mosaic(art, gp = shading_max)
> save.image("E:\\Desktop\\R Language\\R\\chapter01\\.RData")
> a <- c("k","j","h","a","c","m")
> a[3]
[1] "h"
> a[2:6]
[1] "j" "h" "a" "c" "m"
> a[c(1,2)]
[1] "k" "j"
> 
> 
> y <- matrix(1:20,nrow=5,ncol=4)
> y
     [,1] [,2] [,3] [,4]
[1,]    1    6   11   16
[2,]    2    7   12   17
[3,]    3    8   13   18
[4,]    4    9   14   19
[5,]    5   10   15   20
> cells <- c(1,26,24,68)
> rnames <- c("R1","R2")
> cnames <- c("C1","C2")
> mymatrix <- matrix(cells, nrows=2,ncols=2,byrow=TRUE,dimnames=list(rnames,cnames))
Error in matrix(cells, nrows = 2, ncols = 2, byrow = TRUE, dimnames = list(rnames,  : 
  参数没有用(nrows = 2, ncols = 2)
> mymatrix <- matrix(cells, nrow=2,ncol=2,byrow=TRUE,dimnames=list(rnames,cnames))
> mymatrix
   C1 C2
R1  1 26
R2 24 68
> mymatrix <- matrix(cells, nrow=2,ncol=2,byrow=FALSE,dimnames=list(rnames,cnames))
> mymatrix
   C1 C2
R1  1 24
R2 26 68
> 
> 
> 
> 
> 
> 
> x <- matrix(1:10,nrow=2)
> x
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    3    5    7    9
[2,]    2    4    6    8   10
> 
> x(2,)
错误: 没有"x"这个函数
> x[2,]
[1]  2  4  6  8 10
> x[,3]
[1] 5 6
> mymatrix[C1]
错误: 找不到对象'C1'
> mymatrix[C1,]
错误: 找不到对象'C1'
> mymatrix["C1",]
Error in mymatrix["C1", ] : 下标出界
> mymatrix["C1"]
[1] NA
> mymatrix[,"C1"]
R1 R2 
 1 26 
> x[1,1]
[1] 1
> x[1,c(4,5)]
[1] 7 9
> 
> 
> 
> 
> #Array
> dim1 <- c("A1","A2")
> dim2 <- c("B1","B2","B3")
> dim3 <- c("C1","C2","C3","C4")
> z <- array(1:24, c(2,3,4),dimnames=list(dim1,dim2,dim3))
> z
, , C1

   B1 B2 B3
A1  1  3  5
A2  2  4  6

, , C2

   B1 B2 B3
A1  7  9 11
A2  8 10 12

, , C3

   B1 B2 B3
A1 13 15 17
A2 14 16 18

, , C4

   B1 B2 B3
A1 19 21 23
A2 20 22 24

> 
> 
> 
> #frame
> patientID <- c(1,2,34)
> age <- c(25,34,28,52)
> diabetes <- c("Type1","Type2","Type1","Type1")
> status <- c("Poor","Improved","Excellent","Poor")
> patientdata <- data.frame(patientID,age,iabetes,status)
Error in data.frame(patientID, age, iabetes, status) : 
  找不到对象'iabetes'
> patientdata <- data.frame(patientID,age,diabetes,status)
Error in data.frame(patientID, age, diabetes, status) : 
  参数值意味着不同的行数: 3, 4


> patientdata <- data.frame(patientID,age,diabetes,status)> > 
> 
> patientdata
错误: 找不到对象'patientdata'
> patientID <- c(1,2,3,4)
> patientdata <- data.frame(patientID,age,diabetes,status)
> patientdata
  patientID age diabetes    status
1         1  25    Type1      Poor
2         2  34    Type2  Improved
3         3  28    Type1 Excellent
4         4  52    Type1      Poor
> 
> patientdata[1:2]
  patientID age
1         1  25
2         2  34
3         3  28
4         4  52
> patientdata("diabetes","status")
错误: 没有"patientdata"这个函数
> patientdata["diabetes","status"]
[1] <NA>
Levels: Excellent Improved Poor
> patientdata[c("diabetes","status")]
  diabetes    status
1    Type1      Poor
2    Type2  Improved
3    Type1 Excellent
4    Type1      Poor
> patientdata$age
[1] 25 34 28 52
> 
> 
> table(patientdata$diabetes,patientdata$status)
       
        Excellent Improved Poor
  Type1         1        0    2
  Type2         0        1    0
> 
> 
> summary(mtcars$mpg)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   10.4    15.4    19.2    20.1    22.8    33.9 
> plot(mtcars$mpg,mtcars$disp)
> dev.off()
pdf 
  4 
> 
> 
> attach(mtcars)
> summary(mpg)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   10.4    15.4    19.2    20.1    22.8    33.9 
> plot(mpg,disp)
> plot(mpg,wt)
> detach(mtcars)
> 
> 
> #with
> with(mtcars,{})
NULL
> 
> with()
Error in eval(substitute(expr), data, enclos = parent.frame()) : 
  缺少参数"data",也没有缺省值
> 
> 
> with(
+ 
+ 
+ 
+ d
+ )
Error in with(d) : 找不到对象'd'
> with(mtcars,{})
NULL
> with(mtcars,{})
NULL
> with(mtcars,{
+ print(summary(mpg))
+ plot(mpg,disp(
+ plot(mpg,wt)
+ })
错误: 意外的'}' in:
"plot(mpg,wt)
}"

> plot(mpg,wt)> 
> with(mtcars,{
+ print(summary(mpg))
+ plot(mpg,disp)
+ plot(mpg,wt)
+ })
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   10.4    15.4    19.2    20.1    22.8    33.9 
> sink()
> summary(mpg)
Error in summary(mpg) : 找不到对象'mpg'
> plot(mtcars$mpg,mtcars$disp)
> 
> 
> 
> #with 变量作用域
> with(macars,{
+ nokeepstats <- summary(mpg)
+ keepstats <<- summary(mpg)
+ })
Error in with(macars, { : 找不到对象'macars'
> with(mtcars,{
+ nokeepstats <- summary(mpg)
+ keepstats <<- summary(mpg)
+ })
> keepstats
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   10.4    15.4    19.2    20.1    22.8    33.9 
> nokeepstats
错误: 找不到对象'nokeepstats'
> 
> 
> #Identifier
> patientdata<-data.frame(patientID,age,diabetes,status,row.names=patientID)
> patientdata
  patientID age diabetes    status
1         1  25    Type1      Poor
2         2  34    Type2  Improved
3         3  28    Type1 Excellent
4         4  52    Type1      Poor
> 
> 
> #factor
> patientID <- c(1,2,3,4)
> age <- c(25,34,28,52)
> diabetes <- c("Type1","Type2","Type1","Type1")
> status <-c("Poor","Improved","Excellent","Poor")
> diabetes <- factor(diabetes)
> satus <-factor(stats,order=TRUE)
Error in factor(stats, order = TRUE) : 找不到对象'stats'
> status <-factor(stats,order=TRUE)
Error in factor(stats, order = TRUE) : 找不到对象'stats'
> status <-factor(status,order=TRUE)
> patientdata<-data.frame(patientID,age,diabetes,status)
> str(patientdata)
'data.frame':   4 obs. of  4 variables:
 $ patientID: num  1 2 3 4
 $ age      : num  25 34 28 52
 $ diabetes : Factor w/ 2 levels "Type1","Type2": 1 2 1 1
 $ status   : Ord.factor w/ 3 levels "Excellent"<"Improved"<..: 3 2 1 3
> summary(patientdata
+ )
   patientID         age        diabetes       status 
 Min.   :1.00   Min.   :25.0   Type1:3   Excellent:1  
 1st Qu.:1.75   1st Qu.:27.2   Type2:1   Improved :1  
 Median :2.50   Median :31.0             Poor     :2  
 Mean   :2.50   Mean   :34.8                          
 3rd Qu.:3.25   3rd Qu.:38.5                          
 Max.   :4.00   Max.   :52.0                          
> patientdata
  patientID age diabetes    status
1         1  25    Type1      Poor
2         2  34    Type2  Improved
3         3  28    Type1 Excellent
4         4  52    Type1      Poor
> 
> 
> 
> 
> #列表
> g<-"My First List"
> h<-c(25,26,18,39)
> j<-matrix(1:10,nrow=5)
> k<-c("one","two","three")
> mylist<-list(title=g,ages=h,j,k)
> myist
错误: 找不到对象'myist'
> mylist
$title
[1] "My First List"

$ages
[1] 25 26 18 39

[[3]]
     [,1] [,2]
[1,]    1    6
[2,]    2    7
[3,]    3    8
[4,]    4    9
[5,]    5   10

[[4]]
[1] "one"   "two"   "three"

> mylist[1]
$title
[1] "My First List"

> mylist[2]
$ages
[1] 25 26 18 39

> mylist["ages"]
$ages
[1] 25 26 18 39

> mylist[c(1,2)]
$title
[1] "My First List"

$ages
[1] 25 26 18 39

> mylist[c(1,2,3)]
$title
[1] "My First List"

$ages
[1] 25 26 18 39

[[3]]
     [,1] [,2]
[1,]    1    6
[2,]    2    7
[3,]    3    8
[4,]    4    9
[5,]    5   10

> mylist[["ages"]]
[1] 25 26 18 39
> 
> 
> 
> #data input
> mydata <- data.frame(age=numeric(0),gender=character(0),weight=numeric(0))
> mydata <- edit(mydata)
Warning message:
In edit.data.frame(mydata) : 在'gender'里加上了因子水准
> save.image("E:\\Desktop\\R Language\\R\\chapter02\\.RData")
> 
