library(ona)
library(tidyr)
#Read in the data
Tdata <- onaDownload('Farmers_1_1','samwata','samwata','92samson19')
Tdata <- as.data.frame(Tdata)
# Recode Region variables
levels(Tdata$location)[levels(Tdata$location)==1] <- 'Nairobi'
levels(Tdata$location)[levels(Tdata$location)==2] <- 'Mombasa'
levels(Tdata$location)[levels(Tdata$location)==3] <- 'Kisumu'
#Seperate crops columns
Tdata <- separate(data = Tdata, col = crops_owned, 
                      into = c("Crop1", "Crop2","Crop3","Crop4","Crop5"), sep = " ")
#Recode Crops
Tdata$Crop1 <- replace(Tdata$Crop1, Tdata$Crop1=="1", "Maize")
Tdata$Crop1 <- replace(Tdata$Crop1, Tdata$Crop1=="2", "Millet")
Tdata$Crop1 <- replace(Tdata$Crop1, Tdata$Crop1=="3", "Wheat")
Tdata$Crop1 <- replace(Tdata$Crop1, Tdata$Crop1=="4", "Beans")
Tdata$Crop1 <- replace(Tdata$Crop1, Tdata$Crop1=="5", "Peas")

Tdata$Crop2 <- replace(Tdata$Crop2, Tdata$Crop2=="1", "Maize")
Tdata$Crop2 <- replace(Tdata$Crop2, Tdata$Crop2=="2", "Millet")
Tdata$Crop2 <- replace(Tdata$Crop2, Tdata$Crop2=="3", "Wheat")
Tdata$Crop2 <- replace(Tdata$Crop2, Tdata$Crop2=="4", "Beans")
Tdata$Crop2 <- replace(Tdata$Crop2, Tdata$Crop2=="5", "Peas")

Tdata$Crop3 <- replace(Tdata$Crop3, Tdata$Crop3=="1", "Maize")
Tdata$Crop3 <- replace(Tdata$Crop3, Tdata$Crop3=="2", "Millet")
Tdata$Crop3 <- replace(Tdata$Crop3, Tdata$Crop3=="3", "Wheat")
Tdata$Crop3 <- replace(Tdata$Crop3, Tdata$Crop3=="4", "Beans")
Tdata$Crop3 <- replace(Tdata$Crop3, Tdata$Crop3=="5", "Peas")

Tdata$Crop4 <- replace(Tdata$Crop4, Tdata$Crop4=="1", "Maize")
Tdata$Crop4 <- replace(Tdata$Crop4, Tdata$Crop4=="2", "Millet")
Tdata$Crop4 <- replace(Tdata$Crop4, Tdata$Crop4=="3", "Wheat")
Tdata$Crop4 <- replace(Tdata$Crop4, Tdata$Crop4=="4", "Beans")
Tdata$Crop4 <- replace(Tdata$Crop4, Tdata$Crop4=="5", "Peas")


Tdata$Crop5 <- replace(Tdata$Crop5, Tdata$Crop5=="1", "Maize")
Tdata$Crop5 <- replace(Tdata$Crop5, Tdata$Crop5=="2", "Millet")
Tdata$Crop5 <- replace(Tdata$Crop5, Tdata$Crop5=="3", "Wheat")
Tdata$Crop5 <- replace(Tdata$Crop5, Tdata$Crop5=="4", "Beans")
Tdata$Crop5 <- replace(Tdata$Crop5, Tdata$Crop5=="5", "Peas")

#Merge crops
Tdata$Crops <- paste(Tdata$Crop1,Tdata$Crop2,Tdata$Crop3,Tdata$Crop4,Tdata$Crop5,sep=",")
Tdata <- as.data.frame(Tdata)

#Seperate Training columns
Tdata <- separate(data = Tdata, col = training_attended, 
                  into = c("T1", "T2","T3","T4","T5"), sep = " ")
#Recode Trainings
Tdata$T1 <- replace(Tdata$T1, Tdata$T1=="1", "Agri-mix training program")
Tdata$T1 <- replace(Tdata$T1, Tdata$T1=="2", "Cattle management program")
Tdata$T1 <- replace(Tdata$T1, Tdata$T1=="3", "Dairy training program")
Tdata$T1 <- replace(Tdata$T1, Tdata$T1=="4", "Custom harvesting program")
Tdata$T1 <- replace(Tdata$T1, Tdata$T1=="5", "Fieldcrop training program")

Tdata$T2 <- replace(Tdata$T2, Tdata$T2=="1", "Agri-mix training program")
Tdata$T2 <- replace(Tdata$T2, Tdata$T2=="2", "Cattle management program")
Tdata$T2 <- replace(Tdata$T2, Tdata$T2=="3", "Dairy training program")
Tdata$T2 <- replace(Tdata$T2, Tdata$T2=="4", "Custom harvesting program")
Tdata$T2 <- replace(Tdata$T2, Tdata$T2=="5", "Fieldcrop training program")

Tdata$T3 <- replace(Tdata$T3, Tdata$T3=="1", "Agri-mix training program")
Tdata$T3 <- replace(Tdata$T3, Tdata$T3=="2", "Cattle management program")
Tdata$T3 <- replace(Tdata$T3, Tdata$T3=="3", "Dairy training program")
Tdata$T3 <- replace(Tdata$T3, Tdata$T3=="4", "Custom harvesting program")
Tdata$T3 <- replace(Tdata$T3, Tdata$T3=="5", "Fieldcrop training program")

Tdata$T4 <- replace(Tdata$T4, Tdata$T4=="1", "Agri-mix training program")
Tdata$T4 <- replace(Tdata$T4, Tdata$T4=="2", "Cattle management program")
Tdata$T4 <- replace(Tdata$T4, Tdata$T4=="3", "Dairy training program")
Tdata$T4 <- replace(Tdata$T4, Tdata$T4=="4", "Custom harvesting program")
Tdata$T4 <- replace(Tdata$T4, Tdata$T4=="5", "Fieldcrop training program")

Tdata$T5 <- replace(Tdata$T5, Tdata$T5=="1", "Agri-mix training program")
Tdata$T5 <- replace(Tdata$T5, Tdata$T5=="2", "Cattle management program")
Tdata$T5 <- replace(Tdata$T5, Tdata$T5=="3", "Dairy training program")
Tdata$T5 <- replace(Tdata$T5, Tdata$T5=="4", "Custom harvesting program")
Tdata$T5 <- replace(Tdata$T5, Tdata$T5=="5", "Fieldcrop training program")

#Merge Trainings
Tdata$Trainings <- paste(Tdata$T1,Tdata$T2,Tdata$T3,Tdata$T4,Tdata$T5,sep=",")

#Save file
setwd("D:\\Jmunene@Ona\\Dashboards\\Technoserve\\Techno_serve")
write.csv(Tdata,file="Tdata.csv",row.names = FALSE)

