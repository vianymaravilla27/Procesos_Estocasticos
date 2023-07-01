# Ejercicio 6.2.2

#specifying parameters
t<- 30
p<- c(0.3, 0.7)
lambda<- c(4, 0.5)
#specifying states and times as data frames
time<- data.frame()
N<- data.frame()
#specifying seed
set.seed(1902238)
#simulating trajectories
for(j in 1:5) {
  #fixing the value for rate
  Lambda<- lambda[sample(1:2, 1, prob=p)]
  #setting initial values
  time[1,j]<- 0
  N[1,j]<- 0
  #generating total number of jumps
  njumps<- rpois(1,Lambda*t)
  #generating standard uniforms
  u<- c()
  u[1]<- 0
  for(i in 2:njumps)
    u[i]<- runif(1)
  #computing event times
  s<- t*sort(u)
  #generating jumps
  for (i in seq(2, 2*njumps, 2)) {
    time[i,j]<- s[i/2]-0.001
    time[i+1,j]<- s[i/2]
    N[i,j]<- N[i-1,j]
    N[i+1,j]<- N[i-1,j]+1
  }
}
#plotting trajectories
matplot(time, N, type="l", lty=1, lwd=2, col=c("blue",
                                               "green", "red", "purple", "orange"), xlab="Time",
        ylab="State", panel.first=grid())
  