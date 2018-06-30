#Branching Process R
a=0
for (k in 1:1000){
  #Generation
  g=80
  
  x<-rep(0:0, length =g ) #数列(0 0)を長さがgになるまで反復生成
  
  #Probability 2:0.45, 1:0.2, 0:0.35
  
  p0=0.35 #デルタt(死ぬ確率)
  p1=0.265 #1-(r+1)*デルタt=1-(1.1+1)*0.35(変化なし)
  p2=0.385 #r*デルタt=1.1*0.35(分裂する確率)
  
  x[1]<-1
  
  y<-matrix(nrow=g,ncol=10000)
  
  for (j in 2:g){
    
    y[j,]<-runif(10000)
    
    if (x[j-1]==0){
      #cat("Extinction-")
      a = a + 1        #ブレイクの回数の計算
      break
    }else{
      for (i in 1:x[j-1]){
        if (y[j,i]>=p0+p1){
          x[j]=x[j]+2
        }else if (y[j,i]>=p0) {
          x[j]=x[j]+1
        }else if (y[j,i]>=0) {
          x[j]=x[j]
        }
      }
    }
  }
  
  x
  #plot(x,type="l")

}
#Extinction Time
#cat("Extinction Time")
min(which(x==0))

cat(a)   #回数の表示

