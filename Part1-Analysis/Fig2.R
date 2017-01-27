data.prefixes <- c("wt","sixcln3","glyeth")

par(mfrow=c(1,3),cex=1.0)

for (prefix in data.prefixes) {
  
  load(paste("./Data/",prefix,"-Mother-GrowthDiv-080216.RData",sep=""))
  mother.sg2ms <- exp(grdiv.table[,3])
  load(paste("./Data/",prefix,"-Daughter-GrowthDiv-080216.RData",sep=""))
  daughter.sg2ms <- exp(grdiv.table[,3])
  plot(density(mother.sg2ms),col="blue",xlab=expression(paste(S/G[2]/M," (mins)",sep=" ")),main="",lwd=3,xlim=c(min(mother.sg2ms,daughter.sg2ms)-10,max(mother.sg2ms,daughter.sg2ms)+10),ylim=c(0.0,0.05))
  rug(mother.sg2ms,col="blue",lwd=1)
  lines(density(daughter.sg2ms),col="red",lty=2,lwd=3,breaks=20)
  rug(daughter.sg2ms,col="red",lwd=1)
  if (prefix == "wt") {
    legend(max(mother.sg2ms,daughter.sg2ms)-110,0.045,legend=c("Mother","Daughter"),col=c("blue","red"),lwd=c(3,3),lty=c(1,2),bty="n")
  }
  else {
    legend(max(mother.sg2ms,daughter.sg2ms)-90,0.045,legend=c("Mother","Daughter"),col=c("blue","red"),lwd=c(3,3),lty=c(1,2),bty="n")
  }
  wilcox.out <- wilcox.test(mother.sg2ms,daughter.sg2ms,conf.int=TRUE)
  print(wilcox.out)
}