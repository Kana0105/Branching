#Branching Process R

#Generation
g = 1
while(g < 100){
  g = g + 1
  x<-rep(0:0, length =1000 ) #数列(0 0)を長さがgになるまで反復生成
  
  #Probability 2:0.45, 1:0.2, 0:0.35
  
  p0=0.35 #デルタt(死ぬ確率)
  p1=0.265 #1-(r+1)*デルタt=1-(1.1+1)*0.35(変化なし)
  p2=0.385 #r*デルタt=1.1*0.35(分裂する確率)
  
  q0=0.9
  
  y<-matrix(nrow=1000,ncol=100) #g行、10000列の数列

  for (j in 2:100){
    
    y[j,]<-runif(100) #yのj行に0から1の乱数を10000個
    for(i in 1:1){
      if(y[j,i]>=q0){
        x[j]=x[j]+1
      }
    }
    for (i in 1:x[j-1]){
      if (y[j,i]>=p0+p1){ #yのj行i列
        x[j]=x[j]+2 #2つに分裂
      }else if (y[j,i]>=p0) {
        x[j]=x[j]+1 #そのまま
      }else if (y[j,i]>=0) {
        x[j]=x[j] #死ぬ
      }
    }
  }
}

x
plot(x,type="l")
#Extinction Time
min(which(x==0))

cat("g")

