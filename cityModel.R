# Simulated city

source("Dispersal_in_Context.R")
set.seed(2155)
kFb = kFmake.mix(p=0, k=2, gamma=1.2, s=1, delta=1.2)
kFq = kFmake.mix(p=0, k=2, gamma=2, s=0.5, delta=1.2)

cityB = cbind(runif(200, -1, 1), runif(200,-1,1)) 
ruralB = cbind(runif(40, -4, 4), runif(40,-4,4)) 

ruralQ = clusters_xy(ruralB,5,.5)
ruralQ1 = cbind(runif(80, -4, 4), runif(80,-4,4)) 
cityQ = cbind(runif(3, -1.2, 1.2), runif(3,-1.2,1.2)) 

bb = rbind(cityB, ruralB)
qq = rbind(cityQ, ruralQ, ruralQ1)

cityModel = makeModel_BQ(bb, qq, kFb, kFq)
save(cityModel, file = "cityModel.rda")

par(mfrow = c(1,2))
#tilesGraph(cityModel, cityModel$Kbb_net)
plotPoints(cityModel, adj=1, bwts=cityModel$B, qwts=cityModel$Q, mtl = "VC")
modConvexHulls(cityModel,cityModel$VC_net)
#tilesGraph(cityModelel, cityModelel$Kqq_net)
plotPoints(cityModel, adj=1, bwts=cityModel$B, qwts=cityModel$Q, mtl = "GG")
modConvexHulls(cityModel,cityModel$GG_net)
#KxyProfiles(cityModel)
#KxxProfiles(cityModel)
