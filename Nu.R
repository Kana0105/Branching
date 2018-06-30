#Branching Process R

#Generation
g=80

x<-rep(0:0, length = g) #数列(0 0)を長さがgになるまで反復生成

q0 = 0.99999

y<-matrix(nrow=g,ncol=10000) #g行、10000列の数列

for (j in 2:g){
  
  y[j,]<-runif(10000) #yのj行に0から1の乱数を10000個

  for(i in 1:10000){
    if (y[j,i] >= q0) #yのj行i列
    { 
      x[j] = x[j] + 1     
    }
    else{
      x[j] = x[j] 
    }
  }
}


x
plot(x,type="l")
