n=20
m=10
#xx <- c(-10,10)
#yy <- c(-6,6)
#par(mar=c(0,0,0,0))
#plot(xx,yy,ann=F,type='n')
#dades=matrix(sample(1:m,2*n,replace=TRUE),n,2)
dades=read.table("dades.txt")
dades=as.matrix(dades)
Hn=matrix(-1/n,n,n)
diag(Hn)=rep(1-1/n,n)
dades.cent=Hn%*%dades
plot(dades.cent,asp=1,xlab="X",ylab="Y",xlim=c(-10,10),ylim=c(-5.5,5.5))
estudi.acp=prcomp(dades,scale.=FALSE)
direccions=estudi.acp$rotation
m.cov=t(dades.cent)%*%dades.cent
vaps=eigen(m.cov)$values
veps=eigen(m.cov)$vectors
mag=10
lines(c(0,mag*direccions[1,1]),c(0,mag*direccions[2,1]),col="red",lwd=3)
lines(c(0,mag*direccions[1,2]),c(0,mag*direccions[2,2]),col="red",lwd=3)
lines(c(0,-mag*direccions[1,1]),c(0,-mag*direccions[2,1]),col="red",lwd=3)
lines(c(0,-mag*direccions[1,2]),c(0,-mag*direccions[2,2]),col="red",lwd=3)
xaux=-6
text(xaux,direccions[2,1]*xaux/direccions[1,1]-1,"CP1",cex=1.5)
xaux=-1.5
text(xaux,direccions[2,2]*xaux/direccions[1,2]-2,"CP2",cex=1.5)
#arrows(0,0,mag*direccions[1,1],mag*direccions[2,1],col="red",lwd=3)
#arrows(0,0,mag*direccions[1,2],mag*direccions[2,2],col="red",lwd=3)
#arrows(0,0,-mag*direccions[1,1],-mag*direccions[2,1],col="red",lwd=3)
#arrows(0,0,-mag*direccions[1,2],-mag*direccions[2,2],col="red",lwd=3)
proj.ort=function(x0,y0,v1,v2,b){m=v2/v1;x1=(m*y0+x0-m*b)/(m^2+1);
                        y1=(m^2*y0+m*x0+b)/(m^2+1);return(c(x1,y1))}
#projecció sobre CP1
for (i in 1:dim(dades)[1]){
  aux=proj.ort(dades.cent[i,1],dades.cent[i,2],veps[1,1],veps[2,1],0)
  points(aux[1],aux[2],pch=20,col="blue")
  lines(c(dades.cent[i,1],aux[1]),c(dades.cent[i,2],aux[2]),lty=2)
}

#projecció sobre CP2
for (i in 1:dim(dades)[1]){
  aux=proj.ort(dades.cent[i,1],dades.cent[i,2],veps[1,2],veps[2,2],0)
  points(aux[1],aux[2],pch=20,col="blue")
  lines(c(dades.cent[i,1],aux[1]),c(dades.cent[i,2],aux[2]),lty=2)
}

