setwd("E:\\Desktop\\R Language\\R Level2\\天善智能学习资料\\谢佳标老师十五大案例资料\\第八课\\课件和代码")

library(dplyr)
library(networkD3) 

vob=read.csv("data\\2015女排世界杯.csv")
vob[is.na(vob)]=0
#========================================================================================
#构造节点
country=levels(factor(vob$Team))  
contient0=c("非洲","美洲","欧洲","亚洲")
contient=c("非洲","美洲","亚洲",rep("美洲",2),"亚洲","非洲","亚洲","美洲",rep("欧洲",2),"美洲")
type=c("扣球","拦网","发球")
pos=levels(factor(vob$Pos.))
pos_c=c("副攻","接应","主攻","二传")
top=as.character(vob$Name[1:20])

#----------------------------------------------------------------------------
#建立国家与五大洲节点关系
edge1=as.data.frame(cbind(country,contient))
v1=summarise(group_by(vob,Team),sum(Total))
edge1$value=as.numeric(v1$`sum(Total)`)
names(edge1)[1:2]=c("x","y")

#-----------------------------------------------------------------------------
#function
coun_type=function(data,type_num)
{
  d1=select(data,y,type_num)
  names(d1)=c("name","score")
  d2=summarise(group_by(d1,name),sum(score))
  names(d2)=c("name","value")
  return(d2)
}
fun=function(data)
{
  p=coun_type(data,2)
  p1=coun_type(data,3)
  v2=rbind(rbind(p,p1),coun_type(data,4))
  return(v2)
}
#建立国家所属洲与进攻类型节点
c2=select(vob,5:9)
c2=merge(c2,edge1[1:2],by.x="Team",by.y="x")
edge2=merge(contient0,type);edge2$value=NA
edge2$value=fun(c2)$value

#------------------------------------------------------------------------------
#建立攻击类型与位置间的节点
c3=select(vob,4,6:9)
names(c3)[1]="y"
edge3=merge(pos,type);edge3$value=NA
edge3$value=fun(c3)$value
names(edge3)[1:2]=c("y","x")

#------------------------------------------------------------------------------
#建立位置与得分前20球员的节点
edge4=select(vob,3,4,9)[1:20,]
names(edge4)=c("y","x","value")
#===================================================================================
#整合参数
vob_nodes=data.frame(c(country,contient0,type,pos,top))
vob_nodes$num=0:(nrow(vob_nodes) - 1)
names(vob_nodes)[1]="names"

vob_links=rbind(rbind(edge1,edge2),rbind(edge3,edge4))
vob_links=merge(vob_links, vob_nodes, by.x="x", by.y="names") 
vob_links=merge(vob_links, vob_nodes, by.x="y", by.y="names")  
names(vob_links)[4:5]=c("source","target")  
vob_links=select(vob_links,source,target,value) 

#NodeGroup
vob_nodes$nodegroup=as.factor(1:43)
m1=match(vob[1:20,]$Team,vob_nodes$names)
vob_nodes$nodegroup[24:43]=vob_nodes$nodegroup[m1]
vob_nodes$nodegroup=as.factor(vob_nodes$nodegroup) #注意用因子型！
#====================================================================================
# 画图
sankeyNetwork(Links = vob_links, Nodes = vob_nodes, Source = "source",  
              Target = "target", Value = "value", NodeID = "names",NodeGroup = "nodegroup",
              fontSize = 10, nodeWidth = 30)