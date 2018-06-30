#Branching Process R

#Generation
g=80

x<-rep(0:0, length =g ) #数列(0 0)を長さがgになるまで反復生成

#Probability 2:0.45, 1:0.2, 0:0.35

p0=0.35 #デルタt(死ぬ確率)
p1=0.265 #1-(r+1)*デルタt=1-(1.1+1)*0.35(変化なし)
p2=0.385 #r*デルタt=1.1*0.35(分裂する確率)

x[1]<-1

y<-matrix(nrow=g,ncol=10000) #g行、10000列の数列

for (j in 2:g){
  
  y[j,]<-runif(10000) #yのj行に0から1の乱数を10000個
  
  if (x[j-1]==0){
    cat("Extinction-")
    break
  }else{
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
cat("Extinction Time")
min(which(x==0))

