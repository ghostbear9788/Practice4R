w <- read.table("clipboard",T)
table(w$play)
-(9/14)*log2(9/14)-(5/14)*log2(5/14)
table(w$outlook,w$play)
-(2/5)*(log2(2/5))-(3/5)*log2(3/5)

# 计算信息熵
myfun <- function(x,y){
  t <- table(x,y)
  m <- matrix(t,3,2,dimnames = list(unique(x),unique(y)))
  freq <- -rowSums((m/rowSums(m))*log2(m/rowSums(m)))
  entropy <- sum(rowSums(m)*freq/dim(w)[1],na.rm = T)
  return(entropy)
}
x <- w[,1];y <- w[,5]
myfun(x=w[,2],y=w[,5])
