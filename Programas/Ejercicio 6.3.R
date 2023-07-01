# Ejercicio 6.3

#specifying parameters
r<- 5
l<- 2
t<- -r*l
lambda0 <- 3
#computing probabilities
prob<- c()
M<- expression(exp(lambda0*(exp(t)-1)))
prob[1]<- eval(M)
for (n in 2:11) {
  M<- D(M,"t")
  prob[n]<- (r*l)ˆn/factorial(n)*eval(M)
}
prob
