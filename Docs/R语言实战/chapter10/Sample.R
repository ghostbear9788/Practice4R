#T检测 
#计算期望的样本大小
install.packages("pwr")
library(pwr)
pwr.t.test(d=.8,sig.level=.05,power=.9,type="two.sample")

#在固定的样本大小内，结果的正确范围
pwr.t.test(n=20,d=.5,sig.level = .01,type="two.sample")


#方差分析,求期望样本大小
pwr.anova.test(k=5,f=.25,sig.level = .05,power=.8)


#相关性,求期望样本大小
pwr.r.test(r=.25,sig.level = .05,power=.90,alternative = "greater")

#线性模型,求期望样本大小，N-K-1=样本大小
pwr.f2.test(u=3,f2=0.0769,sig.level =0.05,power=0.90)


#比例检测,求期望样本大小
pwr.2p.test(h=ES.h(.65,.6),sig.level = .05,power=.9,alternative = "greater")


#卡方检验,求期望样本大小
prob<-matrix(c(.42,.28,.03,.07,.10,.10),byrow=TRUE,nrow=3)
ES.w2(prob)

pwr.chisq.test(w=ES.w2(prob),df=2,sig.level=.05,power=.9)


#单因素Anova中的检测显著效应所需的样本大小
es<-seq(.1,.5,.01)
nes<-length(es)
 samsize<-NULL
 for(i in 1:nes){
   result<-pwr.anova.test(k=5,f=es[i],sig.level = .05,power=.9)
   samsize[i]<-ceiling(result$n)
 }
 
 plot(samsize,es,type="l",lwd=2,col="red",ylab="Effect Szie", xlab="Sample Szie (per cell)",main="One Way Anova With Power=.90 and Alpha=.05")
   
 
 #综合例子，各种检测方法对应的期望样本空间大小
 
 r<-seq(.1,.5,.01)#在.1和.5之间生成步长为.01的数字序列
 nr<-length(r)
 
 
 p<-seq(.4,.9,.1)
 np<-length(p)
 
 samsize<-array(numeric(nr*np),dim=c(nr,np))
 #samsize
 for(i in 1:np)
 {
   for(j in 1:nr)
   {
     result<-pwr.r.test(n=NULL,r=r[j],sig.level = .05,power = p[i],alternative = "two.sided")
     samsize[j,i]<-ceiling(result$n)
     
     
   }
   
 }
# samsize
 
 xrange<-range(r)
 yrange<-round(range(samsize))
 colors<-rainbow(length(p))
 plot(xrange,yrange,type="n",xlab="Correlation Coefficient (r)",ylab="Sample Size (n)")
 
 for(i in 1:np){
   lines(r,samsize[,i],type="l",lwd=2,col=colors[i])
 }
 
 abline(v=0,h=seq(0,yrange[2],50),lty=2,col="grey89")
 abline(h=0,v=seq(xrange[1],xrange[2],.02),lty=2,col="gray89")
 title("Sample Szie Estimation for Correlation Studies\n")
 legend("topright",title="Power",as.character(p),fill=colors)
