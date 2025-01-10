
source ("Dispersal_in_Context.R")

kFb = kFmake.exp(k=2, s=1, gamma=1.5)
kFq = kFmake.exp(k=2, s=2, gamma=2)

set.seed(24328)
bb = unif_xy(120, -10, 10) 
qq = unif_xy(111, -10, 10) 
small_mod = makeModel_BQ(bb, qq, kFb, kFq)

save(small_mod, file = "small_mod.rda")

