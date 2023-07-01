# Simulación 6.1

# Especificación de parámetros
p<- c(0.3,0.7)
lambda<- c(4, 0.5)
njumps<- 20

# Especificación de los estads y tiempos como dataframes
time<- data.frame()
N<- data.frame()

# Especificación del seed
set.seed(6335044)

# Simulación de la trayectoria
for(j in 1:5)  {
  
# Fijamos el valor de tasa
Lambda<- lambda[sample(1:2, 1, prob=p)]

# Ajuste de los valores iniciales 
time[1,j]<- 0
N[1,j]<- 0

# Simulación de la trayectoria
i<- 2

repeat {
time[i,j]<- time[i-1,j]+round((-1/Lambda)*log(runif(1)),3)-0.001
N[i,j]<- N[i-1,j]
  
if(i==2*njumps+2) break
else {
  time[i+1,j]<- time[i,j]+0.001
    N[i+1,j]<- N[i,j]+1
      i<- i+2
   }
}
}

# Ploteo de la trayectoria
matplot(time, N, type="l", lty=1, lwd=2, col=c("blue", "green", "red", 
"purple", "orange"), xlab="Time", ylab="State",
panel.first=grid())

