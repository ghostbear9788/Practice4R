#聚类分析
par(mfrow=c(1,1))
#计算距离
install.packages("flexclust")
data(nutrient,package="flexclust")
head(nutrient,4)

d<-dist(nutrient)
as.matrix(d)[1:4,1:4]

#层次聚类分析
par(nfrow=c(1,1))
data(nutrient,package="flexclust")
row.names(nutrient)<-tolower(row.names(nutrient))
nutrient.scaled<-scale(nutrient)

d<-dist(nutrient.scaled)

fit.average<-hclust(d,method="average")
plot(fit.average,hang=-1,cex=.8,main="Average Linkage Clustering")

#选择聚类的个数
install.packages("NbClust")
library(NbClust)
devAskNewPage(ask=TRUE)
nc<-NbClust(nutrient.scaled,distance="euclidean",min.nc=2,max.nc=15,method="average")
table(nc$Best.n[1,])

barplot(table(nc$Best.n[1,]),xlab="Number of Clusters",ylab="Number of Criteria",main="Number of Clusters Chosen by 26 Criteria")


#获取最终的聚类方案
par(mfrow=c(1,1))

clusters<-cutree(fit.average,k=5)
table(clusters)

aggregate(nutrient,by=list(cluster=clusters),median)

aggregate(as.data.frame(nutrient.scaled),by=list(cluster=clusters),median)

plot(fit.average,hang=-1,cex=.8,main="Average Linkage Clustering Cluster Solution")

rect.hclust(fit.average,k=5)

#划分聚类分析
install.packages("rattle")
#install.packages("RGtk2")
install.packages("https://cran.r-project.org/bin/windows/contrib/3.3/RGtk2_2.20.31.zip", repos=NULL)
install.packages("httr")
library("rattle")
library("RGtk2")
library("httr")
a <- GET("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data")
wine <- read.csv(textConnection(content(a)), header=F)

names(wine)<-c("Type","Alcohol","Malic acid","Ash","Alcalinity of ash","Magnesium","Total phenols","Flavanoids","Nonflavanoid phenols","Proanthocyanins","Color intensity","Hue","OD280/OD315 of diluted wines","Proline")
#data(wine,package="rattle")
head(wine)
df<-scale(wine[-1])

#wssplot(df)
library(NbClust)
set.seed(1234)
devAskNewPage(ask=TRUE)
nc<-NbClust(df,min.nc=2,max.nc=15,method="kmeans")
table(nc$Best.n[1,])

barplot(table(nc$Best.n[1,]),xlab="Number of Clusters",ylab="Number of Criteria",main="Number of Clusters Chosen by 26 Criteria")

set.seed(1234)
fit.km<-kmeans(df,3,nstart=25)
fit.km$size
fit.km$centers

ct.km<-table(wine$Type,fit.km$cluster)
ct.km

library(flexclust)
randIndex(ct.km)


#围绕中心点的划分
library(cluster)
set.seed(1234)
fit.pam<-pam(wine[-1],k=3,stand=TRUE)
fit.pam$method

clusplot(fit.pam,main="Bivariate Cluster Plot")

library(flexclust)
randIndex(ct.pam)


#围绕中心点的划分
library(cluster)
set.seed(1234)
fit.pam<-pam(wine[-1],k=3,stand=TRUE)
fit.pam$medoids
clusplot(fit.pam,main="Bivariate Cluster Plot2")
ct.pam<-table(wine$Type,fit.pam$clustering)

randIndex(ct.pam)


#避免不存在的类
install.packages("fMultivar")
library(fMultivar)
set.seed(1234)
df<-rnorm2d(1000,rho=.5)
df<-as.data.frame(df)
plot(df,main="Binariate Normal Distribution with rho=0.5")


#wssplot(df)
library(NbClust)
nc<-NbClust(df,min.nc=2,max.nc=15,method="kmeans")
dev.new()
barplot(table(nc$Best.n[1,]),xlab="Number of Clusters",ylab="Number of Criteria",main="Number of Clusters Chosen by 26 Criteria")


library(ggplot2)
library(cluster)
fit<-pam(df,k=2)
df$clustering<-factor(fit$clustering)
ggplot(data=df,aes(x=V1,y=V2,color=clustering,shape=clustering))+geom_point()+ggtitle("Clustering of Bivariate Normal Data")

plot(nc$All.index[,4],type="o",ylab="CCC",xlab="Number of clusters",col="blue")