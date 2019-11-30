# Benrnouilli

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


# Binomial

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




# Geometrica
 
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




# Binomial negativa


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



# No se quees


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

# Proceso Poisson
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


# Hipergeométrica


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



# Hipergeometrica

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



# Uniforme

fluidPage(
  fluidRow(
    column(4,
           sliderInput("a1", label = "Parámetro a",
                       min = -5, max = 9, value =0 , step = 0.1)
    ),
    column(4,
           sliderInput("b1", label = "Parámetro b",
                       min = 10, max = 15, value = 5, step = 0.1)
    ),
    column(4,
           sliderInput("x1", label="x", value=9, min = -5, max = 15, step = 0.1)
    )
    
  )
)

renderPlot({
  a=input$a1
  b=input$b1
  x=input$x1
  par(mfrow=c(1,2))
  #a=0;b=1;x=0.25
  xx=c(seq(min(a,x),min(b,x),by=0.001))
  curve(dunif(x,a,b),xlim=c(a-0.25,b+0.25),ylim=c(0,max(1/(b-a)+0.05,0.1)),col="blue",main=paste0("Función densidad U(",a,",",b,")"),
        ylab=paste0("dunif(x,",a,", ",b,")"),xaxt="n")
  axis(side=1, at=c(a,x,b), labels = TRUE)
  polygon(x=c(a,xx,min(x,b)),y=c(0,dunif(xx,a,b),0),
          density=20,col="skyblue")
  curve(punif(x,a,b),xlim=c(a-1,b+1),ylim=c(0,1.1),col="blue",main=paste0("Función de distribución U(",a,",",b,")"),
        ylab=paste0("punif(x,",a,", ",b,")"),xaxt="n",yaxt="n")
  segments(x0=x,y0=0,x1=x,y1=punif(x,a,b),col="red",lty=2)
  segments(x0=a-1.01,y0=punif(x,a,b),x1=x,y1=punif(x,a,b),col="red",lty=2)
  axis(side=2, at=c(0,round(punif(x,a,b),1),2), labels = TRUE)
  axis(side=1, at=c(a,x,b), labels = TRUE)
  par(mfrow=c(1,1))
})

# Binomial Poison cuantil

fluidPage(
  fluidRow(
    column(3,
           sliderInput("nq", label = "Par. n B(n,p)",
                       min = 1, max = 20, value =10 , step = 1)
    ),
    column(3,
           sliderInput("pq", label = "Par. p B(n,p)",
                       min = 0.01, max = 0.99, value = 0.5, step = 0.1)
    ),
    column(3,
           sliderInput("qq", label=" Cuantil q", value=0.75, min = 0.01, max = 0.99, step = 0.01)
    ),
    column(3,
           sliderInput("lq", label="Par. lambda Po(lambda)", value=5, min = 1, max = 20, step = 1)
    )
  )
)


renderPlot({
  n=input$nq
  p=input$pq
  q=input$qq
  lambda=input$lq
  par(mfrow=c(1,2))
  #n=10;p=0.5;q=0.75;lambda=5
  #xx=c(seq(min(a,x),min(b,x),by=0.001))
  probsB=pbinom(0:n,n,p)
  curve(pbinom(x,n,p),xlim=c(0-0.25,n+0.25),ylim=c(0,max(probsB+0.05,0.1)),
        col="blue",main=paste0("Función distribución\n B(n=",n,", p=",p,")"),
        ylab=paste0("dbinom(x,",n,", ",p,")"),yaxt="n")
  segments(x0 = qbinom(q,n,p),y0 = 0,x1 = qbinom(q,n,p),y1 = q,lty=2,col="red")
  segments(x0 = qbinom(q,n,p),y0 = q,x1 = -0.25,y1 = q,lty=2,col="red")
  ytick=c(0.0,q,1)
  axis(side=2, at=ytick, labels = TRUE)
  axis(side=1, at=qbinom(q,n,p), labels = TRUE)
  curve(ppois(x,lambda),xlim=c(0-0.25,2.5*lambda),ylim=c(0,1+0.1),
        col="blue",main=paste0("Función distribución \n Po(lambda=",lambda,")"),
        ylab=paste0("dpois(x, lambda",lambda,")"),yaxt="n")
  segments(x0 = qpois(q,lambda),y0 = 0,x1 = qpois(q,lambda),y1 = q,lty=2,col="red")
  segments(x0 = qpois(q,lambda),y0 = q,x1 = -0.25,y1 = q,lty=2,col="red")
  ytick=c(0.0,q,1)
  axis(side=2, at=ytick, labels = TRUE)
  axis(side=1, at=qpois(q,lambda), labels = TRUE)
  par(mfrow=c(1,1))
})





# Exponencial
fluidPage(
  fluidRow(
    column(4,
           sliderInput("le", label = "lambda",
                       min = 0.1, max = 3, value =1 , step = 0.1)
    ),
    column(4,
           sliderInput("xe", label = "X=x",
                       min = 0, max = 5, value = 5, step = 0.1)
    ),
    column(4,
           sliderInput("pe", label = "Cuantil p",
                       min = 0.01, max = 1, value = 0.75, step = 0.01)
    )
  )
)

renderPlot({
  lambda=input$le
  p=input$pe
  x=input$xe
  #lambda=10;p=0.75;x=0.4
  xx=seq(0,x,by=0.001)
  par(mfrow=c(1,2))
  curve(dexp(x,rate=lambda),xlim=c(-0.05,round(qexp(0.999,rate=lambda),2)),
        ylim=c(0,dexp(0,lambda)+0.1),col="blue",main=paste0("Función densidad Exp(",lambda,")"),
        ylab=paste0("dexp(x,",lambda,")"),xaxt="n")
  axis(side=1, at=c(0,x,round(qexp(0.999,rate=lambda),2)),cex.axis=0.8)
  polygon(x=c(0,xx,max(x,xx)),y=c(0,dexp(xx, rate=lambda),0),
          density=20,col="skyblue")
  curve(pexp(x,rate=lambda),xlim=c(0.01,qexp(0.999,rate=lambda)+0.1),ylim=c(0,1.1),col="blue",
        main=paste0("Función de distribución Exp(",lambda,")"),
        ylab=paste0("pexp(x,",lambda,")"),xaxt="n",yaxt="n")
  segments(x0=qexp(p,lambda),x1=qexp(p,lambda),y0=0,y1=p,col="red",lty=2)
  segments(x0=0-0.05,y0=p,x1=qexp(p,lambda),y1=p,col="red",lty=2)
  axis(side=2, at=seq(0,1,0.1), labels = TRUE)
  axis(side=1, at=seq(0,round(qexp(0.999,rate=lambda),2),by=0.1), labels = TRUE)
  par(mfrow=c(1,1))
})



fluidPage(
  fluidRow(
    column(3,
           sliderInput("m1", label = "mu1",
                       min = -10, max = 10, value =0 , step = 0.05)
    ),
    column(3,
           sliderInput("s1", label = "sigma1",
                       min =0.1, max = 5, value = 1, step = 0.1)
    ),
    column(3,
           sliderInput("m2", label="mu2", value=4, min = -10, max = 10, step = 0.05)
    ),
    column(3,
           sliderInput("s2", label = "sigma2",
                       min =0.1, max = 5, value = 1, step = 0.1)
    )
    
  )
)

renderPlot({
  m1=input$m1
  m2=input$m2
  s1=input$s1
  s2=input$s2
  mins2=min(c(s1^2,s2^2))
  m=min(c(qnorm(0.01,m1,s1),qnorm(0.01,m2,s2)))
  M=max(c(qnorm(0.99,m1,s1),qnorm(0.99,m2,s2)))
  
  curve(dnorm(x,m1,s1),xlim=c(m,M),ylim=c(0,1/sqrt(2*pi*mins2)),col="red",lty=1)
  legend("toplef",legend=c(expression(N(mu[1],sigma[1])),expression(N(mu[2],sigma[2]))),col=c("red","blue"),lty=c(1,2))
  curve(dnorm(x,m2,s2),add=TRUE,col="blue",lty=2)
})



