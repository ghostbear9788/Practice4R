 #Summary 函数
> myvars<-c("mpg","hp","wt")
> summary(mtcars[myvars])
      mpg              hp              wt       
 Min.   :10.40   Min.   : 52.0   Min.   :1.513  
 1st Qu.:15.43   1st Qu.: 96.5   1st Qu.:2.581  
 Median :19.20   Median :123.0   Median :3.325  
 Mean   :20.09   Mean   :146.7   Mean   :3.217  
 3rd Qu.:22.80   3rd Qu.:180.0   3rd Qu.:3.610  
 Max.   :33.90   Max.   :335.0   Max.   :5.424  
> 
> 
> mystats
Error: object 'mystats' not found
> mystats<-function(x,na.moit=FALSE){}
> mystats<-function(x,na.moit=FALSE){
+ if(na.omit)
+     x<-x[!is.na(x)]
+ m<-mean(x)
+ n<-length(x)
+ s<-sd(x)
+ skew<-sum((x-m)^3/s^3)/n
+ kurt<-sum((x-m)^4/s^4)/n-3
+ return(c(n=n,mean=m,stdev=s,skew=skew,kurtosis=kurt))
+ }
> myvars<-c("mpg","hp","wt")
> sapply(mtcars[myvars],mystats)
Error in if (na.omit) x <- x[!is.na(x)] : 
  argument is not interpretable as logical
> mycars[myvars]
Error: object 'mycars' not found
> mtcars[myvars]
                     mpg  hp    wt
Mazda RX4           21.0 110 2.620
Mazda RX4 Wag       21.0 110 2.875
Datsun 710          22.8  93 2.320
Hornet 4 Drive      21.4 110 3.215
Hornet Sportabout   18.7 175 3.440
Valiant             18.1 105 3.460
Duster 360          14.3 245 3.570
Merc 240D           24.4  62 3.190
Merc 230            22.8  95 3.150
Merc 280            19.2 123 3.440
Merc 280C           17.8 123 3.440
Merc 450SE          16.4 180 4.070
Merc 450SL          17.3 180 3.730
Merc 450SLC         15.2 180 3.780
Cadillac Fleetwood  10.4 205 5.250
Lincoln Continental 10.4 215 5.424
Chrysler Imperial   14.7 230 5.345
Fiat 128            32.4  66 2.200
Honda Civic         30.4  52 1.615
Toyota Corolla      33.9  65 1.835
Toyota Corona       21.5  97 2.465
Dodge Challenger    15.5 150 3.520
AMC Javelin         15.2 150 3.435
Camaro Z28          13.3 245 3.840
Pontiac Firebird    19.2 175 3.845
Fiat X1-9           27.3  66 1.935
Porsche 914-2       26.0  91 2.140
Lotus Europa        30.4 113 1.513
Ford Pantera L      15.8 264 3.170
Ferrari Dino        19.7 175 2.770
Maserati Bora       15.0 335 3.570
Volvo 142E          21.4 109 2.780
> sapply(mtcars[myvars],mystats)
Error in if (na.omit) x <- x[!is.na(x)] : 
  argument is not interpretable as logical
> mystats<-mystats<-function(x,na.moit=FALSE){
+ if(na.omit){x<-x[!is.na(x)]}
+ m<-mean(x)
+ n<-length(x)
+ s<-sd(x)
+ skew<-sum((x-m)^3/s^3)/n
+ kurt<-sum((x-m)^4/s^4)/n-3
+ return(c(n=n,mean=m,stdev=s,skew=skew,kurtosis=kurt))}
> mystats
function(x,na.moit=FALSE){
if(na.omit){x<-x[!is.na(x)]}
m<-mean(x)
n<-length(x)
s<-sd(x)
skew<-sum((x-m)^3/s^3)/n
kurt<-sum((x-m)^4/s^4)/n-3
return(c(n=n,mean=m,stdev=s,skew=skew,kurtosis=kurt))}
> sapply(mtcars[myvars],mystats)
Error in if (na.omit) { : argument is not interpretable as logical
> mystats<-function(x,na.omit=FALSE){
+      if(na.omit){x<-x[!is.na(x)]}
+      m<-mean(x)
+      n<-length(x)
+      s<-sd(x)
+      skew<-sum((x-m)^3/s^3)/n
+      kurt<-sum((x-m)^4/s^4)/n-3
+      return(c(n=n,mean=m,stdev=s,skew=skew,kurtosis=kurt))}
> sapply(mtcars[myvars],mystats)
               mpg          hp          wt
n        32.000000  32.0000000 32.00000000
mean     20.090625 146.6875000  3.21725000
stdev     6.026948  68.5628685  0.97845744
skew      0.610655   0.7260237  0.42314646
kurtosis -0.372766  -0.1355511 -0.02271075
> mtcars[myvars]
                     mpg  hp    wt
Mazda RX4           21.0 110 2.620
Mazda RX4 Wag       21.0 110 2.875
Datsun 710          22.8  93 2.320
Hornet 4 Drive      21.4 110 3.215
Hornet Sportabout   18.7 175 3.440
Valiant             18.1 105 3.460
Duster 360          14.3 245 3.570
Merc 240D           24.4  62 3.190
Merc 230            22.8  95 3.150
Merc 280            19.2 123 3.440
Merc 280C           17.8 123 3.440
Merc 450SE          16.4 180 4.070
Merc 450SL          17.3 180 3.730
Merc 450SLC         15.2 180 3.780
Cadillac Fleetwood  10.4 205 5.250
Lincoln Continental 10.4 215 5.424
Chrysler Imperial   14.7 230 5.345
Fiat 128            32.4  66 2.200
Honda Civic         30.4  52 1.615
Toyota Corolla      33.9  65 1.835
Toyota Corona       21.5  97 2.465
Dodge Challenger    15.5 150 3.520
AMC Javelin         15.2 150 3.435
Camaro Z28          13.3 245 3.840
Pontiac Firebird    19.2 175 3.845
Fiat X1-9           27.3  66 1.935
Porsche 914-2       26.0  91 2.140
Lotus Europa        30.4 113 1.513
Ford Pantera L      15.8 264 3.170
Ferrari Dino        19.7 175 2.770
Maserati Bora       15.0 335 3.570
Volvo 142E          21.4 109 2.780
> is.na(mtcars[myvars])
                      mpg    hp    wt
Mazda RX4           FALSE FALSE FALSE
Mazda RX4 Wag       FALSE FALSE FALSE
Datsun 710          FALSE FALSE FALSE
Hornet 4 Drive      FALSE FALSE FALSE
Hornet Sportabout   FALSE FALSE FALSE
Valiant             FALSE FALSE FALSE
Duster 360          FALSE FALSE FALSE
Merc 240D           FALSE FALSE FALSE
Merc 230            FALSE FALSE FALSE
Merc 280            FALSE FALSE FALSE
Merc 280C           FALSE FALSE FALSE
Merc 450SE          FALSE FALSE FALSE
Merc 450SL          FALSE FALSE FALSE
Merc 450SLC         FALSE FALSE FALSE
Cadillac Fleetwood  FALSE FALSE FALSE
Lincoln Continental FALSE FALSE FALSE
Chrysler Imperial   FALSE FALSE FALSE
Fiat 128            FALSE FALSE FALSE
Honda Civic         FALSE FALSE FALSE
Toyota Corolla      FALSE FALSE FALSE
Toyota Corona       FALSE FALSE FALSE
Dodge Challenger    FALSE FALSE FALSE
AMC Javelin         FALSE FALSE FALSE
Camaro Z28          FALSE FALSE FALSE
Pontiac Firebird    FALSE FALSE FALSE
Fiat X1-9           FALSE FALSE FALSE
Porsche 914-2       FALSE FALSE FALSE
Lotus Europa        FALSE FALSE FALSE
Ford Pantera L      FALSE FALSE FALSE
Ferrari Dino        FALSE FALSE FALSE
Maserati Bora       FALSE FALSE FALSE
Volvo 142E          FALSE FALSE FALSE
> edit(mtcars[myvars])
                     mpg  hp    wt
Mazda RX4           21.0 110 2.620
Mazda RX4 Wag       21.0 110 2.875
Datsun 710          22.8  93 2.320
Hornet 4 Drive      21.4 110 3.215
Hornet Sportabout   18.7 175 3.440
Valiant             18.1 105 3.460
Duster 360          14.3 245 3.570
Merc 240D           24.4  62 3.190
Merc 230            22.8  95 3.150
Merc 280            19.2 123 3.440
Merc 280C           17.8 123 3.440
Merc 450SE          16.4 180 4.070
Merc 450SL          17.3 180 3.730
Merc 450SLC         15.2 180 3.780
Cadillac Fleetwood  10.4 205 5.250
Lincoln Continental 10.4 215 5.424
Chrysler Imperial   14.7 230 5.345
Fiat 128            32.4  66 2.200
Honda Civic         30.4  52 1.615
Toyota Corolla      33.9  65 1.835
Toyota Corona       21.5  97 2.465
Dodge Challenger    15.5 150 3.520
AMC Javelin         15.2 150 3.435
Camaro Z28          13.3 245 3.840
Pontiac Firebird    19.2 175 3.845
Fiat X1-9             NA  66    NA
Porsche 914-2       26.0  91 2.140
Lotus Europa        30.4 113 1.513
Ford Pantera L      15.8 264 3.170
Ferrari Dino        19.7 175 2.770
Maserati Bora       15.0 335 3.570
Volvo 142E          21.4 109 2.780
> is.na(mtcars[myvars])
                      mpg    hp    wt
Mazda RX4           FALSE FALSE FALSE
Mazda RX4 Wag       FALSE FALSE FALSE
Datsun 710          FALSE FALSE FALSE
Hornet 4 Drive      FALSE FALSE FALSE
Hornet Sportabout   FALSE FALSE FALSE
Valiant             FALSE FALSE FALSE
Duster 360          FALSE FALSE FALSE
Merc 240D           FALSE FALSE FALSE
Merc 230            FALSE FALSE FALSE
Merc 280            FALSE FALSE FALSE
Merc 280C           FALSE FALSE FALSE
Merc 450SE          FALSE FALSE FALSE
Merc 450SL          FALSE FALSE FALSE
Merc 450SLC         FALSE FALSE FALSE
Cadillac Fleetwood  FALSE FALSE FALSE
Lincoln Continental FALSE FALSE FALSE
Chrysler Imperial   FALSE FALSE FALSE
Fiat 128            FALSE FALSE FALSE
Honda Civic         FALSE FALSE FALSE
Toyota Corolla      FALSE FALSE FALSE
Toyota Corona       FALSE FALSE FALSE
Dodge Challenger    FALSE FALSE FALSE
AMC Javelin         FALSE FALSE FALSE
Camaro Z28          FALSE FALSE FALSE
Pontiac Firebird    FALSE FALSE FALSE
Fiat X1-9           FALSE FALSE FALSE
Porsche 914-2       FALSE FALSE FALSE
Lotus Europa        FALSE FALSE FALSE
Ford Pantera L      FALSE FALSE FALSE
Ferrari Dino        FALSE FALSE FALSE
Maserati Bora       FALSE FALSE FALSE
Volvo 142E          FALSE FALSE FALSE
> edit(mtcars[myvars])
                     mpg  hp    wt
Mazda RX4           21.0 110 2.620
Mazda RX4 Wag       21.0 110 2.875
Datsun 710          22.8  93 2.320
Hornet 4 Drive      21.4 110 3.215
Hornet Sportabout   18.7 175 3.440
Valiant             18.1 105 3.460
Duster 360          14.3 245 3.570
Merc 240D           24.4  62 3.190
Merc 230            22.8  95 3.150
Merc 280            19.2 123 3.440
Merc 280C           17.8 123 3.440
Merc 450SE          16.4 180 4.070
Merc 450SL          17.3 180 3.730
Merc 450SLC         15.2 180 3.780
Cadillac Fleetwood  10.4 205 5.250
Lincoln Continental 10.4 215 5.424
Chrysler Imperial   14.7 230 5.345
Fiat 128            32.4  66 2.200
Honda Civic         30.4  52 1.615
Toyota Corolla      33.9  65 1.835
Toyota Corona       21.5  97 2.465
Dodge Challenger    15.5 150 3.520
AMC Javelin         15.2 150 3.435
Camaro Z28          13.3 245 3.840
Pontiac Firebird    19.2 175 3.845
Fiat X1-9           27.3  66 1.935
Porsche 914-2       26.0  91 2.140
Lotus Europa        30.4 113 1.513
Ford Pantera L      15.8 264 3.170
Ferrari Dino        19.7 175 2.770
Maserati Bora       15.0 335 3.570
Volvo 142E            NA 109    NA
> is.na(mtcars[myvars])
                      mpg    hp    wt
Mazda RX4           FALSE FALSE FALSE
Mazda RX4 Wag       FALSE FALSE FALSE
Datsun 710          FALSE FALSE FALSE
Hornet 4 Drive      FALSE FALSE FALSE
Hornet Sportabout   FALSE FALSE FALSE
Valiant             FALSE FALSE FALSE
Duster 360          FALSE FALSE FALSE
Merc 240D           FALSE FALSE FALSE
Merc 230            FALSE FALSE FALSE
Merc 280            FALSE FALSE FALSE
Merc 280C           FALSE FALSE FALSE
Merc 450SE          FALSE FALSE FALSE
Merc 450SL          FALSE FALSE FALSE
Merc 450SLC         FALSE FALSE FALSE
Cadillac Fleetwood  FALSE FALSE FALSE
Lincoln Continental FALSE FALSE FALSE
Chrysler Imperial   FALSE FALSE FALSE
Fiat 128            FALSE FALSE FALSE
Honda Civic         FALSE FALSE FALSE
Toyota Corolla      FALSE FALSE FALSE
Toyota Corona       FALSE FALSE FALSE
Dodge Challenger    FALSE FALSE FALSE
AMC Javelin         FALSE FALSE FALSE
Camaro Z28          FALSE FALSE FALSE
Pontiac Firebird    FALSE FALSE FALSE
Fiat X1-9           FALSE FALSE FALSE
Porsche 914-2       FALSE FALSE FALSE
Lotus Europa        FALSE FALSE FALSE
Ford Pantera L      FALSE FALSE FALSE
Ferrari Dino        FALSE FALSE FALSE
Maserati Bora       FALSE FALSE FALSE
Volvo 142E          FALSE FALSE FALSE
> is.na(edit(mtcars[myvars]))
                      mpg    hp    wt
Mazda RX4           FALSE FALSE FALSE
Mazda RX4 Wag       FALSE FALSE FALSE
Datsun 710          FALSE FALSE FALSE
Hornet 4 Drive      FALSE FALSE FALSE
Hornet Sportabout   FALSE FALSE FALSE
Valiant             FALSE FALSE FALSE
Duster 360          FALSE FALSE FALSE
Merc 240D           FALSE FALSE FALSE
Merc 230            FALSE FALSE FALSE
Merc 280            FALSE FALSE FALSE
Merc 280C           FALSE FALSE FALSE
Merc 450SE          FALSE FALSE FALSE
Merc 450SL          FALSE FALSE FALSE
Merc 450SLC         FALSE FALSE FALSE
Cadillac Fleetwood  FALSE FALSE FALSE
Lincoln Continental FALSE FALSE FALSE
Chrysler Imperial   FALSE FALSE FALSE
Fiat 128            FALSE FALSE FALSE
Honda Civic         FALSE FALSE FALSE
Toyota Corolla      FALSE FALSE FALSE
Toyota Corona       FALSE FALSE FALSE
Dodge Challenger    FALSE FALSE FALSE
AMC Javelin         FALSE FALSE FALSE
Camaro Z28          FALSE FALSE FALSE
Pontiac Firebird    FALSE FALSE FALSE
Fiat X1-9           FALSE FALSE FALSE
Porsche 914-2       FALSE FALSE FALSE
Lotus Europa        FALSE FALSE FALSE
Ford Pantera L      FALSE FALSE FALSE
Ferrari Dino        FALSE FALSE FALSE
Maserati Bora       FALSE FALSE FALSE
Volvo 142E           TRUE FALSE  TRUE
> mycars[!is.na(edit(mtcars[myvars]))]
Error: object 'mycars' not found
> mtcars[!is.na(edit(mtcars[myvars]))]
  [1] "21.0"     "21.0"     "22.8"     "21.4"     "18.7"     "18.1"     "14.3"    
  [8] "24.4"     "22.8"     "19.2"     "17.8"     "16.4"     "17.3"     "15.2"    
 [15] "10.4"     "10.4"     "14.7"     "32.4"     "30.4"     "33.9"     "21.5"    
 [22] "15.5"     "15.2"     "13.3"     "19.2"     "27.3"     "26.0"     "30.4"    
 [29] "15.8"     "19.7"     "15.0"     "6"        "6"        "4"        "6"       
 [36] "8"        "6"        "8"        "4"        "4"        "6"        "6"       
 [43] "8"        "8"        "8"        "8"        "8"        "8"        "4"       
 [50] "4"        "4"        "4"        "8"        "8"        "8"        "8"       
 [57] "4"        "4"        "4"        "8"        "6"        "8"        "4"       
 [64] "160.0"    "160.0"    "108.0"    "258.0"    "360.0"    "225.0"    "360.0"   
 [71] "146.7"    "140.8"    "167.6"    "167.6"    "275.8"    "275.8"    "275.8"   
 [78] "472.0"    "460.0"    "440.0"    " 78.7"    " 75.7"    " 71.1"    "120.1"   
 [85] "318.0"    "304.0"    "350.0"    "400.0"    " 79.0"    "120.3"    " 95.1"   
 [92] "351.0"    "145.0"    "301.0"    "121.0"    "110"      "110"      " 93"     
 [99] "110"      "175"      "105"      "245"      " 62"      " 95"      "123"     
[106] "123"      "180"      "180"      "180"      "205"      "215"      "230"     
[113] " 66"      " 52"      " 65"      " 97"      "150"      "150"      "245"     
[120] "175"      " 66"      " 91"      "113"      "264"      "175"      "335"     
[127] "3.90"     "3.90"     "3.85"     "3.08"     "3.15"     "2.76"     "3.21"    
[134] "3.69"     "3.92"     "3.92"     "3.92"     "3.07"     "3.07"     "3.07"    
[141] "2.93"     "3.00"     "3.23"     "4.08"     "4.93"     "4.22"     "3.70"    
[148] "2.76"     "3.15"     "3.73"     "3.08"     "4.08"     "4.43"     "3.77"    
[155] "4.22"     "3.62"     "3.54"     "4.11"     "2.620"    "2.875"    "2.320"   
[162] "3.215"    "3.440"    "3.460"    "3.570"    "3.190"    "3.150"    "3.440"   
[169] "3.440"    "4.070"    "3.730"    "3.780"    "5.250"    "5.424"    "5.345"   
[176] "2.200"    "1.615"    "1.835"    "2.465"    "3.520"    "3.435"    "3.840"   
[183] "3.845"    "1.935"    "2.140"    "1.513"    "3.170"    "2.770"    "3.570"   
[190] "2.780"    "16.46"    "17.02"    "18.61"    "19.44"    "17.02"    "20.22"   
[197] "15.84"    "20.00"    "22.90"    "18.30"    "18.90"    "17.40"    "17.60"   
[204] "18.00"    "17.98"    "17.82"    "17.42"    "19.47"    "18.52"    "19.90"   
[211] "20.01"    "16.87"    "17.30"    "15.41"    "17.05"    "18.90"    "16.70"   
[218] "16.90"    "14.50"    "15.50"    "14.60"    "0"        "0"        "1"       
[225] "1"        "0"        "1"        "0"        "1"        "1"        "1"       
[232] "1"        "0"        "0"        "0"        "0"        "0"        "0"       
[239] "1"        "1"        "1"        "1"        "0"        "0"        "0"       
[246] "0"        "1"        "0"        "1"        "0"        "0"        "0"       
[253] "1"        "1"        "1"        "1"        "0"        "0"        "0"       
[260] "0"        "0"        "0"        "0"        "0"        "0"        "0"       
[267] "0"        "0"        "0"        "0"        "1"        "1"        "1"       
[274] "0"        "0"        "0"        "0"        "0"        "1"        "1"       
[281] "1"        "1"        "1"        "1"        "1"        "4"        "4"       
[288] "4"        "3"        "3"        "3"        "3"        "4"        "4"       
[295] "4"        "4"        "3"        "3"        "3"        "3"        "3"       
[302] "3"        "4"        "4"        "4"        "3"        "3"        "3"       
[309] "3"        "3"        "4"        "5"        "5"        "5"        "5"       
[316] "5"        "4"        "4"        "1"        "1"        "2"        "1"       
[323] "4"        "2"        "2"        "4"        "4"        "3"        "3"       
[330] "3"        "4"        "4"        "4"        "1"        "2"        "1"       
[337] "1"        "2"        "2"        "4"        "2"        "1"        "2"       
[344] "2"        "4"        "6"        "8"        "2"        "6"        "6"       
[351] "4"        "6"        "8"        "6"        "8"        "4"        "4"       
[358] "6"        "6"        "8"        "8"        "8"        "8"        "8"       
[365] "8"        "4"        "4"        "4"        "4"        "8"        "8"       
[372] "8"        "8"        "4"        "4"        "4"        "8"        "6"       
[379] "8"        "4"        "standard" "standard" "standard" "auto"     "auto"    
[386] "auto"     "auto"     "auto"     "auto"     "auto"     "auto"     "auto"    
[393] "auto"     "auto"     "auto"     "auto"     "auto"     "standard" "standard"
[400] "standard" "auto"     "auto"     "auto"     "auto"     "auto"     "standard"
[407] "standard" "standard" "standard" "standard" "standard"
> testdata<-mtcars[!is.na(edit(mtcars[myvars]))]
> testdata
  [1] "21.0"     "21.0"     "22.8"     "21.4"     "18.7"     "18.1"     "14.3"    
  [8] "24.4"     "22.8"     "19.2"     "17.8"     "16.4"     "17.3"     "15.2"    
 [15] "10.4"     "10.4"     "14.7"     "32.4"     "30.4"     "33.9"     "21.5"    
 [22] "15.5"     "15.2"     "13.3"     "19.2"     "27.3"     "26.0"     "30.4"    
 [29] "15.8"     "19.7"     "15.0"     "6"        "6"        "4"        "6"       
 [36] "8"        "6"        "8"        "4"        "4"        "6"        "6"       
 [43] "8"        "8"        "8"        "8"        "8"        "8"        "4"       
 [50] "4"        "4"        "4"        "8"        "8"        "8"        "8"       
 [57] "4"        "4"        "4"        "8"        "6"        "8"        "4"       
 [64] "160.0"    "160.0"    "108.0"    "258.0"    "360.0"    "225.0"    "360.0"   
 [71] "146.7"    "140.8"    "167.6"    "167.6"    "275.8"    "275.8"    "275.8"   
 [78] "472.0"    "460.0"    "440.0"    " 78.7"    " 75.7"    " 71.1"    "120.1"   
 [85] "318.0"    "304.0"    "350.0"    "400.0"    " 79.0"    "120.3"    " 95.1"   
 [92] "351.0"    "145.0"    "301.0"    "121.0"    "110"      "110"      " 93"     
 [99] "110"      "175"      "105"      "245"      " 62"      " 95"      "123"     
[106] "123"      "180"      "180"      "180"      "205"      "215"      "230"     
[113] " 66"      " 52"      " 65"      " 97"      "150"      "150"      "245"     
[120] "175"      " 66"      " 91"      "113"      "264"      "175"      "335"     
[127] "3.90"     "3.90"     "3.85"     "3.08"     "3.15"     "2.76"     "3.21"    
[134] "3.69"     "3.92"     "3.92"     "3.92"     "3.07"     "3.07"     "3.07"    
[141] "2.93"     "3.00"     "3.23"     "4.08"     "4.93"     "4.22"     "3.70"    
[148] "2.76"     "3.15"     "3.73"     "3.08"     "4.08"     "4.43"     "3.77"    
[155] "4.22"     "3.62"     "3.54"     "4.11"     "2.620"    "2.875"    "2.320"   
[162] "3.215"    "3.440"    "3.460"    "3.570"    "3.190"    "3.150"    "3.440"   
[169] "3.440"    "4.070"    "3.730"    "3.780"    "5.250"    "5.424"    "5.345"   
[176] "2.200"    "1.615"    "1.835"    "2.465"    "3.520"    "3.435"    "3.840"   
[183] "3.845"    "1.935"    "2.140"    "1.513"    "3.170"    "2.770"    "3.570"   
[190] "2.780"    "16.46"    "17.02"    "18.61"    "19.44"    "17.02"    "20.22"   
[197] "15.84"    "20.00"    "22.90"    "18.30"    "18.90"    "17.40"    "17.60"   
[204] "18.00"    "17.98"    "17.82"    "17.42"    "19.47"    "18.52"    "19.90"   
[211] "20.01"    "16.87"    "17.30"    "15.41"    "17.05"    "18.90"    "16.70"   
[218] "16.90"    "14.50"    "15.50"    "14.60"    "0"        "0"        "1"       
[225] "1"        "0"        "1"        "0"        "1"        "1"        "1"       
[232] "1"        "0"        "0"        "0"        "0"        "0"        "0"       
[239] "1"        "1"        "1"        "1"        "0"        "0"        "0"       
[246] "0"        "1"        "0"        "1"        "0"        "0"        "0"       
[253] "1"        "1"        "1"        "1"        "0"        "0"        "0"       
[260] "0"        "0"        "0"        "0"        "0"        "0"        "0"       
[267] "0"        "0"        "0"        "0"        "1"        "1"        "1"       
[274] "0"        "0"        "0"        "0"        "0"        "1"        "1"       
[281] "1"        "1"        "1"        "1"        "1"        "4"        "4"       
[288] "4"        "3"        "3"        "3"        "3"        "4"        "4"       
[295] "4"        "4"        "3"        "3"        "3"        "3"        "3"       
[302] "3"        "4"        "4"        "4"        "3"        "3"        "3"       
[309] "3"        "3"        "4"        "5"        "5"        "5"        "5"       
[316] "5"        "4"        "4"        "1"        "1"        "2"        "1"       
[323] "4"        "2"        "2"        "4"        "4"        "3"        "3"       
[330] "3"        "4"        "4"        "4"        "1"        "2"        "1"       
[337] "1"        "2"        "2"        "4"        "2"        "1"        "2"       
[344] "2"        "4"        "6"        "8"        "2"        "6"        "6"       
[351] "4"        "6"        "8"        "6"        "8"        "4"        "4"       
[358] "6"        "6"        "8"        "8"        "8"        "8"        "8"       
[365] "8"        "4"        "4"        "4"        "4"        "8"        "8"       
[372] "8"        "8"        "4"        "4"        "4"        "8"        "6"       
[379] "8"        "4"        "standard" "standard" "standard" "auto"     "auto"    
[386] "auto"     "auto"     "auto"     "auto"     "auto"     "auto"     "auto"    
[393] "auto"     "auto"     "auto"     "auto"     "auto"     "standard" "standard"
[400] "standard" "auto"     "auto"     "auto"     "auto"     "auto"     "standard"
[407] "standard" "standard" "standard" "standard" "standard"
> testdata[1]
[1] "21.0"
> 
> 
> 
> 
> #hmisc describe 包
> library(Hmisc)
载入需要的程辑包：lattice
载入需要的程辑包：survival
载入需要的程辑包：Formula
载入需要的程辑包：ggplot2

载入程辑包：‘Hmisc’

The following objects are masked from ‘package:base’:

    format.pval, round.POSIXt, trunc.POSIXt, units

Warning messages:
1: 程辑包‘Hmisc’是用R版本3.3.3 来建造的 
2: 程辑包‘survival’是用R版本3.3.3 来建造的 
3: 程辑包‘ggplot2’是用R版本3.3.3 来建造的 
> myvars<-c("mpg","hp","wt")
> describe(mtcars[myvars])
mtcars[myvars] 

 3  Variables      32  Observations
-------------------------------------------------------------------------------------
mpg 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25 
      32        0       25    0.999    20.09    6.796    12.00    14.34    15.43 
     .50      .75      .90      .95 
   19.20    22.80    30.09    31.30 

lowest : 10.4 13.3 14.3 14.7 15.0, highest: 26.0 27.3 30.4 32.4 33.9
-------------------------------------------------------------------------------------
hp 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25 
      32        0       22    0.997    146.7    77.04    63.65    66.00    96.50 
     .50      .75      .90      .95 
  123.00   180.00   243.50   253.55 

lowest :  52  62  65  66  91, highest: 215 230 245 264 335
-------------------------------------------------------------------------------------
wt 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25 
      32        0       29    0.999    3.217    1.089    1.736    1.956    2.581 
     .50      .75      .90      .95 
   3.325    3.610    4.048    5.293 

lowest : 1.513 1.615 1.835 1.935 2.140, highest: 3.845 4.070 5.250 5.345 5.424
-------------------------------------------------------------------------------------
> 
> 
> #pastecs desc
> library(pastecs)
Error in library(pastecs) : 不存在叫‘pastecs’这个名字的程辑包
> install.packages(pastecs)
Error in install.packages : object 'pastecs' not found
> install.packages("pastecs")
Installing package into ‘C:/Users/ghostbear/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.3/pastecs_1.3-18.zip'
Content type 'application/zip' length 1636365 bytes (1.6 MB)
downloaded 1.6 MB

package ‘pastecs’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\ghostbear\AppData\Local\Temp\RtmpwR7ie7\downloaded_packages
> library(pastecs)
载入需要的程辑包：boot

载入程辑包：‘boot’

The following object is masked from ‘package:survival’:

    aml

The following object is masked from ‘package:lattice’:

    melanoma

Warning message:
程辑包‘pastecs’是用R版本3.3.3 来建造的 
> myvars<-c("mpg","hp","wt")
> stat.desc(mtcars[myvars])
                     mpg           hp          wt
nbr.val       32.0000000   32.0000000  32.0000000
nbr.null       0.0000000    0.0000000   0.0000000
nbr.na         0.0000000    0.0000000   0.0000000
min           10.4000000   52.0000000   1.5130000
max           33.9000000  335.0000000   5.4240000
range         23.5000000  283.0000000   3.9110000
sum          642.9000000 4694.0000000 102.9520000
median        19.2000000  123.0000000   3.3250000
mean          20.0906250  146.6875000   3.2172500
SE.mean        1.0654240   12.1203173   0.1729685
CI.mean.0.95   2.1729465   24.7195501   0.3527715
var           36.3241028 4700.8669355   0.9573790
std.dev        6.0269481   68.5628685   0.9784574
coef.var       0.2999881    0.4674077   0.3041285
> 
> 
> 
> 
> #psych describe
> library(psych)
Error in library(psych) : 不存在叫‘psych’这个名字的程辑包
> install.packages("psych")
Installing package into ‘C:/Users/ghostbear/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
also installing the dependency ‘mnormt’

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.3/mnormt_1.5-5.zip'
Content type 'application/zip' length 101019 bytes (98 KB)
downloaded 98 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.3/psych_1.7.3.21.zip'
Content type 'application/zip' length 4418187 bytes (4.2 MB)
downloaded 4.2 MB

package ‘mnormt’ successfully unpacked and MD5 sums checked
package ‘psych’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\ghostbear\AppData\Local\Temp\RtmpwR7ie7\downloaded_packages
> library(psych)

载入程辑包：‘psych’

The following object is masked from ‘package:boot’:

    logit

The following object is masked from ‘package:Hmisc’:

    describe

The following objects are masked from ‘package:ggplot2’:

    %+%, alpha

Warning message:
程辑包‘psych’是用R版本3.3.3 来建造的 
> describe(mtcars[myvars])
    vars  n   mean    sd median trimmed   mad   min    max  range skew kurtosis
mpg    1 32  20.09  6.03  19.20   19.70  5.41 10.40  33.90  23.50 0.61    -0.37
hp     2 32 146.69 68.56 123.00  141.19 77.10 52.00 335.00 283.00 0.73    -0.14
wt     3 32   3.22  0.98   3.33    3.15  0.77  1.51   5.42   3.91 0.42    -0.02
       se
mpg  1.07
hp  12.12
wt   0.17
> 
> 
> #调用同名函数
> Hmisc::describe(mtcars[myvars])
mtcars[myvars] 

 3  Variables      32  Observations
-------------------------------------------------------------------------------------
mpg 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25 
      32        0       25    0.999    20.09    6.796    12.00    14.34    15.43 
     .50      .75      .90      .95 
   19.20    22.80    30.09    31.30 

lowest : 10.4 13.3 14.3 14.7 15.0, highest: 26.0 27.3 30.4 32.4 33.9
-------------------------------------------------------------------------------------
hp 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25 
      32        0       22    0.997    146.7    77.04    63.65    66.00    96.50 
     .50      .75      .90      .95 
  123.00   180.00   243.50   253.55 

lowest :  52  62  65  66  91, highest: 215 230 245 264 335
-------------------------------------------------------------------------------------
wt 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25 
      32        0       29    0.999    3.217    1.089    1.736    1.956    2.581 
     .50      .75      .90      .95 
   3.325    3.610    4.048    5.293 

lowest : 1.513 1.615 1.835 1.935 2.140, highest: 3.845 4.070 5.250 5.345 5.424
-------------------------------------------------------------------------------------
> 
> 
> 
> 
> #分组
> mtcars$am
 [1] 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 1 1 1 1 1 1 1
> help("aggregate")
> 
> 
> aggregate(mtcars[myvars],by=list(am=mtcars$am),mean)
  am      mpg       hp       wt
1  0 17.14737 160.2632 3.768895
2  1 24.39231 126.8462 2.411000
> aggregate(mtcars[myvars],by=list(am=mtcars$am),sd)
  am      mpg       hp        wt
1  0 3.833966 53.90820 0.7774001
2  1 6.166504 84.06232 0.6169816
> 
> 
> dstats<-function(x)sapply(x,mystats)
> by(mtcars[myvars],mtcars$am,dstats)
mtcars$am: 0
                 mpg           hp         wt
n        19.00000000  19.00000000 19.0000000
mean     17.14736842 160.26315789  3.7688947
stdev     3.83396639  53.90819573  0.7774001
skew      0.01395038  -0.01422519  0.9759294
kurtosis -0.80317826  -1.20969733  0.1415676
--------------------------------------------------------------- 
mtcars$am: 1
                 mpg          hp         wt
n        13.00000000  13.0000000 13.0000000
mean     24.39230769 126.8461538  2.4110000
stdev     6.16650381  84.0623243  0.6169816
skew      0.05256118   1.3598859  0.2103128
kurtosis -1.45535200   0.5634635 -1.1737358
> 
> 
> #doBy summaryBy
> library(doBy)
Error in library(doBy) : 不存在叫‘doBy’这个名字的程辑包
> install.packages("doBy")
Installing package into ‘C:/Users/ghostbear/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.3/doBy_4.5-15.zip'
Content type 'application/zip' length 3352248 bytes (3.2 MB)
downloaded 3.2 MB

package ‘doBy’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\ghostbear\AppData\Local\Temp\RtmpwR7ie7\downloaded_packages
> library(doBy)
Warning message:
程辑包‘doBy’是用R版本3.3.3 来建造的 
> summaryBy(mpg+hp+wt~am,data=mtcars,FUN=mystats)
  am mpg.n mpg.mean mpg.stdev   mpg.skew mpg.kurtosis hp.n  hp.mean hp.stdev
1  0    19 17.14737  3.833966 0.01395038   -0.8031783   19 160.2632 53.90820
2  1    13 24.39231  6.166504 0.05256118   -1.4553520   13 126.8462 84.06232
      hp.skew hp.kurtosis wt.n  wt.mean  wt.stdev   wt.skew wt.kurtosis
1 -0.01422519  -1.2096973   19 3.768895 0.7774001 0.9759294   0.1415676
2  1.35988586   0.5634635   13 2.411000 0.6169816 0.2103128  -1.1737358
> 
> 
> #psych describeBy
> library("psych")
> describeBy(mtcars[myvars],list(am=mtcars$am))

 Descriptive statistics by group 
am: 0
    vars  n   mean    sd median trimmed   mad   min    max  range  skew kurtosis
mpg    1 19  17.15  3.83  17.30   17.12  3.11 10.40  24.40  14.00  0.01    -0.80
hp     2 19 160.26 53.91 175.00  161.06 77.10 62.00 245.00 183.00 -0.01    -1.21
wt     3 19   3.77  0.78   3.52    3.75  0.45  2.46   5.42   2.96  0.98     0.14
       se
mpg  0.88
hp  12.37
wt   0.18
--------------------------------------------------------------- 
am: 1
    vars  n   mean    sd median trimmed   mad   min    max  range skew kurtosis
mpg    1 13  24.39  6.17  22.80   24.38  6.67 15.00  33.90  18.90 0.05    -1.46
hp     2 13 126.85 84.06 109.00  114.73 63.75 52.00 335.00 283.00 1.36     0.56
wt     3 13   2.41  0.62   2.32    2.39  0.68  1.51   3.57   2.06 0.21    -1.17
       se
mpg  1.71
hp  23.31
wt   0.17
> 
> 
> 
> 
> 
> #频数表
> #table, xtabs, prop.table, margin.table, addmargins, ftable
> library(vcd)
载入需要的程辑包：grid
Warning message:
程辑包‘vcd’是用R版本3.3.3 来建造的 
> attach(Arthritis)
> mytable<-table(Improved)
> mytable
Improved
  None   Some Marked 
    42     14     28 
> 
> #百分比形式
> prop.table(Improved)
Error in Summary.ordered(c(2L, 1L, 1L, 3L, 3L, 3L, 1L, 3L, 1L, 1L, 1L,  : 
  'sum'对順序化的因子没有意义
> prop.table(mytable)
Improved
     None      Some    Marked 
0.5000000 0.1666667 0.3333333 
> 
> #二维列联表
> mytable<-xtabs(~Treatment+Improved, data=Arthritis)
> mytable
         Improved
Treatment None Some Marked
  Placebo   29    7      7
  Treated   13    7     21
> 
> 
> 
> #cross table
> library(gmodels)
Error in library(gmodels) : 不存在叫‘gmodels’这个名字的程辑包
> install.packages("gmodels")
Installing package into ‘C:/Users/ghostbear/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
also installing the dependencies ‘gtools’, ‘gdata’

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.3/gtools_3.5.0.zip'
Content type 'application/zip' length 144033 bytes (140 KB)
downloaded 140 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.3/gdata_2.17.0.zip'
Content type 'application/zip' length 1178172 bytes (1.1 MB)
downloaded 1.1 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.3/gmodels_2.16.2.zip'
Content type 'application/zip' length 73924 bytes (72 KB)
downloaded 72 KB

package ‘gtools’ successfully unpacked and MD5 sums checked
package ‘gdata’ successfully unpacked and MD5 sums checked
package ‘gmodels’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\ghostbear\AppData\Local\Temp\RtmpwR7ie7\downloaded_packages
> library(gmodels)
Warning message:
程辑包‘gmodels’是用R版本3.3.3 来建造的 
> CrossTable(Arthritis$Treatment,Arthritis$Improved)

 
   Cell Contents
|-------------------------|
|                       N |
| Chi-square contribution |
|           N / Row Total |
|           N / Col Total |
|         N / Table Total |
|-------------------------|

 
Total Observations in Table:  84 

 
                    | Arthritis$Improved 
Arthritis$Treatment |      None |      Some |    Marked | Row Total | 
--------------------|-----------|-----------|-----------|-----------|
            Placebo |        29 |         7 |         7 |        43 | 
                    |     2.616 |     0.004 |     3.752 |           | 
                    |     0.674 |     0.163 |     0.163 |     0.512 | 
                    |     0.690 |     0.500 |     0.250 |           | 
                    |     0.345 |     0.083 |     0.083 |           | 
--------------------|-----------|-----------|-----------|-----------|
            Treated |        13 |         7 |        21 |        41 | 
                    |     2.744 |     0.004 |     3.935 |           | 
                    |     0.317 |     0.171 |     0.512 |     0.488 | 
                    |     0.310 |     0.500 |     0.750 |           | 
                    |     0.155 |     0.083 |     0.250 |           | 
--------------------|-----------|-----------|-----------|-----------|
       Column Total |        42 |        14 |        28 |        84 | 
                    |     0.500 |     0.167 |     0.333 |           | 
--------------------|-----------|-----------|-----------|-----------|

 
> 
> 
> #多维列联表
> mytable<-xtab(~Treatment+Sex+Improved,data=Arthritis)
Error: could not find function "xtab"
> mytable<-xtabs(~Treatment+Sex+Improved,data=Arthritis)
> mytable
, , Improved = None

         Sex
Treatment Female Male
  Placebo     19   10
  Treated      6    7

, , Improved = Some

         Sex
Treatment Female Male
  Placebo      7    0
  Treated      5    2

, , Improved = Marked

         Sex
Treatment Female Male
  Placebo      6    1
  Treated     16    5

> ftable(mytable)
                 Improved None Some Marked
Treatment Sex                             
Placebo   Female            19    7      6
          Male              10    0      1
Treated   Female             6    5     16
          Male               7    2      5
> 
> margin.table(mytable,1)
Treatment
Placebo Treated 
     43      41 
> margin.table(mytable,2)
Sex
Female   Male 
    59     25 
> margin.table(mytable,3)
Improved
  None   Some Marked 
    42     14     28 
> margin.table(mytable,c(1,3))
         Improved
Treatment None Some Marked
  Placebo   29    7      7
  Treated   13    7     21
> ftable(prop.table(mytable,c(1,2)))
                 Improved       None       Some     Marked
Treatment Sex                                             
Placebo   Female          0.59375000 0.21875000 0.18750000
          Male            0.90909091 0.00000000 0.09090909
Treated   Female          0.22222222 0.18518519 0.59259259
          Male            0.50000000 0.14285714 0.35714286
> 
> 
> ftable(addmargins(prop.table(mytable,c(1,2)),3))
                 Improved       None       Some     Marked        Sum
Treatment Sex                                                        
Placebo   Female          0.59375000 0.21875000 0.18750000 1.00000000
          Male            0.90909091 0.00000000 0.09090909 1.00000000
Treated   Female          0.22222222 0.18518519 0.59259259 1.00000000
          Male            0.50000000 0.14285714 0.35714286 1.00000000
> help(addmargins)
> #addmargins 求和
> ftable(addmargins(prop.table(mytable,c(1,2)),3))*100
                 Improved       None       Some     Marked        Sum
Treatment Sex                                                        
Placebo   Female           59.375000  21.875000  18.750000 100.000000
          Male             90.909091   0.000000   9.090909 100.000000
Treated   Female           22.222222  18.518519  59.259259 100.000000
          Male             50.000000  14.285714  35.714286 100.000000
		  
		  
		  
		  
 #独立性检验
> 
> 
> #卡方独立性检验
> library(vcd)
> mytable<-xtabs(~Treatment+Improved,data=Arthritis)
> chisq.test(mytable)

	Pearson's Chi-squared test

data:  mytable
X-squared = 13.055, df = 2, p-value = 0.001463

> 
> 
> mytable<-xtabs(~Improved+Sex,dat=Arthritis)
> chisq.test(mytable)

	Pearson's Chi-squared test

data:  mytable
X-squared = 4.8407, df = 2, p-value = 0.08889

Warning message:
In chisq.test(mytable) : Chi-squared近似算法有可能不准
> 
> 
> 
> 
> 
> #fisher
> mytable<-xtabs(~Treatment+Improved,data=Arthritis)
> fisher.test(mytable)

	Fisher's Exact Test for Count Data

data:  mytable
p-value = 0.001393
alternative hypothesis: two.sided

> 
> 
> #mantelhaen
> mytable<-xtabs(~Treatment+Improved+Sex,data=Arthritis)
> mantelhaen.test(mytable)

	Cochran-Mantel-Haenszel test

data:  mytable
Cochran-Mantel-Haenszel M^2 = 14.632, df = 2, p-value = 0.0006647

> #associate
> library(vcd)
> mytable<-xtabs(~Treatment+Improved,data=Arthritis)
> associate(mytable)
Error: could not find function "associate"
> associates(mytable)
Error: could not find function "associates"
> assocstats(mytable)
                    X^2 df  P(> X^2)
Likelihood Ratio 13.530  2 0.0011536
Pearson          13.055  2 0.0014626

Phi-Coefficient   : NA 
Contingency Coeff.: 0.367 
Cramer's V        : 0.394 
> 
> 
> 
> 
> 
> #相关
> states<-state.x77[,1:6]
> cov(states)
              Population      Income   Illiteracy     Life Exp      Murder
Population 19931683.7588 571229.7796  292.8679592 -407.8424612 5663.523714
Income       571229.7796 377573.3061 -163.7020408  280.6631837 -521.894286
Illiteracy      292.8680   -163.7020    0.3715306   -0.4815122    1.581776
Life Exp       -407.8425    280.6632   -0.4815122    1.8020204   -3.869480
Murder         5663.5237   -521.8943    1.5817755   -3.8694804   13.627465
HS Grad       -3551.5096   3076.7690   -3.2354694    6.3126849  -14.549616
                HS Grad
Population -3551.509551
Income      3076.768980
Illiteracy    -3.235469
Life Exp       6.312685
Murder       -14.549616
HS Grad       65.237894
> 
> cor(states)
            Population     Income Illiteracy    Life Exp     Murder     HS Grad
Population  1.00000000  0.2082276  0.1076224 -0.06805195  0.3436428 -0.09848975
Income      0.20822756  1.0000000 -0.4370752  0.34025534 -0.2300776  0.61993232
Illiteracy  0.10762237 -0.4370752  1.0000000 -0.58847793  0.7029752 -0.65718861
Life Exp   -0.06805195  0.3402553 -0.5884779  1.00000000 -0.7808458  0.58221620
Murder      0.34364275 -0.2300776  0.7029752 -0.78084575  1.0000000 -0.48797102
HS Grad    -0.09848975  0.6199323 -0.6571886  0.58221620 -0.4879710  1.00000000
> 
> cor(states,method="spearman")
           Population     Income Illiteracy   Life Exp     Murder    HS Grad
Population  1.0000000  0.1246098  0.3130496 -0.1040171  0.3457401 -0.3833649
Income      0.1246098  1.0000000 -0.3145948  0.3241050 -0.2174623  0.5104809
Illiteracy  0.3130496 -0.3145948  1.0000000 -0.5553735  0.6723592 -0.6545396
Life Exp   -0.1040171  0.3241050 -0.5553735  1.0000000 -0.7802406  0.5239410
Murder      0.3457401 -0.2174623  0.6723592 -0.7802406  1.0000000 -0.4367330
HS Grad    -0.3833649  0.5104809 -0.6545396  0.5239410 -0.4367330  1.0000000
> 
> 
> x<- states[,c("Population","InCome","HS Grad")]
Error in states[, c("Population", "InCome", "HS Grad")] : 
  subscript out of bounds
> x<- states[,c("Population","InCome","Illiteracy", "HS Grad")]
Error in states[, c("Population", "InCome", "Illiteracy", "HS Grad")] : 
  subscript out of bounds
> head(states)
           Population Income Illiteracy Life Exp Murder HS Grad
Alabama          3615   3624        2.1    69.05   15.1    41.3
Alaska            365   6315        1.5    69.31   11.3    66.7
Arizona          2212   4530        1.8    70.55    7.8    58.1
Arkansas         2110   3378        1.9    70.66   10.1    39.9
California      21198   5114        1.1    71.71   10.3    62.6
Colorado         2541   4884        0.7    72.06    6.8    63.9
> x<-states[,1]
> x
       Alabama         Alaska        Arizona       Arkansas     California 
          3615            365           2212           2110          21198 
      Colorado    Connecticut       Delaware        Florida        Georgia 
          2541           3100            579           8277           4931 
        Hawaii          Idaho       Illinois        Indiana           Iowa 
           868            813          11197           5313           2861 
        Kansas       Kentucky      Louisiana          Maine       Maryland 
          2280           3387           3806           1058           4122 
 Massachusetts       Michigan      Minnesota    Mississippi       Missouri 
          5814           9111           3921           2341           4767 
       Montana       Nebraska         Nevada  New Hampshire     New Jersey 
           746           1544            590            812           7333 
    New Mexico       New York North Carolina   North Dakota           Ohio 
          1144          18076           5441            637          10735 
      Oklahoma         Oregon   Pennsylvania   Rhode Island South Carolina 
          2715           2284          11860            931           2816 
  South Dakota      Tennessee          Texas           Utah        Vermont 
           681           4173          12237           1203            472 
      Virginia     Washington  West Virginia      Wisconsin        Wyoming 
          4981           3559           1799           4589            376 
> x<-states[,c("Population","Income","Illiteracy","HS Grad")]
> y<-states[,c("Life Exp","Murder")]
> cor(x,y)
              Life Exp     Murder
Population -0.06805195  0.3436428
Income      0.34025534 -0.2300776
Illiteracy -0.58847793  0.7029752
HS Grad     0.58221620 -0.4879710
> 
> 
> 
> 
> #偏相关
> install.packages("ggm")

程辑包‘ggm’是用R版本3.3.3 来建造的 
> colnames(states)
[1] "Population" "Income"     "Illiteracy" "Life Exp"   "Murder"     "HS Grad"   
> pcor(c(1,5,2,3,6),cov(states))
[1] 0.3462724
> 
> 
> #相关性的显著性验证
> cor.test(states[,3],states[,5])

	Pearson's product-moment correlation

data:  states[, 3] and states[, 5]
t = 6.8479, df = 48, p-value = 1.258e-08
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.5279280 0.8207295
sample estimates:
      cor 
0.7029752 

> 
> 
> #多变量验证
> library(psych)
> corr.test(states,use="complete")
Call:corr.test(x = states, use = "complete")
Correlation matrix 
           Population Income Illiteracy Life Exp Murder HS Grad
Population       1.00   0.21       0.11    -0.07   0.34   -0.10
Income           0.21   1.00      -0.44     0.34  -0.23    0.62
Illiteracy       0.11  -0.44       1.00    -0.59   0.70   -0.66
Life Exp        -0.07   0.34      -0.59     1.00  -0.78    0.58
Murder           0.34  -0.23       0.70    -0.78   1.00   -0.49
HS Grad         -0.10   0.62      -0.66     0.58  -0.49    1.00
Sample Size 
[1] 50
Probability values (Entries above the diagonal are adjusted for multiple tests.) 
           Population Income Illiteracy Life Exp Murder HS Grad
Population       0.00   0.59       1.00      1.0   0.10       1
Income           0.15   0.00       0.01      0.1   0.54       0
Illiteracy       0.46   0.00       0.00      0.0   0.00       0
Life Exp         0.64   0.02       0.00      0.0   0.00       0
Murder           0.01   0.11       0.00      0.0   0.00       0
HS Grad          0.50   0.00       0.00      0.0   0.00       0

 To see confidence intervals of the correlations, print with the short=FALSE option
> 
> 
> 
> 
> #T检验
> #测试在美国南部和北部犯罪后被关进监狱的概率
> library(MASS)
> t.test(Prob~So, data=UScrime)

	Welch Two Sample t-test

data:  Prob by So
t = -3.8954, df = 24.925, p-value = 0.0006506
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -0.03852569 -0.01187439
sample estimates:
mean in group 0 mean in group 1 
     0.03851265      0.06371269 

> 
> library(MASS)
> sapply(UCcrime[c("U1","U2")], function(x){c(mean=mean(x),sd=sd(X))})
Error in lapply(X = X, FUN = FUN, ...) : object 'UCcrime' not found
> sapply(UScrime[c("U1","U2")], function(x){c(mean=mean(x),sd=sd(X))})
 Show Traceback
 
 Rerun with Debug
 Error in is.data.frame(x) : object 'X' not found > attach(UScrime)
The following object is masked _by_ .GlobalEnv:

    y

> sapply(UScrime[c("U1","U2")], function(x){c(mean=mean(x),sd=sd(X))})
 Show Traceback
 
 Rerun with Debug
 Error in is.data.frame(x) : object 'X' not found > head(UScrime)
    M So  Ed Po1 Po2  LF  M.F Pop  NW  U1 U2 GDP Ineq     Prob    Time    y
1 151  1  91  58  56 510  950  33 301 108 41 394  261 0.084602 26.2011  791
2 143  0 113 103  95 583 1012  13 102  96 36 557  194 0.029599 25.2999 1635
3 142  1  89  45  44 533  969  18 219  94 33 318  250 0.083401 24.3006  578
4 136  0 121 149 141 577  994 157  80 102 39 673  167 0.015801 29.9012 1969
5 141  0 121 109 101 591  985  18  30  91 20 578  174 0.041399 21.2998 1234
6 121  0 110 118 115 547  964  25  44  84 29 689  126 0.034201 20.9995  682
> sapply(UScrime[c("U1","U2")], function(x)(c(mean=mean(x),sd=sd(X)))
+ )
 Show Traceback
 
 Rerun with Debug
 Error in is.data.frame(x) : object 'X' not found > 
> 
> library(MASS)
> sapply(UScrime[c("U1","U2")],function(x)(c(mean=mean(x),sd=sd(x))))
           U1       U2
mean 95.46809 33.97872
sd   18.02878  8.44545
> 
> 
> with(UScrime,t.test(U1,U2,paired=TRUE))

	Paired t-test

data:  U1 and U2
t = 32.407, df = 46, p-value < 2.2e-16
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 57.67003 65.30870
sample estimates:
mean of the differences 
               61.48936 

> 
> 
> 
> #两组差异的非参数检验
> states<-data.frame(state.region,state.x77)
> kruskal.test(Illiteracy~state.region,data=states)

	Kruskal-Wallis rank sum test

data:  Illiteracy by state.region
Kruskal-Wallis chi-squared = 22.672, df = 3, p-value = 4.726e-05
		  