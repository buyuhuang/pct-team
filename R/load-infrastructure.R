# Aim: load the hs2 data
library(tmap)
library(mapview)
library(rgdal)

# hs2codes = readxl::read_excel("/tmp/HS2 Cycleway Codes.xlsx")
# saveRDS(hs2codes, "input-data/hc.Rds")
#
# hs2route = tmap::read_shape("/tmp/HS2_Cycleway_Ph2_01022016.shp")
# mapview(hs2route)
# names(hs2route)
# saveRDS(hs2route, "input-data/hrc.Rds")
#
# u = "http://www.thehs2.com/phase1/kmls/b/all.kml"
# download.file(u, "/tmp/all1.kml")
# ogrListLayers("/tmp/all1.kml")
# hs21 = readOGR("/tmp/all1.kml", layer = "HS2 phase 1: post consultation route")
# mapview(hs21)
# saveRDS(hs21, "input-data/hs21.Rds")
# geojsonio::geojson_write(hs21, file = "input-data/hs21.geojson")

# u = "http://www.thehs2.com/phase2/kmls/b/all.kml"
# download.file(u, "/tmp/all2.kml")
# ogrListLayers("/tmp/all2.kml")
# hs22 = readOGR("/tmp/all2.kml", layer = "HS2 phase 2: consultation route")
# mapview(hs22)
# saveRDS(hs22, "input-data/hs22.Rds")
# geojsonio::geojson_write(hs22, file = "input-data/hs22.geojson")
#
# names(hs21)
# names(hs22)
# hs22@data = hs22@data[names(hs22) %in% names(hs21)]
# hs2 = sbind(hs21, hs22)
# plot(hs2)
# saveRDS(hs2, "input-data/hs2.Rds")
hc = readRDS("input-data/hc.Rds")
hs2 = readRDS("input-data/hs2.Rds")

# hs2net = read_shape("HS2_Cycleway_Ph2_01022016.shp")
# hs2net = spTransform(hs2net, CRSobj = CRS("+init=epsg:4326"))
# saveRDS(hs2net, "input-data/hs2net.Rds")
hs2net = readRDS("input-data/hs2net.Rds")

# lewes_uckfield = read_shape("D:/tmp/shapefile/L_U.shp")
# bbox(lewes_uckfield)
# proj4string(lewes_uckfield) = CRS("+init=epsg:27700")
# lewes_uckfield = spTransform(lewes_uckfield, CRS("+init=epsg:4326"))
# saveRDS(lewes_uckfield, "input-data/lewes_uckfield.Rds")
lewes_uckfield = readRDS("input-data/lewes_uckfield.Rds")

# tmap_mode("view")
# qtm(hs2net, line.col = "HS2_Phase", line.lwd = 3) +
#   qtm(hs2, line.col = "black") +
#   qtm(lewes_uckfield, line.col = "blue")


