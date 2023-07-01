# Simulación 5.2 

# Especificación de los parámetros
t<- 20
lambda<- 0.75

# Especificación del seed
set.seed(41130)

# Generamos el numero de llegadas
narrivals<- rpois(1,lambda*t)

# Definición de vectores
gain<- c()
time<- c()
u<- c()

# Ajuste de los valores iniciales
gain[1]<- 0
u[1]<- 0

# Generación estandar de uniformes y ganancia
for(i in 2:(narrivals+1)) {
  u[i]<- runif(1)
  gain[i]<- gain[i-1] + runif(1,0, 1500)
}

# Cálculo de los tiempos de los eventos
time<- t*sort(u)

# Ploteo de la trayectoria
plot(time, gain, type="n", ylim=c(0,13000), xlab="Time (min)", ylab="Casino gain ($)",  
panel.first = grid())

segments(time[-length(time)], gain[-length(time)], time[-1]-0.15, 
gain[-length(time)], lwd=2, col="blue")

points(time, gain, pch=20, col="blue")
points(time[-1], gain[-length(time)], pch=1, col="blue")

narrivals
gain[length(gain)]
