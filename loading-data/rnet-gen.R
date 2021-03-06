# Purpose: to generate the network analysis layer from l and rf objects
source("set-up.R")

la <- "gm"

l <- readRDS(paste0("../pct-data/", la, "/l.Rds"))
rf <- readRDS(paste0("../pct-data/", la, "/rf.Rds"))

nrow(l) == nrow(rf)
system.time(
rft <- toptail(rf, toptail_dist = buff_geo_dist))
if(length(rft) == length(rf)){
  row.names(rft) <- row.names(rf)
  rft <- SpatialLinesDataFrame(rft, rf@data)
} else print("Error: toptailed lines do not match lines")
rft$base_olc <- l$base_olc
system.time(rnet <- overline(rft, "base_olc")) / 60
# test the resulting plot
plot(rnet, lwd = rnet$base_olc / mean(rnet$base_olc))
scens <- c("cdp_slc", "gendereq_slc", "dutch_slc", "ebike_slc")
for(i in scens){
  rft@data[i] <- l@data[i]
  rnet_tmp <- overline(rft, i)
  rnet@data[i] <- rnet_tmp@data[i]
  rft@data[i] <- NULL
}



rf$clc <- NULL


# test the resulting plot
plot(rnet, lwd = rnet$base_olc / mean(rnet$base_olc))

plot(rnet, lwd = rnet$cdp_slc / mean(rnet$base_olc))

object.size(rnet) / 1000000

raster::shapefile(rnet, "/tmp/rnet")
mapshape("/tmp/rnet.shp", percent = 5)

rnet <- shapefile("/tmp/rnetmapshaped_5%.shp")

object.size(rnet) / 1000000

mapview::mapview(rnet)

saveRDS(rnet, paste0("../pct-data/", la, "/rnet.Rds"))
rnet <- readRDS( paste0("../pct-data/", la, "/rnet.Rds"))
rf <- readRDS( paste0("../pct-data/", la, "/rf.Rds"))


# if that fails...
for(i in scens){
  print(paste0("Working on the ", i, " scenario"))
  rnet@data[i] <- rnet$base_olc
}


