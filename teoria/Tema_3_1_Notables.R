knitr::opts_chunk$set(echo = TRUE, comment = NA)
library(reticulate)

dbinom(0,size=1,prob=0.25)
dbinom(1,size=1,prob=0.25)
rbinom(n=20,size = 1,prob=0.25)

## par(mfrow=c(1,2))
## plot(x=c(0,1),y=dbinom(c(0,1),size=1,prob=0.25),
##      ylim=c(0,1),xlim=c(-1,2),xlab="x",
##      main="Función de probabilidad\n Ber(p=0.25)")
## lines(x=c(0,0,1,1),y=c(0,0.75,0,0.25), type = "h", lty = 2,col="blue")
## curve(pbinom(x,size=1,prob=0.25),
##       xlim=c(-1,2),col="blue",
##       main="Función de distribución\n Ber(p=0.25)")
## par(mfrow=c(1,1))

par(mfrow=c(1,2))
plot(x=c(0,1),y=dbinom(c(0,1),size=1,prob=0.25),
     ylim=c(0,1),xlim=c(-1,2),xlab="x",
     main="Función de probabilidad\n Ber(p=0.25)")
lines(x=c(0,0,1,1),y=c(0,0.75,0,0.25), type = "h", lty = 2,col="blue")
curve(pbinom(x,size=1,prob=0.25),
      xlim=c(-1,2),col="blue",
      main="Función de distribución\n Ber(p=0.25)")
par(mfrow=c(1,1))


sliderInput("p_ber", label = "Probabilidad éxito p:",
              min = 0.01, max = 0.99, value = 0.25, step = 0.01)

renderPlot({
par(mfrow=c(1,2))
  p=input$p_ber
plot(x=c(0,1),y=dbinom(c(0,1),size=1,prob=p),
     ylim=c(0,1),xlim=c(-0.5,2),xlab="x",pch=21,
     main=paste0(c("Función de probabilidad\n
                   Ber(p=",p,")"),collapse=""),bg="black")
segments(x0=0,y0=0,x1=0,y1=1-p, col = "blue", lty =2)
segments(x0=1,y0=0,x1=1,y1=p, col = "blue", lty =2)
segments(x0=-1,y0=1-p,x1=0,y1=1-p, col = "blue", lty =2)
segments(x0=-1,y0=p,x1=1,y1=p, col = "blue", lty =2)
x=0:1
y=pbinom(x,size=1,prob=p)
curve(pbinom(x,size=1,prob=p),
      xlim=c(-1,2),col="blue",
      main=paste0(c("Función de distribución\n Ber(p=",p,")"),collapse="")
      )

par(mfrow=c(1,1))
})

choose(6,5)

choose(10,5)

choose(22,10)

pbinom(0,size=10,prob=0.25)

pbinom(4,size=10,prob=0.25)

dbinom(0,size=10,prob=0.25)

dbinom(4,size=10,prob=0.25)

set.seed(2019)
rbinom(100,size = 20,prob=0.5)

## from scipy.stats import binom


## binom.pmf(k, n, p, loc) =  binom.pmf(k - loc, n, p)


## binom.cdf(0,n=10,p=0.25)


## binom.pmf(0,n=10,p=0.25)


## binom.rvs(n=20,p=0.25,size = 100)


## binom.rvs(n=20,p=0.25,size = 100)


## binom.cdf(5,n=10,p=0.25)


## par(mfrow=c(1,2))
## aux=rep(0,22)
## aux[seq(2,22,2)]=dbinom(c(0:10),size=10,prob=0.25)
## plot(x=c(0:10),y=dbinom(c(0:10),size=10,prob=0.25),
##   ylim=c(0,1),xlim=c(-1,11),xlab="x",
##   main="Función de probabilidad\n B(n=10,p=0.25)")
## lines(x=rep(0:10,each=2),y=aux, type = "h", lty = 2,col="blue")
## curve(pbinom(x,size=10,prob=0.25),
##   xlim=c(-1,11),col="blue",
##   main="Función de distribución\n B(n=10,p=0.25)")
## par(mfrow=c(1,1))

par(mfrow=c(1,2))
aux=rep(0,22)
aux[seq(2,22,2)]=dbinom(c(0:10),size=10,prob=0.25)
plot(x=c(0:10),y=dbinom(c(0:10),size=10,prob=0.25),
  ylim=c(0,1),xlim=c(-1,11),xlab="x",
  main="Función de probabilidad\n B(n=10,p=0.25)")
lines(x=rep(0:10,each=2),y=aux, type = "h", lty = 2,col="blue")
curve(pbinom(x,size=10,prob=0.25),
  xlim=c(-1,11),col="blue",
  main="Función de distribución\n B(n=10,p=0.25)")
par(mfrow=c(1,1))


fluidPage(
fluidRow(
  column(6,
         sliderInput("n_binom", label = "Número de repeticiones n:",
              min = 1, max = 50, value =10 , step = 1)),
  column(6,
          sliderInput("p_binom", label = "Probabilidad éxito p:",
                     min = 0.01, max = 0.99, value = 0.25, step = 0.01)
         )
  )
)

renderPlot({
  n=input$n_binom
  pr=input$p_binom
  
  par(mfrow=c(1,2))
  aux=rep(0,(n+1)*2)
  aux[seq(2,(n+1)*2,2)]=dbinom(c(0:n),size=n,prob=pr)
  plot(x=c(0:n),y=dbinom(c(0:n),size=n,prob=pr),
       ylim=c(0,1),xlim=c(-1,n+1),xlab="x",
       main=paste0(c("Función de probabilidad\n B(n=",n,",p=",pr,")"),collapse = ""))
  lines(x=rep(0:n,each=2),y=aux, type = "h", lty = 2,col="blue")
  curve(pbinom(x,size=n,p=pr),
        xlim=c(-1,n+1),col="blue",
        main=paste0(c("Función de distribución\n B(n=",n,",p=",pr,")"),
                    collapse = ""))
        par(mfrow=c(1,1))
})


## import numpy as np


## n, p = 10, 0.25


## n, p = 10, 0.25


dbinom(4,size=10,prob = 0.4)

pbinom(3,10,0.4)

1-pbinom(3,10,0.4)

pbinom(3,10,0.4,lower.tail = FALSE)

dbinom(0,10,0.4)+dbinom(1,10,0.4)+dbinom(2,10,0.4)
pbinom(2,10,0.4)

## print("E(X) = {m}".format(m=binom.stats(n = 10, p = 0.4, moments='m')))


## print("Var(X) = {v}".format(v=binom.stats(n = 10, p = 0.4, moments='v')))


dgeom(0,prob=0.25)

pgeom(0,prob=0.25)

pgeom(4,prob=0.25)

rgeom(n=25,prob=0.25)

## par(mfrow=c(1,2))
## x=c(0:10)
## plot(x=x,y=dgeom(x,prob=0.25),
##   ylim=c(0,1),xlim=c(-1,11),xlab="x",
##   main="Función de probabilidad\n Ge(p=0.25)")
## lines(x=rep(0:10,each=2),y=aux, type = "h", lty = 2,col="blue")
## aux0=dgeom(c(0:10),prob=0.25)
## ceros=rep(0,21)
## ceros
## aux=ceros
## aux[2*(c(1:11))]<-aux0
## curve(pgeom(x,prob=0.25),
##   xlim=c(-1,10),col="blue",
##   main="Función de distribución\n Ge(p=0.25)")
## par(mfrow=c(1,1))

  par(mfrow=c(1,2))
  p=0.25
  n=30
  aux=rep(0,(n+1)*2)
  aux[seq(2,(n+1)*2,2)]=dgeom(c(0:n),prob=p)
  plot(x=c(0:n),y=dgeom(c(0:n),prob=p),
       ylim=c(0,1),xlim=c(-1,n+1),xlab="x",
       main=paste0(c("Función de probabilidad\n Ge(p=",p,")"),collapse = ""))
  lines(x=rep(0:n,each=2),y=aux, type = "h", lty = 2,col="blue")
  curve(pgeom(x,prob=p),
        xlim=c(-1,n+1),col="blue",
        main=paste0(c("Función de distribución\n Ge(p=",p,")"),collapse = ""))
  par(mfrow=c(1,1))

 
sliderInput("p_geom", label = "Probabilidad de éxito:",
              min = 0.01, max = 0.99, value =0.25 , step = 0.01)
renderPlot({
  par(mfrow=c(1,2))
  p=input$p_geom
  n=30
  aux=rep(0,(n+1)*2)
  aux[seq(2,(n+1)*2,2)]=dgeom(c(0:n),prob=p)
  plot(x=c(0:n),y=dgeom(c(0:n),prob=p),
       ylim=c(0,1),xlim=c(-1,n+1),xlab="x",
       main=paste0(c("Función de probabilidad\n Ge(p=",p,")"),collapse = ""))
  lines(x=rep(0:n,each=2),y=aux, type = "h", lty = 2,col="blue")
  curve(pgeom(x,prob=p),
        xlim=c(-1,n+1),col="blue",
        main=paste0(c("Función de distribución\n Ge(p=",p,")"),collapse = ""))
  par(mfrow=c(1,1))
})

## from scipy.stats import geom


## geom.pmf(0,p=0.25,loc=-1)


## geom.cdf(0,p=0.25,loc=-1)


## geom.cdf(4,p=0.25,loc=-1)


## geom.rvs(p=0.25, size=20, loc=-1)


## geom.cdf(range(5),p=0.3,loc=0)


## geom.stats(p=0.25, loc=0, moments='mv')


## p = 0.25


## 

choose(-6,4)

## pnbinom(4-2,2,0.1)
## 0.1^2+ 2* 0.9 * 0.1^2+ 3*0.9^2* 0.1^2
## dnbinom(0,2,0.1)
## 0.1^2
## dnbinom(1,2,0.1)
## 2* 0.9 * 0.1^2
## dnbinom(2,2,0.1)
## 3*0.9^2* 0.1^2

dnbinom(5,size=2,p=0.1)

pnbinom(4,size=2,p=0.1)
1-pnbinom(4,size=2,p=0.1)
pnbinom(4,size=2,p=0.1,lower.tail=FALSE)

## from scipy.stats import nbinom


## nbinom.pmf(k, n, p, loc) = nbinom.pmf(k-loc, n, p)`


## nbinom.pmf(k=5,n=2,p=0.1)


## nbinom.rvs(n=2, p=0.1, size=100)


## n, p=2,0.1


## par(mfrow=c(1,2))
## aux=rep(0,22)
## aux[seq(2,22,2)]=dnbinom(c(0:10),size=2,prob=0.1)
## plot(x=c(0:10),y=dnbinom(c(0:10),size=2,prob=0.1),
##   ylim=c(0,1),xlim=c(-1,11),xlab="x",
##   main="Función de probabilidad\n BN(n=2,p=0.1)")
## lines(x=rep(0:10,each=2),y=aux, type = "h", lty = 2,col="blue")
## curve(pnbinom(x,size=2,prob=0,1),
##   xlim=c(-1,11),col="blue",
##   main="Función de distribución\n BN(n=2,p=0.1)")
## par(mfrow=c(1,1))

par(mfrow=c(1,2))
aux=rep(0,22)
aux[seq(2,22,2)]=dnbinom(c(0:10),size=2,prob=0.1)
plot(x=c(0:10),y=dnbinom(c(0:10),size=2,prob=0.1),
  ylim=c(0,1),xlim=c(-1,11),xlab="x",
  main="Función de probabilidad\n BN(n=2,p=0.1)")
lines(x=rep(0:10,each=2),y=aux, type = "h", lty = 2,col="blue")
curve(pnbinom(x,size=2,prob=0.1),
  xlim=c(-1,11),col="blue",
  main="Función de distribución\n BN(n=2,p=0.1)")
par(mfrow=c(1,1))


fluidPage(
fluidRow(
  column(6,
         sliderInput("n_nbinom", label = "Número de éxitos n:",
              min = 1, max = 50, value =20 , step = 1)),
  column(6,
          sliderInput("p_nbinom", label = "Probabilidad de un éxito p:",
                     min = 0.01, max = 0.99, value = 0.8, step = 0.01)
         )
  )
)

renderPlot({
  n=input$n_nbinom
  pr=input$p_nbinom
  
  par(mfrow=c(1,2))
  aux=rep(0,(n+1)*2)
  aux[seq(2,(n+1)*2,2)]=dnbinom(c(0:n),size=n,prob=pr)
  plot(x=c(0:n),y=dnbinom(c(0:n),size=n,prob=pr),
       ylim=c(0,1),xlim=c(-1,n+1),xlab="x",
       main=paste0(c("Función de probabilidad\n BN(n=",n,",p=",pr,")"),collapse = ""))
  lines(x=rep(0:n,each=2),y=aux, type = "h", lty = 2,col="blue")
  curve(pnbinom(x,size=n,p=pr),
        xlim=c(-1,n+1),col="blue",
        main=paste0(c("Función de distribución\n BN(n=",n,",p=",pr,")"),
                    collapse = ""))
  par(mfrow=c(1,1))
})


## import numpy as np


## n, p = 10, 0.25


## n, p = 10, 0.25


choose(152,2)*0.999^150*0.001^3

dnbinom(150,size=3,p=0.001)

## from  scipy.special import binom


pnbinom(150,3,0.001)

## nbinom.cdf(150,n=3,p=0.001)


## params = nbinom.stats(n=3,p=0.001,moments='mv')


fluidPage(
fluidRow(
  column(6,
         sliderInput("n_binomP", label = "Número de repeticiones n:",
              min = 1, max = 100, value =20 , step = 1)),
  column(6,
          sliderInput("p_binomP", label = "Probabilidad éxito p:",
                     min = 0.001, max = 0.9, value = 0.05, step = 0.001)
         )
  )
)

renderPlot({
  n=input$n_binomP
  pr=input$p_binomP
  par(mfrow=c(1,2))
  aux=rep(0,(n+1)*2)
  aux[seq(2,(n+1)*2,2)]=dbinom(c(0:n),size=n,prob=pr)
  plot(x=c(0:n),y=dbinom(c(0:n),size=n,prob=pr),
       ylim=c(0,0.6),xlim=c(-1,n+1),xlab="x",ylab="Función de probabilidad",
       main=paste0(c("Funciones de probabilidad\n B(n=",n,",p=",pr,"), Po(lambda=",n*pr,")"),collapse = ""))
  lines(x=rep(0:n,each=2),y=aux,pch=21, type = "h", lty = 2,col="blue")
  aux=rep(0,(n+1)*2)
  aux[seq(2,(n+1)*2,2)]=dpois(c(0:n),n*pr)
  points(x=c(0:n),y=dpois(c(0:n),n*pr),
       ylim=c(0,0.6),xlim=c(-1,n+1),xlab="x",pch=25,col="red")
  lines(x=rep(0:n,each=2),y=aux, type = "h", lty = 3,col="red")
  legend("topleft",legend=c("Binomial","Poisson"),col=c("blue","red"),pch=c(21,25),lty=c(2,3),bty = "n")
  curve(pbinom(x,size=n,p=pr),
        xlim=c(-1,n+1),col="blue",ylab="Función de Distribución",
         main=paste0(c("Funciones de distribución \n B(n=",n,",p=",pr,"), Po(lambda=",n*pr,")"),collapse = ""))
  curve(ppois(x,n*pr),
        xlim=c(-1,n+1),col="red",add=TRUE)
  if(all(c(n>=20,n*pr<10,pr<= 0.05))){aux_l="Condición\n TRUE"} else {aux_l="Condición\n FALSE"}
  legend("topleft",legend=c(aux_l,paste0("n=",n),paste0("n*p=",n*pr),paste0("p=",pr)),bg="transparent",cex=0.8,bty = "n")
  par(mfrow=c(1,1))
})


20^21/factorial(21)*exp(-20)
dpois(21,lambda = 20)

dpois(0,lambda = 3)
dpois(1,lambda = 3)

ppois(0,lambda = 3)
ppois(1,lambda = 3)
dpois(0,lambda = 3)+dpois(1,lambda = 3) ## es igual a ppois(1,lambda=3)

dpois(0:10,3)
sum(dpois(0:10,3))
ppois(10,3)

rpois(n=100,lambda = 3)

dpois(21,lambda=20)# P(X=21)

ppois(5,lambda=20)
1-ppois(5,lambda=20) # es 1-P(X<=5)=P(X>=6)
ppois(5,lambda=20,lower.tail =FALSE ) # acumula hacia arriba P(X>5)=P(X>=6)=P(X=6)+P(X=7)+...

## lambda=20
## par(mfrow=c(1,2))
## n=qpois(0.99,lambda=lambda)
## aux=rep(0,(n+1)*2)
## aux[seq(2,(n+1)*2,2)]=dpois(c(0:n),lambda=lambda)
## ymax=max(ppois(0:n,lambda=lambda))
## plot(x=c(0:n),y=dpois(c(0:n),lambda=lambda),
##      ylim=c(0,ymax),xlim=c(-1,n+1),xlab="x",ylab="Función de probabilidad",
##      main=paste0(c("Función de probabilidad\n  Po(lambda=",lambda,")"),collapse = ""))
## lines(x=rep(0:n,each=2),y=aux,pch=21, type = "h", lty = 2,col="blue")
## curve(ppois(x,lambda=lambda),
##       xlim=c(-1,n+1),col="blue",ylab="Función de Distribución",
##       main=paste0(c("Función de distribución \n Po(lambda=",lambda,")"),collapse = ""))
## par(mfrow=c(1,1))

lambda=20
par(mfrow=c(1,2))
n=qpois(0.99,lambda=lambda)
aux=rep(0,(n+1)*2)
aux[seq(2,(n+1)*2,2)]=dpois(c(0:n),lambda=lambda)
ymax=max(ppois(0:n,lambda=lambda))
plot(x=c(0:n),y=dpois(c(0:n),lambda=lambda),
     ylim=c(0,ymax),xlim=c(-1,n+1),xlab="x",ylab="Función de probabilidad",
     main=paste0(c("Función de probabilidad\n  Po(lambda=",lambda,")"),collapse = ""))
lines(x=rep(0:n,each=2),y=aux,pch=21, type = "h", lty = 2,col="blue")
curve(ppois(x,lambda=lambda),
      xlim=c(-1,n+1),col="blue",ylab="Función de Distribución",
      main=paste0(c("Función de distribución \n Po(lambda=",lambda,")"),collapse = ""))
par(mfrow=c(1,1))


sliderInput("lambda", label = "Promedio de eventos lambda",
              min = 1, max = 100, value =20 , step = 1)
renderPlot({
  lambda=input$lambda
  par(mfrow=c(1,2))
  n=qpois(0.99,lambda=lambda)
  #n
  aux=rep(0,(n+1)*2)
  aux[seq(2,(n+1)*2,2)]=dpois(c(0:n),lambda=lambda)
  ymax=0.45
  plot(x=c(0:n),y=dpois(c(0:n),lambda=lambda),
       ylim=c(0,ymax),xlim=c(-1,n+1),xlab="x",ylab="Función de probabilidad",
       main=paste0(c("Función de probabilidad\n  Po(lambda=",lambda,")"),collapse = ""))
  lines(x=rep(0:n,each=2),y=aux,pch=21, type = "h", lty = 2,col="blue")
  curve(ppois(x,lambda=lambda),
        xlim=c(-1,n+1),col="blue",ylab="Función de Distribución",
         main=paste0(c("Función de distribución \n Po(lambda=",lambda,")"),collapse = ""))
  par(mfrow=c(1,1))
})

## from scipy.stats import poisson


## poisson.cdf(0,mu = 3)


## range(0,10)


## poisson.pmf(21,mu=20)


## 1-poisson.cdf(5,mu=20)


## poisson.stats(mu=3, moments='mv')


## poisson.rvs(mu=3,size=40)


## from scipy.stats import poisson


## from scipy.stats import poisson



fluidPage(
fluidRow(
  column(6,
         sliderInput("lambdapp", label="Promedio eventos por unidad de tiempo",
              min = 0.1, max = 50, value =10 , step = 0.01)
         ),
  column(6,
          sliderInput("t", label = "Intervalo de tiempo (0,t]",
                     min = 1, max = 120, value =1 , step = 0.5)
         )
 )
)


renderPlot({
  lambda1=input$lambdapp
  t=input$t
  lambda=lambda1*t# es lambda* t
  par(mfrow=c(1,2))
  n=qpois(0.99,lambda=lambda)
  #n
  aux=rep(0,(n+1)*2)
  aux[seq(2,(n+1)*2,2)]=dpois(c(0:n),lambda=lambda)
  ymax=ppois(which.max(ppois(0:n,lambda))-1,lambda)*0.7
  plot(x=c(0:n),y=dpois(c(0:n),lambda=lambda),
       ylim=c(0,ymax),xlim=c(-1,n+1),xlab="x",ylab="Función de probabilidad",
       main=paste0(c("Función de probabilidad\n  Po(lambda=",lambda,")"),collapse = ""))
  lines(x=rep(0:n,each=2),y=aux,pch=21, type = "h", lty = 2,col="blue")
  curve(ppois(x,lambda=lambda),
        xlim=c(-1,n+1),col="blue",ylab="Función de Distribución",
         main=paste0(c("Función de distribución \n Po(lambda=",lambda,")"),collapse = ""))
  par(mfrow=c(1,1))
  })

1-dpois(25,lambda=3)

6^0/factorial(0)*exp(-6)
ppois(0,lambda=3*2)

c(choose(15,2), choose(10,1), choose(25,3))

## phyper(2,15,10,3)

dhyper(x=2,m=15,10,k=3)
phyper(q=1,m=15,n=10,k=3)# sí, le han puesto q ya veremos el porqué
1-phyper(q=1,m=15,n=10,k=3)

rhyper(nn=200,m=15,n=10,k=3)

par(mfrow=c(1,2))
m=15
n=10
k=3
a=max(c(0,k-n))
b=min(c(m,k))
l=b-a+1
aux=rep(0,2*l)
aux[seq(2,2*l,2)]=dhyper(c(a:b),m=m,n=n,k=k)
x=a:b
plot(x,y=dhyper(x,m=m,n=n,k=k),
  ylim=c(0,0.6),xlim=c(a-1,b+1),xlab="x",
  main=paste0("Función de probabilidad\n H(m=",m,", n=",n,", k=",k,")"))
lines(x=rep(a:b,each=2),y=aux, type = "h", lty = 2,col="blue")
curve(phyper(x,m=m,n=n,k=k),
  xlim=c(a-1,b+1),col="blue",
  main=paste0("Función de distribución\n H(m=",m,", n=",n,", k=",k,")"))
par(mfrow=c(1,1))

fluidPage(
fluidRow(
  column(4,
         sliderInput("mh", label = "Número de bolas blancas m",
              min = 1, max = 50, value =15, step = 1)),
  column(4,
         sliderInput("nh", label = "Número de bolas rojas n",
              min = 1, max = 50, value =10 , step = 1)),
  column(4,
          sliderInput("kh", label = "Número bolas extraídas k",
                     min = 1, max=25, value = 3, step = 1)
         )
  )
)

renderPlot({
  m=input$mh
  n=input$nh
  k=input$kh
  #n=10
  #k=3
  #m=15
  par(mfrow=c(1,2))
  a=max(c(0,k-n))
  b=min(c(m,k))
  l=b-a+1
  aux=rep(0,times=2*l)
  aux[seq(2,2*l,2)]=dhyper(c(a:b),m=m,n=n,k=k)
  x=a:b
  plot(x,y=dhyper(x,m=m,n=n,k=k),
       ylim=c(0,0.6),xlim=c(a-1,b+1),xlab="x",
       main=paste0("Función de probabilidad\n H(m=",m,", n=",n,", k=",k,")"))
  lines(x=rep(a:b,each=2),y=aux, type = "h", lty = 2,col="blue")
  curve(phyper(x,m=m,n=n,k=k),
        xlim=c(a-1,b+1),col="blue",
        main=paste0("Función de distribución\n H(m=",m,", n=",n,", k=",k,")"))
  par(mfrow=c(1,1))
})


fluidPage(
fluidRow(
  column(4,
         sliderInput("mh2", label = "Número de bolas blancas m",
              min = 1, max = 50, value =15, step = 1)),
  column(4,
         sliderInput("nh2", label = "Número de bolas rojas n",
              min = 1, max = 50, value =10 , step = 1)),
  column(4,
          sliderInput("kh2", label = "Número bolas extraídas k",
                     min = 1, max=25, value = 3, step = 1)
         )
  )
)

renderPlot({
  m=input$mh2
  n=input$nh2
  k=input$kh2
  #n=10
  #k=3
  #m=15
  pr=round(m/(n+m),4)
  a=max(c(0,k-n))
  b=min(c(m,k))
  l=b-a+1
  aux=rep(0,times=2*l)
  auxB=rep(0,times=2*(k+1))
  aux[seq(2,2*l,2)]=dhyper(c(a:b),m=m,n=n,k=k)
  x=a:b
  auxB[seq(2,2*(k+1),2)]=dbinom(0:k,k,pr)
  par(mfrow=c(1,2))
  plot(x=c(0:k),y=dbinom(c(0:k),size=k,prob=pr),
       ylim=c(0,0.6),xlim=c(-1,k+1),xlab="x",ylab="Función de probabilidad",
       main=paste0("Funciones de probabilidad\n B(n=",n,"p=",pr,")  H(m=",m,"n=", n,"k=",k,")"))
  lines(x=rep(0:k,each=2),y=aux,pch=21, type = "h", lty = 2,col="blue")
  #aux=rep(0,(n+1)*2)
  #aux[seq(2,(n+1)*2,2)]=dpois(c(0:n),n*pr)
  points(x=c(a:b),y=dhyper(c(a:b),m=m,n=n,k=k),
         ylim=c(0,0.6),xlim=c(-1,k+1),xlab="x",pch=25,col="red")
  lines(x=rep(0:(l-1),each=2),y=aux, type = "h", lty = 3,col="red")
  legend("topleft",legend=c("Binomial","Hipergeométrica"),col=c("blue","red"),pch=c(21,25),lty=c(2,3))
  curve(pbinom(x,size=k,p=pr),
        xlim=c(-1,k+1), col="blue", ylab="Función de Distribución",
         main=paste0("Funciones de distribución\n B(",k,",",pr,") H(m=",m,"n=", n,"k=",k,")"))
  curve(phyper(x,m=m,n=n,k=k),
        xlim=c(-1,k+1),col="red",add=TRUE)
  #if(all(c(n>=20,n*pr<10,pr<= 0.05))){aux_l="Condición VERDADERA"} else {aux_l="Condición FALSA"}
  #legend("topleft",legend=c(aux_l,paste0("n=",n),paste0("n*p=",n*pr),paste0("p=",pr)),bg="transparent",cex=0.5)
  par(mfrow=c(1,1))
})

## from scipy.stats import hypergeom


## hypergeom.pmf(1,M=15+10,n=15,N=3)


## hypergeom.rvs(M=15+10,n=15,N=3,size=100)


## from scipy.stats import hypergeom


## from scipy.stats import hypergeom

