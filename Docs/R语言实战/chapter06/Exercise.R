R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"
Copyright (C) 2016 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> 

> #条形图
> library(vcd)
载入需要的程辑包：grid
Warning message:
程辑包‘vcd’是用R版本3.3.3 来建造的 
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
> counts<-table(Arthritis$Improved)
> counts

  None   Some Marked 
    42     14     28 
> barplot(counts,main="Simple Bar Plot",xlab="Improvement",ylab=""Frequency)
Error: unexpected symbol in "barplot(counts,main="Simple Bar Plot",xlab="Improvement",ylab=""Frequency"
> barplot(counts,main="Simple Bar Plot",xlab="Improvement",ylab="Freqency")
> 
> barplot(counts,main="Horizontal Bar Plot",xlab="Frequency",ylab="Improvement",horiz=TRUE)
> 
> 
> #堆砌条和分组条形图
> library(vcd)
> counts<-table(Arthritis$Improved,Arthritis$Treatment)
> counts
        
         Placebo Treated
  None        29      13
  Some         7       7
  Marked       7      21
> barplot(counts,main="Stacked Bar Plot",xlab="Treatment",ylab="Frequency",col=c("red","yellow","green"),legend=rownames(counts))
> 
> barplot(counts,main="Stacked Bar Plot",xlab="Treatment",ylab="Frequency",col=c("red","yellow","green"),legend=rownames(counts),beside=TRUE)
> 
> 
> 
> #均值条形图
> states<-data.frame(state.region,state.x77)
> states
                state.region Population Income Illiteracy Life.Exp Murder HS.Grad
Alabama                South       3615   3624        2.1    69.05   15.1    41.3
Alaska                  West        365   6315        1.5    69.31   11.3    66.7
Arizona                 West       2212   4530        1.8    70.55    7.8    58.1
Arkansas               South       2110   3378        1.9    70.66   10.1    39.9
California              West      21198   5114        1.1    71.71   10.3    62.6
Colorado                West       2541   4884        0.7    72.06    6.8    63.9
Connecticut        Northeast       3100   5348        1.1    72.48    3.1    56.0
Delaware               South        579   4809        0.9    70.06    6.2    54.6
Florida                South       8277   4815        1.3    70.66   10.7    52.6
Georgia                South       4931   4091        2.0    68.54   13.9    40.6
Hawaii                  West        868   4963        1.9    73.60    6.2    61.9
Idaho                   West        813   4119        0.6    71.87    5.3    59.5
Illinois       North Central      11197   5107        0.9    70.14   10.3    52.6
Indiana        North Central       5313   4458        0.7    70.88    7.1    52.9
Iowa           North Central       2861   4628        0.5    72.56    2.3    59.0
Kansas         North Central       2280   4669        0.6    72.58    4.5    59.9
Kentucky               South       3387   3712        1.6    70.10   10.6    38.5
Louisiana              South       3806   3545        2.8    68.76   13.2    42.2
Maine              Northeast       1058   3694        0.7    70.39    2.7    54.7
Maryland               South       4122   5299        0.9    70.22    8.5    52.3
Massachusetts      Northeast       5814   4755        1.1    71.83    3.3    58.5
Michigan       North Central       9111   4751        0.9    70.63   11.1    52.8
Minnesota      North Central       3921   4675        0.6    72.96    2.3    57.6
Mississippi            South       2341   3098        2.4    68.09   12.5    41.0
Missouri       North Central       4767   4254        0.8    70.69    9.3    48.8
Montana                 West        746   4347        0.6    70.56    5.0    59.2
Nebraska       North Central       1544   4508        0.6    72.60    2.9    59.3
Nevada                  West        590   5149        0.5    69.03   11.5    65.2
New Hampshire      Northeast        812   4281        0.7    71.23    3.3    57.6
New Jersey         Northeast       7333   5237        1.1    70.93    5.2    52.5
New Mexico              West       1144   3601        2.2    70.32    9.7    55.2
New York           Northeast      18076   4903        1.4    70.55   10.9    52.7
North Carolina         South       5441   3875        1.8    69.21   11.1    38.5
North Dakota   North Central        637   5087        0.8    72.78    1.4    50.3
Ohio           North Central      10735   4561        0.8    70.82    7.4    53.2
Oklahoma               South       2715   3983        1.1    71.42    6.4    51.6
Oregon                  West       2284   4660        0.6    72.13    4.2    60.0
Pennsylvania       Northeast      11860   4449        1.0    70.43    6.1    50.2
Rhode Island       Northeast        931   4558        1.3    71.90    2.4    46.4
South Carolina         South       2816   3635        2.3    67.96   11.6    37.8
South Dakota   North Central        681   4167        0.5    72.08    1.7    53.3
Tennessee              South       4173   3821        1.7    70.11   11.0    41.8
Texas                  South      12237   4188        2.2    70.90   12.2    47.4
Utah                    West       1203   4022        0.6    72.90    4.5    67.3
Vermont            Northeast        472   3907        0.6    71.64    5.5    57.1
Virginia               South       4981   4701        1.4    70.08    9.5    47.8
Washington              West       3559   4864        0.6    71.72    4.3    63.5
West Virginia          South       1799   3617        1.4    69.48    6.7    41.6
Wisconsin      North Central       4589   4468        0.7    72.48    3.0    54.5
Wyoming                 West        376   4566        0.6    70.29    6.9    62.9
               Frost   Area
Alabama           20  50708
Alaska           152 566432
Arizona           15 113417
Arkansas          65  51945
California        20 156361
Colorado         166 103766
Connecticut      139   4862
Delaware         103   1982
Florida           11  54090
Georgia           60  58073
Hawaii             0   6425
Idaho            126  82677
Illinois         127  55748
Indiana          122  36097
Iowa             140  55941
Kansas           114  81787
Kentucky          95  39650
Louisiana         12  44930
Maine            161  30920
Maryland         101   9891
Massachusetts    103   7826
Michigan         125  56817
Minnesota        160  79289
Mississippi       50  47296
Missouri         108  68995
Montana          155 145587
Nebraska         139  76483
Nevada           188 109889
New Hampshire    174   9027
New Jersey       115   7521
New Mexico       120 121412
New York          82  47831
North Carolina    80  48798
North Dakota     186  69273
Ohio             124  40975
Oklahoma          82  68782
Oregon            44  96184
Pennsylvania     126  44966
Rhode Island     127   1049
South Carolina    65  30225
South Dakota     172  75955
Tennessee         70  41328
Texas             35 262134
Utah             137  82096
Vermont          168   9267
Virginia          85  39780
Washington        32  66570
West Virginia    100  24070
Wisconsin        149  54464
Wyoming          173  97203
> means<-aggregate(states$Illiteracy,by=list(state.region),FUN=mean)
> means
        Group.1        x
1     Northeast 1.000000
2         South 1.737500
3 North Central 0.700000
4          West 1.023077
> means<-means[order(means$x,)]
Error in order(means$x, ) : argument is missing, with no default
> means<-means[order(means$x),]
> means
        Group.1        x
3 North Central 0.700000
1     Northeast 1.000000
4          West 1.023077
2         South 1.737500
> barplot(means$x,names.arg = means$Group.1)
> title("Mean Illiteracy Rate")
> 
> 
> par(mar=c(5,8,4,2))
> par(las=2)
> counts<-table(Arthritis$Improved)
> barplot(counts,main="Treatment Outcome", horiz=TRUE, cex.name=0.8, names.arg = c("No Improvement","Some Improvement", "Marked Improvement"))
> 
> 
> 
> #荆状图
> library(vcd)
> counts<-table(Treatment,Improved)
Error in table(Treatment, Improved) : object 'Treatment' not found
> attach(Arthritis)
> counts<-table(Treatment,Improved)
> spine(counts,main="Spinogram Example")
> counts
         Improved
Treatment None Some Marked
  Placebo   29    7      7
  Treated   13    7     21
> 
> 
> 
> #饼图
> par(mfrow=c(2,2))
> slices<-c(10,12,4,16,8)
> lbls<-c("US","UK","Australia","Germany","France")
> pie(slices,labels=lbls,main="Simple Pie Chart")
> 
> pct<-round(slices/sum(slices)*100)
> lbls2<-paste(lbls," ",pct,"%",sep="")
> lbls2
[1] "US 20%"       "UK 24%"       "Australia 8%" "Germany 32%"  "France 16%"  
> pie(slices,labels=lbls,explode=0.1,main="3D Pie Chart ")
Warning messages:
1: In text.default(1.1 * P$x, 1.1 * P$y, labels[i], xpd = TRUE, adj = ifelse(P$x <  :
  "explode"不是图形参数
2: In text.default(1.1 * P$x, 1.1 * P$y, labels[i], xpd = TRUE, adj = ifelse(P$x <  :
  "explode"不是图形参数
3: In text.default(1.1 * P$x, 1.1 * P$y, labels[i], xpd = TRUE, adj = ifelse(P$x <  :
  "explode"不是图形参数
4: In text.default(1.1 * P$x, 1.1 * P$y, labels[i], xpd = TRUE, adj = ifelse(P$x <  :
  "explode"不是图形参数
5: In text.default(1.1 * P$x, 1.1 * P$y, labels[i], xpd = TRUE, adj = ifelse(P$x <  :
  "explode"不是图形参数
6: In title(main = main, ...) : "explode"不是图形参数
> pie(slices,labels=lbls2,col=rainbow(length(lbls2)),main="Pie Chart wit Precentage")
There were 18 warnings (use warnings() to see them)
> library(plotrix)
Error in library(plotrix) : 不存在叫‘plotrix’这个名字的程辑包
In addition: There were 18 warnings (use warnings() to see them)
> library(plotrix)
Error in library(plotrix) : 不存在叫‘plotrix’这个名字的程辑包
> install.packages("plotrix")
Installing package into ‘C:/Users/ghostbear/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.3/plotrix_3.6-4.zip'
Content type 'application/zip' length 660914 bytes (645 KB)
downloaded 645 KB

package ‘plotrix’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\ghostbear\AppData\Local\Temp\RtmpeMncLD\downloaded_packages
> 
> library(plotrix)
> pie(slices,labels=lbls,explode=0.1,main="3D Pie Chart ")
Warning messages:
1: In text.default(1.1 * P$x, 1.1 * P$y, labels[i], xpd = TRUE, adj = ifelse(P$x <  :
  "explode"不是图形参数
2: In text.default(1.1 * P$x, 1.1 * P$y, labels[i], xpd = TRUE, adj = ifelse(P$x <  :
  "explode"不是图形参数
3: In text.default(1.1 * P$x, 1.1 * P$y, labels[i], xpd = TRUE, adj = ifelse(P$x <  :
  "explode"不是图形参数
4: In text.default(1.1 * P$x, 1.1 * P$y, labels[i], xpd = TRUE, adj = ifelse(P$x <  :
  "explode"不是图形参数
5: In text.default(1.1 * P$x, 1.1 * P$y, labels[i], xpd = TRUE, adj = ifelse(P$x <  :
  "explode"不是图形参数
6: In title(main = main, ...) : "explode"不是图形参数
> pie3D(slices,labels=lbls,explode=0.1,main="3D Pie Chart ")
There were 36 warnings (use warnings() to see them)
> mytable<-table(state.region)
> lbls3<-paste(names(mytable),"\n",mytable,spe="")
> lbls3
[1] "Northeast \n 9 "      "South \n 16 "         "North Central \n 12 "
[4] "West \n 13 "         
> pie(mytable,labels=lbls3,main="Pie Chart from a Table\n (with sample sizes)")
> pie(mytable,labels=lbls3,main="Pie Chart from a Table\n (with sample sizes)")
> pie(mytable,labels=lbls3,main="Pie Chart from a Table\n (with sample sizes)")
> 
> 
> 
> pie(slices,labels=lbls,main="Simple Pie Chart")
> pie(slices,labels=lbls2,col=rainbow(length(lbls2)),main="Pie Chart wit Precentage")
> pie3D(slices,labels=lbls,explode=0.1,main="3D Pie Chart ")
> pie(mytable,labels=lbls3,main="Pie Chart from a Table\n (with sample sizes)")
> mytable
state.region
    Northeast         South North Central          West 
            9            16            12            13 
> 
> 
> #扇形图
> 
> library(plotrix)
> slices<-c(10,12,4,16,8)
> lbls<-c("US","UK","Australia","Germany","France")
> fan.plot(slices,labels=lbls,main="Fan Plot")
> 
> 
> #直方图
> par(mfrow=c(2,2))
> hist(mtcars$mpg)
> 
> hist(mtcars$mpg,breaks=12,col="red",xlab="Miles Per Gallon",main="Colored histogram with 12 bins")
> 
> 
> hist(mtcars$mpg,freq=FALSE,col="red",xlab="Miles Per Gallon",main="Histogram, rug plot, density curve")
> rug(jitter(mycars$mpg))
Error in jitter(mycars$mpg) : object 'mycars' not found
> rug(jitter(mtcars$mpg))
> lines(density(mtcars$mpg),col="blue",lwd=2)
> 
> 
> x<mtcars$mpg
Error: object 'x' not found
> x<-mtcars$mpg
> h<-hist(x,breaks=12,col="red",xlab="Miles Per Gallon",main="Histogram with normal curve and box")
> xfit<-seq(min(x),max(x),length=40)
> yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
> yfit<-yfit*diff(h$mids[1:2])*length(x)
> lines(xfit,yfit,col="blue",lwd=2)
> box()
> mtcars$mpg
 [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2 10.4 10.4
[17] 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3 19.2 27.3 26.0 30.4 15.8 19.7 15.0 21.4
> mtcars$mpg[order(mtcars$mpg),]
Error in mtcars$mpg[order(mtcars$mpg), ] : incorrect number of dimensions
> mtcars[order(mtcars$mpg),]
                     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
> 
> 
> rug(jitter(mtcars$mpg,amount=0.01))
> 
> 
> 
> #核密度图
> par(mfrow=c(2,1))
> d<-density(mtcars$mpg)
> plot(d)
> d<-density(mtcars$mpg)
> plot(d,main="Kernel Density of Miles Per Gallon")
> polygon(d,col="red",border="blue")
> 
> 
> library(sm)
Error in library(sm) : 不存在叫‘sm’这个名字的程辑包
> install.packages(sm)
Error in install.packages : object 'sm' not found
> install.packages(sm)
Error in install.packages : object 'sm' not found
> install.packages("sm")
Installing package into ‘C:/Users/ghostbear/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.3/sm_2.2-5.4.zip'
Content type 'application/zip' length 781703 bytes (763 KB)
downloaded 763 KB

package ‘sm’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\ghostbear\AppData\Local\Temp\RtmpeMncLD\downloaded_packages
> library(sm)
Package 'sm', version 2.2-5.4: type help(sm) for summary information
Warning message:
程辑包‘sm’是用R版本3.3.3 来建造的 
> attach(mtcars)
> cyl.f<-factor(cyl,levels=c(4,6,8),labels=c("4 cylinder","6 cylinder","8 cylinder"))
> sm.density.compare(mpg,cyl,xlab="Miles Per Gallon")
> cyl
 [1] 6 6 4 6 8 6 8 4 4 6 6 8 8 8 8 8 8 4 4 4 4 8 8 8 8 4 4 4 8 6 8 4
> cyl.f
 [1] 6 cylinder 6 cylinder 4 cylinder 6 cylinder 8 cylinder 6 cylinder 8 cylinder
 [8] 4 cylinder 4 cylinder 6 cylinder 6 cylinder 8 cylinder 8 cylinder 8 cylinder
[15] 8 cylinder 8 cylinder 8 cylinder 4 cylinder 4 cylinder 4 cylinder 4 cylinder
[22] 8 cylinder 8 cylinder 8 cylinder 8 cylinder 4 cylinder 4 cylinder 4 cylinder
[29] 8 cylinder 6 cylinder 8 cylinder 4 cylinder
Levels: 4 cylinder 6 cylinder 8 cylinder
> title(main="MPG Distribution by Car Cylinders")
> 
> colfill<-c(2:(1+length(levels(cyl.f))))
> legend(locator(1),levels(cyl.f),fill=colfill)
> 
> 
> 
> #箱线图
> 
> boxplot(mtcars$mpg,main="Box plot",ylab="Miles per Gallon")
> 
> boxplot(mpg~cyl,data=mtcars,main="Car Mileage Data", xlab="Number of Cylinders",ylab="Miles Per Gallon")
> 
> boxplot(mpg~cyl,data=mtcars,notch=TRUE,varwidth=TRUE,col="red",main="Car Mileage Data",xlab="Number of Cylinders",ylab="Miles Per Gallon")
Warning message:
In bxp(list(stats = c(21.4, 22.8, 26, 30.4, 33.9, 17.8, 18.65, 19.7,  :
  一些槽在折叶点外('box'): 可能是因为notch=FALSE
> par(mfrow=c(1))
Error in par(mfrow = c(1)) : 图形参数"mfrow"的长度不对
> par(mfrow=c(1,1))
> boxplot(mpg~cyl,data=mtcars,notch=TRUE,varwidth=TRUE,col="red",main="Car Mileage Data",xlab="Number of Cylinders",ylab="Miles Per Gallon")
Warning message:
In bxp(list(stats = c(21.4, 22.8, 26, 30.4, 33.9, 17.8, 18.65, 19.7,  :
  一些槽在折叶点外('box'): 可能是因为notch=FALSE
> boxplot(mpg~cyl,data=mtcars,notch=FALSE,varwidth=TRUE,col="red",main="Car Mileage Data",xlab="Number of Cylinders",ylab="Miles Per Gallon")
> boxplot(mpg~cyl,data=mtcars,notch=TRUE,varwidth=TRUE,col="red",main="Car Mileage Data",xlab="Number of Cylinders",ylab="Miles Per Gallon")
Warning message:
In bxp(list(stats = c(21.4, 22.8, 26, 30.4, 33.9, 17.8, 18.65, 19.7,  :
  一些槽在折叶点外('box'): 可能是因为notch=FALSE
> 
> 
> 
> mtcars$cyl.f<-factor(mtcars$cyl,levels=c(4,6,8),labels=c("4","6","8"))
> mtcars$cyl.f
 [1] 6 6 4 6 8 6 8 4 4 6 6 8 8 8 8 8 8 4 4 4 4 8 8 8 8 4 4 4 8 6 8 4
Levels: 4 6 8
> mtcars$am.f<-factor(mtcars$am,levels=c(0,1)labels=c("auto","standard"))
Error: unexpected symbol in "mtcars$am.f<-factor(mtcars$am,levels=c(0,1)labels"
> mtcars$am.f<-factor(mtcars$am,levels=c(0,1),labels=c("auto","standard"))
> mtcars$am.f
 [1] standard standard standard auto     auto     auto     auto     auto     auto    
[10] auto     auto     auto     auto     auto     auto     auto     auto     standard
[19] standard standard auto     auto     auto     auto     auto     standard standard
[28] standard standard standard standard standard
Levels: auto standard
> boxplot(mpg~am.f*cyl.f,data=mtcars,varwidth=TRUE,col=c("gold","darkgreen"),main="MPG Distribution by Auto Type",xlab="Auto Type",ylab="Miles Per Gallon")
> 
> 
> #小提琴图
> library(vioplot)
Error in library(vioplot) : 不存在叫‘vioplot’这个名字的程辑包
> install.packages("vioplot")
Installing package into ‘C:/Users/ghostbear/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.3/vioplot_0.2.zip'
Content type 'application/zip' length 13374 bytes (13 KB)
downloaded 13 KB

package ‘vioplot’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\ghostbear\AppData\Local\Temp\RtmpeMncLD\downloaded_packages
> library(vioplot)
Warning message:
程辑包‘vioplot’是用R版本3.3.3 来建造的 
> x1<-mtcars$mpg[mtcars$cyl==4]
> x2<-mtcars$mpg[mtcars$cyl==6]
> x3<-mtcars$mpg[mtcars$cyl==8]
> vioplot(x1,x2,x3,names=c("4 cyl","6 cyl","8 cyl"),col="gold")
> title("Violin Plots of Miles Per Gallon",ylab="Miles Per Gallon",xlab="Number of Cylinders")
> 
> 
> 
> 
> #点图
> 
> dotchart(mtcars$mpg, labels=row.names(mtcars),cex=.7,main="Gas Mileage for Car Models",xlab="Miles Per Gallon")
> 
> 
> x<-mtcars[order(mtcars$mpg),]
> x$cyl<-factor(x$cyl)
> x$color[x$cyl==4] <- "red"
> x$color[x$cyl==6] <- "blue"
> x$color[x$cyl==8]<- "darkgreen"
> dotchart(x$mpg,labels=row.names(x),cex=.7,groups=x$cyl,gcolor="black",color=x$color,pch=19,main="Gas Mileage for Car Models\ngrouped by cylinder", xlab="Miles Per Gallon")
> x
                     mpg cyl  disp  hp drat    wt  qsec vs am gear carb cyl.f
Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4     8
Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4     8
Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4     8
Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4     8
Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4     8
Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8     8
Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3     8
AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2     8
Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2     8
Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4     8
Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3     8
Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3     8
Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4     6
Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1     6
Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2     8
Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4     6
Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2     8
Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6     6
Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4     6
Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4     6
Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1     6
Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2     4
Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1     4
Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1     4
Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2     4
Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2     4
Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2     4
Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1     4
Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2     4
Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2     4
Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1     4
Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1     4
                        am.f     color
Cadillac Fleetwood      auto darkgreen
Lincoln Continental     auto darkgreen
Camaro Z28              auto darkgreen
Duster 360              auto darkgreen
Chrysler Imperial       auto darkgreen
Maserati Bora       standard darkgreen
Merc 450SLC             auto darkgreen
AMC Javelin             auto darkgreen
Dodge Challenger        auto darkgreen
Ford Pantera L      standard darkgreen
Merc 450SE              auto darkgreen
Merc 450SL              auto darkgreen
Merc 280C               auto      blue
Valiant                 auto      blue
Hornet Sportabout       auto darkgreen
Merc 280                auto      blue
Pontiac Firebird        auto darkgreen
Ferrari Dino        standard      blue
Mazda RX4           standard      blue
Mazda RX4 Wag       standard      blue
Hornet 4 Drive          auto      blue
Volvo 142E          standard       red
Toyota Corona           auto       red
Datsun 710          standard       red
Merc 230                auto       red
Merc 240D               auto       red
Porsche 914-2       standard       red
Fiat X1-9           standard       red
Honda Civic         standard       red
Lotus Europa        standard       red
Fiat 128            standard       red
Toyota Corolla      standard       red
> 