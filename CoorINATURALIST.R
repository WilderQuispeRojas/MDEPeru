#WILDER_QUISPEPERU
##GIS & BIODIVERSIDAD
##wilderquispe163@gmail.com
##__________________________________________________
#Descargar coordendas de https://www.inaturalist.org
#install.packages("rinat")
library(rinat)
## Not run:
### Make a standard query
sp1 <- get_inat_obs(query="Passiflora mollissima")
##Filter by a bounding box of Northern California
head(sp1)
# how many rows and colums? 
dim(sp1)
#select the records that have longitude and latitude data
colnames(sp1)
#latitud 70, longitud 75
esp_geo1 <- subset(sp1,!is.na(scientific_name)& !is.na(longitude) & !is.na(latitude))
head(esp_geo1)
dim(esp_geo1)
especiee1<-data.frame(cbind(esp_geo1$scientific_name,esp_geo1$longitude, esp_geo1$latitude))
colnames(especiee1) = c("scientificName","lon", "lat")
head(especiee1)
###write.csv(especiee,"Polylepistarapacana.csv")
#install.packages("maptools")
library(maptools)
data(wrld_simpl)
#Donde xlim=c(-80,-60) es longitud and ylim=c(-25,0) es latitud
plot(wrld_simpl, xlim=c(-80,-75), ylim=c(-13,-5), axes=TRUE, col="light yellow")
# contorno de la map con:
box()
# plot points
points(especie_modela$Lon, especie_modela$Lat, col="red", pch=20, cex=0.75)
# plot points again to add a border, for better visibility
#points(especie_modela$lon, especie_modela$lat, col="red", cex=0.75)