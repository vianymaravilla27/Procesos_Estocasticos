""" “Simulación y visualización del comportamiento de 
acciones de empresas mediante cadenas de 
Markov y animaciones gráficas” """


"""Objetivo general:
Simular y visualizar el comportamiento de las acciones de diferentes empresas 
utilizando cadenas de Markov y animaciones gráficas"""

# Importar bibliotecas necesarias
import numpy as np # Procesar numeros
import matplotlib.pyplot as plt # Para hacer graficos 
import matplotlib.animation as anim # Para hacer graficas en vivo
from matplotlib import style # Para agregar estilo a las graficas 

# Definir los estados posibles
states = ["Incremento", "Decremento", "Sin cambios"]

# Definir las matrices de transición para cada MarkovChain
orMatrix = [[0.40, 0.40, 0.20],
            [0.39, 0.38, 0.23],
            [0.52, 0.25, 0.23]]

ggMatrix = [[0.54, 0.45, 0.01],
            [0.57, 0.43, 0.0],
            [1.0, 0.0, 0.0]]

fbMatrix = [[0.35, 0.58, 0.07],
            [0.54, 0.41, 0.05],
            [0.5, 0.42, 0.08]]

inMatrix = [[0.33, 0.47, 0.20],
            [0.47, 0.35, 0.18],
            [0.36, 0.41, 0.23]]


# Definir la clase MarkovChain para modelar las cadenas de Markov
class MarkovChain():
    def __init__(self, transMat, states):
        self.transMat = np.atleast_1d(transMat)   # Asigna la matriz de transición al atributo "transMat" de la instancia
        self.states = states                      # Asigna la lista de estados al atributo "states" de la instancia
        self.stateIndex = {self.states[i]: i for i in range(len(self.states))}
         # Crea un diccionario para mapear cada estado a su índice correspondiente
        self.state_dict = {i: self.states[i] for i in range(len(self.states))}
        # Crea un diccionario para mapear cada índice a su estado correspondiente


    def generateNext(self, currState): # Basada en el estado anterior y la matriz de transición pasa a otro estado
        return np.random.choice(self.states, p=self.transMat[self.stateIndex[currState], :])

    # Genera cadenas de Markov simuladas en una sola ejecución
    def simulateChain(self, currState, n): 
        generations = []                # Lista para almacenar los estados generados en cada iteración
        generations.append(currState)   # Agregar el estado inicial a la lista de generaciones
        xValues = []                    # Lista para almacenar los valores de x (iteraciones)
        xValues.append(0)               # Agregar el valor inicial de x (0) a la lista de valores x
        for i in range(n):
            nextGen = self.generateNext(currState)  # Generar el siguiente estado usando el método generateNext()
            generations.append(nextGen)             # Agregar el siguiente estado a la lista de generaciones
            xValues.append((i + 1) * 250)           # Calcular y agregar el valor de x correspondiente a esta iteración
            currState = nextGen                     # Actualizar el estado actual para la próxima iteración

        return xValues, generations, currState


# Crear instancias de MarkovChain para cada empresa
Oracle = MarkovChain(orMatrix, states)  
Google = MarkovChain(ggMatrix, states)
Facebook = MarkovChain(fbMatrix, states)
Intel = MarkovChain(inMatrix, states)


# Simular las cadenas de Markov para cada empresa con un estado inicial y un número de iteraciones o estados para inicial
orX, orY, orLatest = Oracle.simulateChain("Sin cambios", 200)
ggX, ggY, ggLatest = Google.simulateChain("Sin cambios", 200)
fbX, fbY, fbLatest = Facebook.simulateChain("Sin cambios", 200)
inX, inY, inLatest = Intel.simulateChain("Sin cambios", 200)


# Establecer el valor inicial para el precio de las acciones de cada empresa
orY[0] = 45000
ggY[0] = 45000
fbY[0] = 45000
inY[0] = 45000


# Actualizar los precios de las acciones de Oracle en cada iteración según el estado para poderlos plotear posteriormente
for i in range(1, len(orY)):
    if orY[i] == "Incremento":
        orY[i] = orY[i - 1] + 1000000
    elif orY[i] == "Decremento":
        orY[i] = orY[i - 1] - 1000000
    else:
        orY[i] = orY[i - 1]


# Actualizar los precios de las acciones de Google en cada iteración según el estado para poderlos plotear posteriormente
for i in range(1, len(ggY)):
    if ggY[i] == "Incremento":
        ggY[i] = ggY[i - 1] + 1000000
    elif ggY[i] == "Decremento":
        ggY[i] = ggY[i - 1] - 1000000
    else:
        ggY[i] = ggY[i - 1]


# Actualizar los precios de las acciones de Facebook en cada iteración según el estado para poderlos plotear posteriormente
for i in range(1, len(fbY)):
    if fbY[i] == "Incremento":
        fbY[i] = fbY[i - 1] + 1000000
    elif fbY[i] == "Decremento":
        fbY[i] = fbY[i - 1] - 1000000
    else:
        fbY[i] = fbY[i - 1]


# Actualizar los precios de las acciones de Intel en cada iteración según el estado para poderlos plotear posteriormente
for i in range(1, len(inY)):
    if inY[i] == "Incremento":
        inY[i] = inY[i - 1] + 1000000
    elif inY[i] == "Decremento":
        inY[i] = inY[i - 1] - 1000000
    else:
        inY[i] = inY[i - 1]


# Definir la función de animación para actualizar los gráficos en cada iteración 
def animate(i):
    global orLatest, ggLatest, fbLatest, inLatest

    orX.append(orX[-1] + 250)  # Agrega el siguiente valor de x (iteración) a la lista orX
    latest = Oracle.generateNext(orLatest)  # Genera el siguiente estado utilizando el método generateNext()
    orLatest = latest  # Actualiza el estado actual (orLatest) con el estado generado
    if orLatest == "Incremento":
       orY.append(orY[-1] + 1000000)  # Si el estado es "Incremento", agrega un valor incrementado a la lista orY
    elif orLatest == "Decremento":
       orY.append(orY[-1] - 1000000)  # Si el estado es "Decremento", agrega un valor decrementado a la lista orY
    else:
       orY.append(orY[-1])  # Si el estado es "Sin cambios", agrega el mismo valor anterior a la lista orY

    ggX.append(ggX[-1] + 250)
    latest = Google.generateNext(ggLatest)
    ggLatest = latest
    if ggLatest == "Incremento":
        ggY.append(ggY[-1] + 1000000)
    elif ggLatest == "Decremento":
        ggY.append(ggY[-1] - 1000000)
    else:
        ggY.append(ggY[-1])

    fbX.append(fbX[-1] + 250)
    latest = Facebook.generateNext(fbLatest)
    fbLatest = latest
    if fbLatest == "Incremento":
        fbY.append(fbY[-1] + 1000000)
    elif fbLatest == "Decremento":
        fbY.append(fbY[-1] - 1000000)
    else:
        fbY.append(fbY[-1])

    inX.append(inX[-1] + 250)
    latest = Intel.generateNext(inLatest)
    inLatest = latest
    if inLatest == "Incremento":
        inY.append(inY[-1] + 1000000)
    elif inLatest == "Decremento":
        inY.append(inY[-1] - 1000000)
    else:
        inY.append(inY[-1])

    ax1.clear()
    ax2.clear()
    ax3.clear()
    ax4.clear()

    ax1.plot(orX, orY, color="red", label='Oracle')
    ax2.plot(ggX, ggY, color="green", label='Google')
    ax3.plot(fbX, fbY, color="blue", label='Facebook')
    ax4.plot(inX, inY, color="cyan", label='Intel')

    ax1.legend(loc='best')
    ax2.legend(loc='best')
    ax3.legend(loc='best')
    ax4.legend(loc='best')


# Configurar el estilo del gráfico y crear la figura y los ejes
# Crear la animación y mostrar el gráfico
plt.style.use('fivethirtyeight')
fig, (ax1, ax2, ax3, ax4) = plt.subplots(4, 1) # Se hace las figuras con los 4 subplots 
fig.suptitle('Comportamiento de Acciones') # Se asigna un titulo 

ani = anim.FuncAnimation(fig, animate, interval= 50) # Se tiene la figura, la función que se encargará de ir iterando cada vez más y el intervalo en el que se verá la animación

plt.show()

"""Conclusión:
Oracle: Está estable a tráves del día pero tiende a mantenerse cerca del valor donde inicio 
Google: Va a la alza
Facebook: Va a la baja
Intel: Se mantiene"""
