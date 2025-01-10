
source ("Dispersal_in_Context.R")

kFb = kFmake.exp(k=2, s=1, gamma=1.5)
kFq = kFmake.exp(k=2, s=2, gamma=2)

set.seed(24281)
bb = cbind(runif(110, -17, 17), runif(110, -17, 17)) 
qq = cbind(runif(78, -17, 17), runif(78, -17, 17))
mod2 = makeModel_BQ(bb, qq, kFb, kFq)

save(mod2, file = "mod2.rda")
