
# Model 2
source("Dispersal_Dynamics.R")
set.seed(293)
xmin = ymin = -20
xmax = ymax = 20
nq = 200 
q = cbind(x=runif(nq,xmin,xmax), y=runif(nq,ymin,ymax))
nb = 200 
b = cbind(x=runif(nb,xmin,xmax), y=runif(nb,ymin,ymax))
par(mfrow = c(2,2))
plotPoints_bq(b,q, adj=1)
#kFb = kFmake.mix(.95, k=1, s=.25, gamma=2, .5)
#kFq = kFmake.mix(.9, k=2, s=.5, gamma=1.5, 1.2)
kFb = kFmake.exp(k=1.7, s=.25, gamma=1.2)
kFq = kFmake.exp(k=1.5, s=.5, gamma=1.5)
dd = seq(0,5, length.out=50)
plot(dd, kFb(dd), col = "red", type = "l")
lines(dd, kFq(dd), col = "blue")

Mod2 = makeModel_BQ(b,q,kFb, kFq, stayB=0.5, stayQ=0.5) 

save(Mod2, file="Model2.rda")
