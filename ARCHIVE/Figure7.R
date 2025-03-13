
source ("Dispersal_in_Context.R")
require(igraph)
require(deldir)

load("Models/mod1.rda")

ix = which(cut_at(mod1$GG_net$clusters_walktrap, 17) == 3)

qq = mod1$q[ix,]
edges = mod1$GG[ix,][,ix]
sym = pmax(edges, t(edges)) 
flw = sym-edges
wts = colSums(edges)
#arrowsX2X(qq, sym)
plot(qq, type = "n")
bentArrowsX2X(qq, edges, bbend=2.5, clr=turbo(12)[3])
points(qq, cex = 2*wts/max(wts), pch = 19)
#arrowsX2Xv2(qq, t(flw))

#communityArrows(mod1, 4)
