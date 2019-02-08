#ggplot2


library(ggplot2)
#散点图
ggplot(data = mtcars, aes(x = wt, y = mpg)) + geom_point() + labs(title =
                                                                    "Automation Data", x = "Weight", y = "Miles Per Gallon")



#散点图+回归曲线
ggplot(data=mtcars,aes(x=wt,y=mpg))+geom_point(pch=17,color="blue",size=2)+geom_smooth(method="lm",color="red",linetype=2)+labs(title="Automobile Data",x="Weight",y="Miles Per Gallon")


#分组---出错
mtcars$am<-factor(mtcars$am,levels=c(0,1),labels=c("Automation","Manual"))
mtcars$vs<-factor(mtcars$vs,levels=c(0,1),labels=c("V-Engine","Straight Engine"))
mtcars$cyl<-factor(mtcars$cyl)

ggplot(data=mtcars,aes=c(x=hp,y=mpg,shape=cyl,color=cyl))+geom_point(size=3)+facet_grid(am~vs)+labs(title="Automobile Data by Engine Type",x="Horsepower",y="Miles Per Gallon")


#直方图
data(singer,package="lattice")
ggplot(singer,aes(x=height))+geom_histogram()

#箱线图
ggplot(singer,aes(x=voice.part,y=height))+geom_boxplot()

#复杂的叠加图：箱线+散点+地毯
data(Salaries,package="car")
library(ggplot2)
ggplot(Salaries,aes(x=rank,y=salary))+geom_boxplot(fill="cornflowerblue",color="black",notch = TRUE)+geom_point(position="jitter",color="blue",alpha=.5)+geom_rug(side="1",color="black")


#图形组合：小提琴+箱线
data(singer,package="lattice")
ggplot(singer,aes(x=voice.part,y=height))+geom_violin(fill="lightblue")+geom_boxplot(fill="lightgreen",width=.2)


#分组 - 密度图
data(Salaries,package="car")
library(ggplot2)
ggplot(data=Salaries,aes(x=salary,fill=rank))+geom_density(alpha=.3)

#分组 - 散点图
ggplot(Salaries,aes(x=yrs.since.phd,y=salary,color=rank,shape=sex))+geom_point()


#分组 -直方图
ggplot(Salaries,aes(x=rank,fill=sex))+geom_bar(position="stack")+labs(title='position="stack"')

ggplot(Salaries,aes(x=rank,fill=sex))+geom_bar(position="dodge")+labs(title='position="dodge"')

ggplot(Salaries,aes(x=rank,fill=sex))+geom_bar(position="fill")+labs(title='position="fill"')

#分组 - 刻画
data(singer,package="lattice")
library(ggplot2)
ggplot(data=singer,aes(x=height))+geom_histogram()+facet_wrap(~voice.part,nrow=4)

ggplot(Salaries,aes(x=yrs.since.phd,y=salary,color=rank,shape=rank))+geom_point()+facet_grid(.~sex)

#分组 - 刻画 -核密度
ggplot(data=singer,aes(x=height,fill=voice.part))+geom_density()+facet_grid(voice.part~.)

#添加光滑曲线
data(Salaries,package="car")
library(ggplot2)
ggplot(data=Salaries,aes(x=yrs.since.phd,y=salary))+geom_smooth()+geom_point()

ggplot(data=Salaries,aes(x=yrs.since.phd,y=salary,linetype=sex,shape=sex,color=sex))+geom_smooth(method=lm,formula=y~poly(x,2),se=FALSE,size=1)+geom_point(size=2)


#坐标轴
data(Salaries,package="car")
library(ggplot2)
ggplot(data=Salaries,aes(x=rank,y=salary,fill=sex))+geom_boxplot()+scale_x_discrete(breaks=c("AsstProf","AssocProf","Prof"),labels=c("Assistant\nProfessor","Assistant\nProfessor","Full\nProfessor"))+scale_y_continuous(breaks=c(50000,100000,150000,200000),labels=c("$50K","$100K","$150K","$200K"))+labs(title="Faculty Salary by Rank and Sex",x="",y="")

ggplot(data=Salaries,aes(x=rank,y=salary,fill=sex))+geom_boxplot()+scale_x_discrete(breaks=c("AsstProf","AssocProf","Prof"),labels=c("Assistant\nProfessor","Assistant\nProfessor","Full\nProfessor"))+scale_y_continuous(breaks=c(50000,100000,150000,200000),labels=c("$50K","$100K","$150K","$200K"))+labs(title="Faculty Salary by Rank and Sex",x="",y="")+theme(legend.position = c(.1,.8))


#标尺
ggplot(mtcars,aes(x=wt,y=mpg,size=disp))+geom_point(shape=21,color="black",fill="cornsilk")+labs(x="Weight",y="Miles Per Gallon",title="Bubble Chart",size="Engine\nDisplacement")

data(Salaries,package="car")
ggplot(data=Salaries,aes(x=yrs.since.phd,y=salary,color=rank))+scale_color_manual(values=c("orange","olivedrab","navy"))+geom_point(size=2)


#主题
data(Salaries,package="car")
library(ggplot2)
mytheme<-theme(plot.title = element_text(face="bold.italic",size="14",color="brown"),
               axis.title = element_text(face="bold.italic",size=10,color="brown"),
               axis.text = element_text(face="bold",size=9,color="darkblue"),
               panel.background = element_rect(fill="white",color="darkblue"),
               panel.grid.major.y = element_line(color="grey",linetype=1),
               panel.grid.minor.y = element_line(color="grey",linetype=2),
               panel.grid.minor.x = element_blank(),
               legend.position = "top")

ggplot(Salaries,aes(x=rank,y=salary,fill=sex))+geom_boxplot()+labs(title="Salary by Rank and Sex",x="Rank",y="Salary")+mytheme


#多重图
data(Salaries,package="car")
library(ggplot2)
p1<-ggplot(data=Salaries,aes(x=rank))+geom_bar()
p2<-ggplot(data=Salaries,aes(x=sex))+geom_bar()
p3<-ggplot(data=Salaries,aes(x=yrs.since.phd,y=salary))+geom_point()

library(gridExtra)
grid.arrange(p1,p2,p3,ncol=3)

ggsave(file="d:\\mygraph.pdf")