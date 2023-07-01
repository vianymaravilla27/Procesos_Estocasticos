# Aplicación5.1

storm.data<- read.csv(file="C:/Users/viane/Music/ESCOM/Procesos estocasticos/proyecto actualizado/stormdata.csv", 
header=TRUE, sep=",")

# Creación de la variable date-time 
storm.data$datetime<- as.POSIXct(paste(as.Date(storm.data$Date), storm.data$Time))

# Estimación de lambda
print(nevents<- nrow(storm.data))
print(ndays<- (as.numeric(storm.data$datetime[nevents])-as.numeric(storm.data$datetime[1]))/(24*3600))
print(lambda.hat<- nevents/ndays)

# Estimación de theta
print(theta<- 1.645*sqrt(mean(storm.data$Damage^2))/(sqrt(lambda.hat*ndays)*mean(storm.data$Damage)))
