

kFb = kFmake.exp(k=2, s=1, gamma=1.5)
kFq = kFmake.exp(k=2, s=2, gamma=2)

set.seed(24328)
bb = cbind(runif(256, -17, 17), runif(256, -17, 17))
qq = cbind(runif(289, -17, 17), runif(289, -17, 17))
mod1 = makeModel_BQ(bb, qq, kFb, kFq)

save(mod1, file = "mod1.rda")

