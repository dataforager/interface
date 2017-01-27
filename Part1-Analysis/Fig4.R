library(car)

panel.spearman <- function(x, y, ...) {
  horizontal <- (par("usr")[1] + par("usr")[2]) / 2;
  vertical <- (par("usr")[3] + par("usr")[4]) / 2;
  corr.coeff <- cor(x,y,method="spearman")
  text(horizontal, vertical, round(corr.coeff, digits=2),cex=2.0)
}

datasets <- c("wt","sixcln3","glyeth")
cellTypes <- c("Mother","Daughter")

par(mfrow=c(2,2))

for (i in 1:length(datasets)) {
  for (j in 1:length(cellTypes)) {
  
    load(paste("./Data/",datasets[i],"-",cellTypes[j],"-GrowthDiv-080216.RData",sep=""))
    attach(grdiv.table)
  
    sg2mMassAccum <- Mdiv - Mbud
    totMassAccum <- Mdiv - M0
	  
	cur.table <- cbind(M0,totMassAccum)
	pdf(paste(datasets[i],"-",cellTypes[j],"-M0-TotMassAccum-Plot.pdf",sep=""))
	print(cor.test(M0,totMassAccum,method="spearman",alternative="two.sided"))
	scatterplotMatrix(cur.table,lower.panel=panel.spearman,var.labels=c(expression(M[0]),expression(M[add])),cex.label=2.0,lwd=2)
	dev.off()
  
    cur.table <- cbind(M0,sg2mMassAccum)
    pdf(paste(datasets[i],"-",cellTypes[j],"-M0-SG2MMassAccum-Plot.pdf",sep=""))
    print(cor.test(M0,sg2mMassAccum,method="spearman",alternative="two.sided"))
    scatterplotMatrix(cur.table,lower.panel=panel.spearman,var.labels=c(expression(M[0]),expression(M[add])),cex.label=2.0,lwd=2)
    dev.off()
    
    detach(grdiv.table)
  
  }
}