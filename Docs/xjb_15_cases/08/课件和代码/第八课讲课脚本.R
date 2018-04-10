setwd("E:\\Desktop\\R Language\\R Level2\\天善智能学习资料\\谢佳标老师十五大案例资料\\第八课\\课件和代码")
# 创建网络关系图
library(igraph)
g1 <- graph(c(2,1,3,1,4,1,5,1,6,1,7,1,8,7)) #创建有向图
g2 <- graph(c(2,1,3,1,4,1,5,1,6,1,7,1,8,7),directed = F) # 创建无向图需要设置参数directed=F
par(mfrow=c(1,2))
plot(g1,main="有向图")
plot(g2,main="无向图")
par(mfrow=c(1,1))
str(g1) # 查看图g1信息，显示8个顶点、7条边，以及所有边的集合
V(g1)   # 输出g1顶点集合
ecount(g1) # g1边条数
vcount(g1) # g1顶点个数
degree(g1) # g1各顶点度
degree(g1,mode = "in") #有向图各顶点入度
degree(g1,mode = "out") # 有向图各顶点出度

# 创建不同布局网络图
# 方式一
par(mfrow=c(2,3),mar=c(1.5,1,2,1))
g1 <- make_empty_graph(n=5,directed = F)
g2 <- make_star(6,mode = "undirected")
g3 <- make_lattice(c(2,3,3))
g4 <- make_ring(5)
g5 <- make_full_graph(5)
g6 <- make_tree(7,2,mode = "undirected")
plot(g1,vertex.size=40);title(main="无边图")
plot(g2,vertex.size=40);title(main="星图")
plot(g3,vertex.size=40);title(main="晶状图")
plot(g4,vertex.size=40);title(main="环形图")
plot(g5,vertex.size=40);title(main="完全图")
plot(g6,layout=layout.reingold.tilford,vertex.size=40);title(main="树状图")
par(mfrow=c(1,1))
# 方法二
g <- graph(c(2,1,3,1,4,1,5,1,6,1,7,1),directed = F) #创建无向图g
par(mfrow=c(2,3))
plot(g,vertex.size=40,layout=layout_on_grid,main="简单的网格布局") # 简单的网格布局
plot(g,vertex.size=40,layout=layout.auto,main="自动布局") #自动布局
plot(g,vertex.size=40,layout=layout_as_star,main="星形布局") #星形布局
plot(g,vertex.size=40,layout=layout.circle,main="环形布局") # 环形布局
plot(g,vertex.size=40,layout=layout_randomly,main="随机布局") # 随机布局
plot(g,vertex.size=40,layout=layout_as_tree(g),main="树状布局") # 树状布局
par(mfrow=c(1,1))

# 对data.frame类型绘制网络图
relations <- data.frame(Account_from=rep(letters[1:5],5),
                        Account_to=letters[c(2:5,1,6:25)],
                        Same.IP=sample(c("TRUE","FALSE"),25,replace = T),
                        Friendly=round(runif(25,0,1),2),
                        Trade=sample(1:100,25,replace=T))
account <- data.frame(NameId=letters[1:25],
                      Occupation=paste('oc',sample(1:4,25,replace=T),sep=""),
                      Lv=sample(1:50,25,replace=T),
                      Game.time=sample(1:30,25,replace = T))
g <- graph_from_data_frame(relations,directed = F,vertices = account) #graph_from_data_frame替代graph.data.frame
str(g)
plot(g)
# 通过as_data_frame函数可以查看所有边、顶点的信息
# 输出边的所有信息
as_data_frame(g,what = "edges") # 用as_data_frame函数替换get.data.frame
# 输出顶点的所有信息
as_data_frame(g,what = 'vertices')
# 输出边和顶点所有信息,结果为list类型
as_data_frame(g,what = "both")
# 输出图g顶点的Occupation属性值
V(g)$Occupation #输出图g顶点的属性值
E(g)$Friendly  #输出图g边的Friendly属性值

# 对网络图g进行美化
library(RColorBrewer)
g <- graph(c(2,1,3,1,4,1,5,1,6,1,7,1),directed = F) #创建无向图g
weight <- seq(1,3,length.out=ecount(g)) #生成边的权重
# 方法一
V(g)$color <- brewer.pal(9,"Set1")[1:vcount(g)] # 设置点填充颜色
V(g)$frame.color <- NA           # 不显示点边框
V(g)$label.color <-"white"       # 设置点标签颜色为白色
V(g)$label.font <- 2              # 设置点标签的字体为粗体
V(g)$label.cex <- 2              # 设置点标签字体大小
E(g)$width <- weight             # 根据边的权重设置边的粗细
E(g)$color <- "steelblue4"       # 设置边的颜色
E(g)$lty <- 2                    # 设置边为虚线
plot(g,main="对网络图g进行美化")
# 方法二
plot(g,vertex.color=brewer.pal(9,"Set1")[1:vcount(g)],
     vertex.frame.color=NA,vertex.label.color="white",
     vertex.label.font=2,vertex.label.cex=2,
     edge.width=weight,edge.color="steelblue4",edge.lty=2,
     main="对网络图g进行美化")
# 利用tkplot函数制作交互图
tkplot(g)
# 利用rglplot函数制作3D图
rglplot(g)

# 业务案例：对玩家社交关系进行可视化
# 导入社交数据
Links <- read.csv("data/Links.csv")
Nodes <- read.csv("data/Nodes.csv")
# 转换成graph.object对象
library(igraph)
g <- graph.data.frame(Links,directed = T,vertices = Nodes)
g
# 绘制网络图
# 对顶点进行美化
V(g)$size <- 10
V(g)$color <- Nodes$Group
V(g)$label <- as.character(Nodes$Label)
V(g)$label.cex <- 0.7
# 对边进行美化
E(g)$width <- (Links$Weight-min(Links$Weight))*5/(max(Links$Weight)-min(Links$Weight))
E(g)$arrow.size <- 0.5
plot(g,main="用户社会网络图")
# 移除某个玩家后的网络图
remove.u <- "user12"
remove.v <- which(V(g)$Label!=remove.u)
g.new <- induced.subgraph(g,remove.v)
plot(g.new,vertex.size=10,
     vertex.color=Nodes[-which(Nodes$Label==remove.u),"Group"],
     vertex.label=as.character(setdiff(Nodes$Label,remove.u)),    #setdiff 执行排除操作
     vertex.label.cex=0.7,
     main=paste0("移除",remove.u,"用户后的网络图"))

# 案例：对用户进行社群发现
library(igraphdata)
data(karate)
fc1 <- multilevel.community(karate) # 多层次聚类
fc2 <- edge.betweenness.community(karate) # 边中间性聚类
fc3 <- walktrap.community(karate) #随机游走聚类
fc4 <- infomap.community(karate) #infomap算法聚类
fc5 <- fastgreedy.community(karate) # 快速贪婪聚类
fc6 <- label.propagation.community(karate) # 标签传播
fc_list <- list(fc1,fc2,fc3,fc4,fc5,fc6)
algorithm_list <- c("multilevel","edge.betweenness","walktrap",
                    "infomap","fastgreedy","label.propagation")
par(mfrow=c(2,3),mar=c(1,1,2,1))
for(i in 1:6){
  plot(fc_list[[i]],karate,main=algorithm_list[[i]])
}
par(mfrow=c(1,1))

# networkD3包
# simpleNetwork函数
library(networkD3)
src <- sample(paste0("用户",1:4),9,replace = T)
target <- sample(paste0("用户",c(1,2,3,5,6,7)),9,replace = T)
networkData <- data.frame(src, target)
simpleNetwork(networkData,zoom=T)
# 利用networkD3函数绘制力导向网络图
# 加载数据
data(MisLinks)
data(MisNodes)
# 画图
forceNetwork(Links = MisLinks, Nodes = MisNodes,
             Source = "source", Target = "target",
             Value = "value", NodeID = "name",
             Group = "group", opacity = 0.8,zoom = TRUE)