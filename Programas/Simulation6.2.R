# Simulación 6.2

# Especificación de los parámetros
t<- 30
p<- c(0.3, 0.7)
lambda<- c(4, 0.5)

# Especificación de los estados y tiempos como dataframes
time<- data.frame()
N<- data.frame()

# Especificación del seed
set.seed(1902238)

# Simulación de la trayectoria
for(j in 1:5)  {

# Fijamos el valor de tasa
Lambda<- lambda[sample(1:2, 1, prob=p)]

# Ajuste de los valores iniciales
time[1,j]<- 0
N[1,j]<- 0

# Gerenación del número total de saltos
njumps<- rpois(1,Lambda*t)

# Generación estandar uniforme
u<- c()
u[1]<- 0
for (i in 2:njumps)
u[i]<- runif(1)

# Cálculo de los tiempos de los eventos
s<- t*sort(u)

# Generación de saltos
for (i in seq(2, 2*njumps, 2)) {
  time[i,j]<- s[i/2]-0.001
  time[i+1,j]<- s[i/2]
  N[i,j]<- N[i-1,j]
  N[i+1,j]<- N[i-1,j]+1
    }
}

# Ploteo de trayectorias simuladas
matplot(time, N, type="l", lty=1, lwd=2, col=c("blue", "green", 
"red", "purple", "orange"), xlab="Time", ylab="State", panel.first=grid())

