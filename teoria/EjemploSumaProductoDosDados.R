resultados=1:6

res2=c()
for (i in 1:6){for (j in 1:6){res2=rbind(res2,c(matriz.sum[i,j],matriz.prod[i,j]))}}
resultados.suma = sort(unique(res2[,1]))
resultados.producto = sort(unique(res2[,2]))
frecuencias.absolutas.conjuntas=matrix(0,length(resultados.suma),length(resultados.producto))
row.names(frecuencias.absolutas.conjuntas)=resultados.suma
colnames(frecuencias.absolutas.conjuntas)=resultados.producto
for (i in 1:dim(res2)[1]){
    frecuencias.absolutas.conjuntas[resultados.suma==res2[i,1],resultados.producto==res2[i,2]]=
      frecuencias.absolutas.conjuntas[resultados.suma==res2[i,1],resultados.producto==res2[i,2]]+1
}

función.probabilidad.conjunta = frecuencias.absolutas.conjuntas/36 

# esperanza suma

matriz.sum = outer(as.integer(rownames(función.probabilidad.conjunta)),
                   as.integer(colnames(función.probabilidad.conjunta)),"+")

esperanza.suma = sum(matriz.sum*función.probabilidad.conjunta)
esperanza.suma


# esperanza producto

matriz.prod = outer(as.integer(rownames(función.probabilidad.conjunta)),
                   as.integer(colnames(función.probabilidad.conjunta)),"*")

esperanza.producto = sum(matriz.prod*función.probabilidad.conjunta)
esperanza.producto
