# Ejercicio 5.2 

# Especificamos parametros
t<- 20
lambda<- 0.75

# Especificamos el seed
set.seed(41130)

# Generamos el número de llegadas
narrivals<- rpois(1,lambda*t)

# Definimos los vectores
gain<- c()
time<- c()
u<- c()

# Ajuste de los valores iniciales
gain[1]<- 0
u[1]<- 0

# Generación de uniformes y ganancia estandar
for(i in 2:(narrivals+1)) {
  u[i]<- runif(1)
  gain[i]<- gain[i-1] + runif(1,0, 1500)
}

# Cálculo de los tiempos de los eventos 
time<- t*sort(u)

# Trazamos la trayectoria
plot(time, gain, type="n", ylim=c(0,13000), xlab="Time
(min)", ylab="Casino gain ($)", panel.first = grid())
segments(time[-length(time)], gain[-length(time)],
         time[-1]-0.15, gain[-length(time)], lwd=2, col="blue")
points(time, gain, pch=20, col="blue")
points(time[-1], gain[-length(time)], pch=1, col="blue")
