# Ejercicio 6.2 

# Especificamos los parametros 
p<- c(0.3, 0.7)
lambda<- c(4, 0.5)
njumps<- 20

# Especificamos los tiempos y estados como dataframes
time<- data.frame()
N<- data.frame()

# Especificamos seed
set.seed(6335044)

# Simulamos las trayectorias
for(j in 1:5) {
  # Fijamos el valor de la tasa
  Lambda<- lambda[sample(1:2, 1, prob=p)]
  # Ajuste de los valores iniciales
  time[1,j]<- 0
  N[1,j]<- 0
  # Simulación de trayectoria
  i<- 2
  repeat {
    time[i,j]<- time[i-1,j]+round((-1/Lambda)*log(1-runif(1)),3)
    -0.001
    N[i,j]<- N[i-1,j]
    if(i==2*njumps+2) break
    else {
      time[i+1,j]<- time[i,j]+0.001
      N[i+1,j]<- N[i,j]+1
      i<- i+2
    }
  }
}

# Ploteamos la trayectoria
matplot(time, N, type="l", lty=1, lwd=2, col=c("blue",
                                               "green", "red", "purple", "orange"), xlab="Time",
        ylab="State", panel.first=grid())
