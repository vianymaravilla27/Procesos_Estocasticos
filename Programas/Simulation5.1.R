# Simulación 5.1

# Especificación de los parámetros
lambda<- 0.75
narrivals<- 20

# Definimos la ganancia del casino y el tiempo como vector
gain<- c()
time<- c()

# Ajuste de los valores iniciales
gain[1]<- 0
time[1]<- 0

# Especificación del seed
set.seed(50094)

# Simulación de la trayectoria
for (i in 2:(narrivals+1)) {
  time[i]<- time[i-1] - 1/lambda*log(runif(1))
   gain[i]<- gain[i-1] + runif(1,0, 1500)
}

# Ploteo de la trayectoria
plot(time, gain, type="n", ylim=c(0,14000), xlab="Time (min)", ylab="Casino gain ($)",  
panel.first=grid())

segments(time[-length(time)], gain[-length(time)], time[-1]-0.15, 
gain[-length(time)], lwd=2, col="blue")

points(time, gain, pch=20, col="blue")
points(time[-1], gain[-length(time)], pch=1, col="blue")


time[length(time)]
gain[length(time)]

