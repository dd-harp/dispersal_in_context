source ("Dispersal_in_Context.R")
require(igraph)
require(deldir)

load("Models/mod1.rda")


set.seed(24)


pdf("Figures/meta.pdf", width=8, height=4.5)

par(mfrow = c(1,2))
plotMeta(mod1, 6, bbend=4, mtl = expression("Potential Parasite Dispersal, Population"))
plotMeta(mod1, 4, bbend=4, mtl = expression("Lifetime Egg Dispersal, Population"))

dev.off(dev.cur())

pdf("Figures/metaN15.pdf", width=8, height=4.5)

par(mfrow = c(1,2))
plotMeta(mod1, 6, cut=15, bbend=4, mtl = expression("Potential Parasite Dispersal, Population"))
plotMeta(mod1, 4, cut=15, bbend=4, mtl = expression("Lifetime Egg Dispersal, Population"))

dev.off(dev.cur())

