# Cadenas de Markov del libro implementado en lenguaje R

tm<- matrix(c(1, 0, 0, 0, 0, 0.5, 0, 0, 0, 0.5, 0.2, 0, 0, 0, 0.8,
              0, 0, 1, 0, 0, 0, 0, 0, 1, 0), nrow=5, ncol=5, byrow=TRUE)
tm.tr <- t(tm)
library(diagram)

# Ploteo del diagrama
library(diagram)
plotmat(tm.tr, arr.length=0.25, arr.width=0.1, box.col="light blue",
        box.lwd=1, box.prop=0.5, box.size=0.12, box.type="circle", cex.txt=0.8,
        lwd=1, self.cex=0.3, self.shiftx=0.01, self.shifty=0.09)

# Cadenas de Markov
library(markovchain)
mc<- new("markovchain", transitionMatrix=tm,states=c("1", "2", "3", "4", "5"))

# 
recurrentClasses(mc)

transientClasses(mc)# 1

absorbingStates(mc) # 2, 3, 4, 5

# Below we simulate three trajectories of the chain that start at a randomly chosen state.
#specifying total number of steps
nsteps<- 25
#specifying seed
set.seed(4955145)
#specifying initial probability
p0<- c(0.2, 0.2, 0.2, 0.2, 0.2)
#specifying matrix containing states
MC.states<- matrix(NA, nrow=nsteps, ncol=3)
#simulating states
for (i in 1:3) {
  state0<- state0<- sample(1:5, 1, prob=p0)
  MC.states[,i]<- rmarkovchain(n=nsteps-1, object=mc, t0=state0,
                               include.t0=TRUE)
}
#plotting simulated trajectories
matplot(MC.states, type="l", lty=1, lwd=2, col=2:4, xaxt="n", ylim=c(1,5),
        xlab="Step", ylab="State", panel.first=grid())
axis(side=1, at=c(1,5,10,15,20,25))
points(1:nsteps, MC.states[,1], pch=16, col=2)
points(1:nsteps, MC.states[,2], pch=16, col=3)
points(1:nsteps, MC.states[,3], pch=16, col=4)
