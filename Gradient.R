
# Model 2
purl("Dispersal-in-Context-code.Rmd", output = "Dispersal_in_Context.R", documentation = 0, quiet=TRUE)
source("Dispersal_in_Context.R")
set.seed(29387)
dx = 1/21
xmin = ymin = -10
xmax = ymax = 10
bxx = c() 
qxx = c() 
syy = c() 
sxx = c() 
j=0
dx = (xmax - xmin)/21
for (i in -10:10){
   j = j+1
   bx = runif(j, xmin + (j-1)*dx, xmin + j*dx)   
   bxx = c(bxx, bx)  
   qx = runif(j, xmax-(j+1)*dx, xmax-j*dx)   
   qxx = c(qxx, qx) 
   sx = runif(j, -j*dx/2, j*dx/2)   
   sy = runif(j, ymin+(j-1)*dx, ymin + j*dx)   
   syy = c(syy, sy) 
   sxx = c(sxx, sx) 
}
l = length(qxx)
b = cbind(bxx, runif(l, ymin,ymax))
q = cbind(qxx, runif(l, ymin,ymax))
s = cbind(sxx, syy)

b = cbind(runif(10, -10, 10), runif(10,-10,10))
q = cbind(runif(12, -10, 10), runif(12,-10,10))
s = cbind(runif(8, -10, 10), runif(8,-10,10))
#par(mfrow = c(1,1))
#plotPoints_bqs(b, q, s, adj=1)
#kFb = kFmake.exp(k=1.7, s=.25, gamma=1.2)
#kFq = kFmake.exp(k=1.5, s=.5, gamma=1.5)
#kFs = kFmake.exp(k=1.2, s=.1, gamma=1.5)
#dd = seq(0,5, length.out=50)
#plot(dd, kFb(dd), col = "red", type = "l")
#lines(dd, kFq(dd), col = "blue")
#lines(dd, kFs(dd), col = "orange")

#gradMod0 = makeModel_BQ(b,q, kFb, kFq, stayB=0.5, stayQ=0.5) 

gradMod = makeModel_BQS(b,q,s, kFb, kFq, kFs) 

#plotPoints(gradMod0, adj=0.5)
par(mfrow = c(2,2))
GProfile(gradMod0)
with(gradMod0,addP.b(b,adj=0.4)) 
VProfile(gradMod0)
with(gradMod0,addP.q(q,adj=0.4)) 
plotMeta(gradMod0, 3)
plotMeta(gradMod0, 5)

GGProfile(gradMod0)
with(gradMod0,addP.b(b,adj=0.4)) 
VCProfile(gradMod0)
with(gradMod0,addP.q(q,adj=0.4)) 
plotMeta(gradMod0, 4)
plotMeta(gradMod0, 6)

gradMod = makeModel_BQS(b,q,s, kFb, kFq, kFs, stayB=0.5, stayQ=0.5) 

save(gradMod, file="gradMod.rda")
