#生成时间序列对象
sales<-c(18,33,41,7,34,35,24,25,24,21,25,20,22,31,40,29,25,21,22,54,31,25,26,35)
tsales<-ts(sales,start=c(2003,1),frequency = 12)
tsales

plot(tsales)
start(tsales)

end(tsales)
frequency(tsales)
tsales.subset<-window(tsales,start=c(2003,5),end=c(2004,6))
tsales.subset

#简单移动平均
install.packages("forecast")
library(forecast)
opar<-par(no.readonly=TRUE)
par(mfrow=c(2,2))
ylim<-c(min(Nile),max(Nile))
plot(Nile,main="Raw time series")
plot(ma(Nile,3),main="Simple Moving Average (k=3)",ylim=ylim)
plot(ma(Nile,7),main="Simple Moving Average (k=7)",ylim=ylim)
plot(ma(Nile,15),main="Simple Moving Average (k=15)",ylim=ylim)
par(opar)


#季节性分解
plot(AirPassengers)
lAirPassengers<-log(AirPassengers)
plot(lAirPassengers,ylab="log(AirPassengers)")

fit<-stl(lAirPassengers,s.window="period")
plot(fit)

fit$time.series
exp(fit$time.series)


par(mfrow=c(2,1))
library(forecast)
monthplot(AirPassengers,xlab="",ylab="")
seasonplot(AirPassengers,year.labels="TRUE",main="")

#单指数平滑
library(forecast)
fit<-ets(nhtemp,model="ANN")
fit

forecast(fit,1)

plot(forecast(fit,1),xlab="Year",ylab=expression(paste("Temperature (",degreee*F,")",)),main="New Haven Annual Mean Temperature")
accuracy(fit)


#有水平项，斜率以及季节性的指数模型
library(forecast)
fit<-ets(log(AirPassengers),model="AAA")
fit

accuracy(fit)

pred<-forecast(fit,5)
pred

plot(pred,main="Forecast for Air Travel",ylab="Log(AirePassengers)",xlab="Time")
pred$mean<-exp(pred$mean)
pred$lower<-exp(pred$lower)
pred$upper<-exp(pred$upper)
p<-cbind(pred$mean,pred$lower,pred$upper)
dimnames(p)[[2]]<-c("mean","Lo 80","Lo 95","Hi 80","Hi 95")
p


#ETS函数的自动指数预测
library(forecast)
fit<-ets(JohnsonJohnson)
fit

plot(forecast(fit),main="Johnson & Johnson Forecasts",ylab="Quarterly Earnings (Dollars)",xlab="Time",flty=2)

#序列的变换以及稳定性评估
library(forecast)
library(tseries)
plot(Nile)
ndiffs(Nile)

dNile<-diff(Nile)
plot(dNile)
adf.test(dNile)

#拟合ARIMA模型
library(forecast)
fit<-arima(Nile,order=c(0,1,1))
fit

accuracy(fit)

#模型评价
qqnorm(fit$residuals)
qqline(fit$residuals)
Box.test(fit$residuals,type="Ljung-Box")

#ARIMA 模型预测
forecast(fit,3)
plot(forecast(fit,3),xlab="Year",ylab="Annual Flow")


#ARIMA自动预测
library(forecast)
fit<-auto.arima(sunspots)
fit

forecast(fit,3)
accuracy(fit)

