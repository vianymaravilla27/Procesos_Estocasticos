# Especificación de los parámetros
r<- 5
l<- 2
t<- -r*l
lambda0<- 3

# Calculo de probabilidades
prob<- c()
M<- expression(exp(lambda0*(exp(t)-1)))
prob[1]<- eval(M)

for (n in 2:11) {
  M<- D(M,"t")
prob[n]<- (r*l)^n/factorial(n)*eval(M)
}

prob
