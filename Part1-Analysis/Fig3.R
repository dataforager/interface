library(car)

panel.pearson <- function(x, y, ...) {
  horizontal <- (par("usr")[1] + par("usr")[2]) / 2;
  vertical <- (par("usr")[3] + par("usr")[4]) / 2;
  corr.coeff <- cor(x,y)
  text(horizontal, vertical, round(corr.coeff, digits=2),cex=2.0)
}

datasets <- c("wt","sixcln3","glyeth")

for (i in 1:length(datasets)) {
  load(paste("./Data/",datasets[i],"-DaughterMother-GrowthDiv-080216.RData",sep=""))
  attach(daughter.mother.table)
  SG2M.diff <- D.SG2M - M.SG2M
  Mbud.diff <- D.Mbud - M.Mbud
  
  cur.table <- cbind(SG2M.diff,Mbud.diff)
  
  scatterplotMatrix(cur.table,lower.panel=panel.pearson,cex.lab=2.0,lwd=2,span=1.0,loess.threshold=5,var.labels=c(expression(S[diff]),expression(M[Bdiff])))
  
  lm.fit <- lm(SG2M.diff ~ Mbud.diff)
  print(summary(lm.fit))

}