library(dplyr)
library(networkD3) 

vob=read.csv("2015女排世界杯.csv")
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


#=============================================================================================
#收视数据
library(riverplot)
library(data.table)
watch=fread("DATA0703.txt")
#整合数据
wat=watch[watch$hour<=21 & watch$hour>=17,]
wat=select(wat,num,hour,min,channel_type)
wat_hou=levels(factor(wat$num))
wat_dat=data.frame(wat_hou,NA,NA,NA,NA,NA)
names(wat_dat) = c("num","17","18","19","20","21")
num_chan_ty=function(minu,tty)
{
  mi=match(min(minu),minu)
  return(tty[mi])
}
#整理每时段的频道类型
s1=summarise(group_by(wat,num,hour),num_chan_ty(min,channel_type))
for(i in 2:6)
{
  ww=s1[s1$hour==(i+15)]
  mm=match(ww$num,wat_dat$num)
  wat_dat[mm,][i]=ww$`num_chan_ty(min, channel_type)`
}
#设置节点
chan_type=c("其他","央视","江苏","地方","未看")
#node----------------------------------------------------------------------
node_wat=merge(chan_type,c(1:5))
node_wat$x=paste0(node_wat$x,rep(17:21,each=5),"时")
names(node_wat)=c("ID","x")

#edge-------------------------------------------------------------------------
edge_wat=merge(node_wat$ID[6:25],chan_type)
edge_wat=mutate(edge_wat,N1=y,N2=x,Value=NA)[3:5]
edge_wat$N1=paste0(edge_wat$N1,rep(17:20,each=5),"时")
edge_wat$N2=as.character(edge_wat$N2)
edge_wat$hour=substr(edge_wat$N1,3,4)
edge_wat=arrange(edge_wat,hour)[-4]

#value----------------------------------------------------------------------
for(i in 18:21)
{
  se1=select(wat_dat,i-16,i-15)
  names(se1)=c("source","target")
  su1=summarise(group_by(se1,source,target),n())
  edge_wat[(25*(i-18)+1):(25*(i-17)),]$Value=su1$`n()`
}
#画图====================================================================================
library(riverplot)
library(RColorBrewer) 
color =brewer.pal(8, "YlGnBu")[2:7] #display.brewer.all()函数可查看颜色编号
styles = lapply(node_wat$x, function(n) {  
  list(col = color[n],edgecol="col",srt="0")  #标签角度默认90度
})  
names(styles) = node_wat$ID
p <- list(nodes = node_wat, edges = edge_wat,styles = styles)  
class(p) <- c(class(p), "riverplot")
riverplot(p, plot_area = 0.75, yscale=0.1,nodewidth=3,add_mid_points = FALSE)



