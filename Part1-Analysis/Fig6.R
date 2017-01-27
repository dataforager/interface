library(BAS)
datasets <- c("wt","sixcln3","glyeth")
figtitles <- c("WT (Glucose)","6xCLN3 (Glucose)","WT (Gly/Eth)")

for (i in 1:length(datasets)) {
  load(paste("./Data/",datasets[i],"-DaughterMother-GrowthDiv-080216.RData",sep=""))
  attach(daughter.mother.table)
  daughter.mother.table.std <- scale(daughter.mother.table)
  bas.out <- bas.lm(D.SG2M ~ M.SG2M + D.alpha + D.M0 + D.Mbud + M.alpha + M.M0 + M.Mbud,data=daughter.mother.table,prior="hyper-g",alpha=3)
  pdf(paste(datasets[i],"-DaughterMother-Interface-BASImage.pdf",sep=""))
  print(summary(bas.out))
  print(coef(bas.out))
  image(bas.out,log=FALSE,rotate=FALSE,main=figtitles[i]) 
  dev.off()
  plot(bas.out)
  
}