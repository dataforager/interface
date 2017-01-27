library(BAS)
datasets <- c("wt","sixcln3","glyeth")
figtitles <- c("WT (Glucose)","6xCLN3 (Glucose)","WT (Gly/Eth)")

for (i in 1:length(datasets)) {
  load(paste("./Data/",datasets[i],"-MotherMother-GrowthDiv-080216.RData",sep=""))
  attach(mother.mother.table)
  bas.out <- bas.lm(M2.SG2M ~ M1.SG2M + M2.alpha + M2.M0 + M2.Mbud + M1.alpha + M1.M0 + M1.Mbud,data=mother.mother.table,prior="hyper-g",alpha=3)
  pdf(paste(datasets[i],"-MotherMother-BASImage.pdf",sep=""))
  print(summary(bas.out))
  print(coef(bas.out))
  image(bas.out,log=FALSE,rotate=FALSE,main=figtitles[i]) 
  dev.off()
  plot(bas.out)
  
}